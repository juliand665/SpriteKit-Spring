import UIKit
import SpriteKit

let formatter = NumberFormatter() <- {
	$0.minimumFractionDigits = 3
	$0.maximumFractionDigits = 3
}

final class ViewController: UIViewController {
	@IBOutlet private var dampingSlider: UISlider!
	@IBOutlet private var dampingLabel: UILabel!
	
	@IBOutlet private var sceneView: SKView!
	@IBOutlet private var movementContainer: UIView!
	@IBOutlet private var movingView: UIView!
	@IBOutlet private var movementConstraint: NSLayoutConstraint!
	
	@IBAction private func animate() {
		let ratio = CGFloat(dampingSlider.value)
		guard ratio > 0 else { return }
		
		scene.animate(dampingRatio: ratio)
		
		let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: ratio) <- {
			let heightDifference = movementContainer.frame.height - movingView.frame.height
			let isAtBottom = movementConstraint.constant == 0
			$0.addAnimations {
				self.movementConstraint.constant = isAtBottom ? heightDifference : 0
				self.movementContainer.layoutIfNeeded()
			}
		}
		
		// spritekit seems to have some delay, so we'll mimic that here
		animator.startAnimation(afterDelay: 0.042)
	}
	
	private let scene = Scene()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		sceneView.presentScene(scene)
		
		updateLabel()
	}
	
	@IBAction func updateLabel() {
		dampingLabel.text = formatter.string(from: dampingSlider.value as NSNumber)!
	}
}

let unit: CGFloat = 25

final class Scene: SKScene {
	lazy var node = SKShapeNode(rectOf: CGSize(width: 4 * unit, height: 4 * unit)) <- {
		$0.fillColor = .systemIndigo
		$0.strokeColor = .clear
		$0.position = CGPoint(x: 2 * unit, y: 2 * unit)
	}
	
	override init() {
		super.init(size: CGSize(width: 4 * unit, height: 12 * unit))
		
		backgroundColor = .clear
		
		SKShapeNode(rectOf: size) <- {
			$0.fillColor = .systemIndigo
			$0.strokeColor = .clear
			$0.alpha = 0.2
			$0.position = CGPoint(x: size.width / 2, y: size.height / 2)
			$0.zPosition = -100
			addChild($0)
		}
		
		addChild(node)
		
		let xScale: CGFloat = 0.5
		let yScale: CGFloat = 0.25
		node.xScale = xScale
		node.yScale = yScale
		// these concurrent relative scale actions work just fine!
		node.run(.sequence([
			.wait(forDuration: 1),
			.group([
				.scaleBy(
					x: pow(xScale, -2/3.0), y: pow(yScale, -1/4.0),
					using: .init(
						duration: 1.5,
						dampingRatio: 0.4,
						initialVelocity: -10
					)
				),
				.scaleBy(
					x: pow(xScale, -1/3.0), y: pow(yScale, -3/4.0),
					using: .init(
						duration: 4,
						dampingRatio: 0.2,
						initialVelocity: 0
					)
				),
			]),
		]))
	}
	
	required init?(coder: NSCoder) {
		fatalError("unimplemented")
	}
	
	private var shouldMoveUp = true
	func animate(dampingRatio: CGFloat) {
		let settings = SKAction.SpringAnimationSettings(
			duration: 1,
			dampingRatio: dampingRatio,
			initialVelocity: 0
		)
		node.run(.moveBy(x: 0, y: (shouldMoveUp ? 1 : -1) * 8 * unit, using: settings))
		shouldMoveUp.toggle()
	}
}
