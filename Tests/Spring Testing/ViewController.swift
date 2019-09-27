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

let unit: CGFloat = 100

final class Scene: SKScene {
	lazy var node = SKShapeNode(rectOf: CGSize(width: unit, height: unit)) <- {
		$0.fillColor = .systemIndigo
		$0.strokeColor = .clear
		$0.position = CGPoint(x: unit / 2, y: unit / 2)
	}
	
	override init() {
		super.init(size: CGSize(width: unit, height: 3 * unit))
		
		backgroundColor = .clear
		
		addChild(node)
		
		SKShapeNode(rectOf: size) <- {
			$0.fillColor = .systemIndigo
			$0.strokeColor = .clear
			$0.alpha = 0.2
			$0.position = CGPoint(x: unit * 0.5, y: unit * 1.5)
			addChild($0)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("unimplemented")
	}
	
	private var shouldMoveUp = true
	func animate(dampingRatio: CGFloat) {
		let settings = SKAction.SpringAnimationSettings(
			duration: 1,
			springProperties: .init(
				dampingRatio: dampingRatio,
				initialVelocity: 0
			)
		)
		node.run(.moveBy(x: 0, y: (shouldMoveUp ? 2 : -2) * unit as CGFloat, using: settings))
		shouldMoveUp.toggle()
	}
}
