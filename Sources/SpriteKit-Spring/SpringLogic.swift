import SpriteKit

public extension SKAction {
	static func animate<Node>(
		_ keyPath: ReferenceWritableKeyPath<Node, CGFloat>,
		_ target: ValueTransformation,
		using properties: SpringAnimationProperties
	) -> SKAction where Node: SKNode {
		var storedSpring: Spring?
		
		return .customAction(withDuration: properties.duration) { node, elapsedTime in
			guard let node = node as? Node else {
				fatalError("node to animate did not conform to specified type")
			}
			
			let spring: Spring
			if let storedSpring = storedSpring {
				spring = storedSpring
			} else {
				spring = Spring(
					target,
					initialValue: node[keyPath: keyPath],
					using: properties
				)
				storedSpring = spring
			}
			
			node[keyPath: keyPath] = spring.value(at: elapsedTime)
		}
	}
	
	enum ValueTransformation {
		case change(to: CGFloat)
		case add(CGFloat)
		case multiply(by: CGFloat)
	}

	struct SpringAnimationProperties {
		let target: ValueTransformation
		let duration: TimeInterval
		let dampingRatio: CGFloat
		let initialVelocity: CGFloat
	}
}

private struct Spring {
	private var initialValue: CGFloat
	private var finalValue: CGFloat
	private var dampingRatio: CGFloat
	private var naturalFrequency: CGFloat
	private var dampedFrequency: CGFloat
	private var t1, t2: CGFloat
	private var a, b: CGFloat
	
	init(
		_ transformation: SKAction.ValueTransformation,
		initialValue: CGFloat,
		using properties: SKAction.SpringAnimationProperties
	) {
		self.initialValue = initialValue
		self.dampingRatio = properties.dampingRatio
		
		let initialDistance: CGFloat
		switch transformation {
		case .add(let offset):
			initialDistance = offset
			finalValue = initialValue + offset
		case .multiply(by: let factor):
			finalValue = initialValue * factor
			initialDistance = finalValue - initialValue
		case .change(to: let target):
			initialDistance = target - initialValue
			finalValue = target
		}
		
		let magicNumber: CGFloat // picked manually to visually match the behavior of UIKit
		if dampingRatio < 1 {
			magicNumber = 8 / dampingRatio
		} else if dampingRatio == 1 {
			magicNumber = 10
		} else {
			magicNumber = 12 * dampingRatio
		}
		
		naturalFrequency = magicNumber / CGFloat(properties.duration)
		dampedFrequency = naturalFrequency * sqrt(1 - pow(dampingRatio, 2))
		t1 = 1 / (naturalFrequency * (dampingRatio - sqrt(pow(dampingRatio, 2) - 1)))
		t2 = 1 / (naturalFrequency * (dampingRatio + sqrt(pow(dampingRatio, 2) - 1)))
		
		let initialVelocity = properties.initialVelocity
		if dampingRatio < 1 {
			a = initialDistance
			b = (dampingRatio * naturalFrequency - initialVelocity) * initialDistance / dampedFrequency
		} else if dampingRatio == 1 {
			a = initialDistance
			b = (naturalFrequency - initialVelocity) * initialDistance
		} else {
			a = (t1 * t2 / (t1 - t2))
			a *= initialDistance * (1/t2 - initialVelocity)
			b = (t1 * t2 / (t2 - t1))
			b *= initialDistance * (1/t1 - initialVelocity)
		}
	}
	
	func value(at time: CGFloat) -> CGFloat {
		if dampingRatio < 1 {
			let dampingExp = exp(-dampingRatio * naturalFrequency * time)
			let dampenedA = a * cos(dampedFrequency * time)
			let dampenedB = b * sin(dampedFrequency * time)
			
			return finalValue - dampingExp * (dampenedA + dampenedB)
		} else if dampingRatio == 1 {
			let dampingExp = exp(-dampingRatio * naturalFrequency * time)
			
			return finalValue - dampingExp * (a + b * time)
		} else {
			let ADamp = a * exp(-time / t1)
			let BDamp = b * exp(-time / t2)
			return finalValue - ADamp - BDamp
		}
	}
}
