import SpriteKit

public extension SKAction {
	static func animate<T>(
		keyPath: ReferenceWritableKeyPath<T, CGFloat>,
		byValue initialDistance: CGFloat,
		duration: TimeInterval,
		usingSpringWithDamping dampingRatio: CGFloat,
		initialSpringVelocity velocity: CGFloat
	) -> SKAction {
		animate(
			keyPath,
			using: .init(
				target: .changeBy(initialDistance),
				duration: duration,
				dampingRatio: dampingRatio,
				initialVelocity: velocity
			)
		)
	}
	
	static func animate<T>(
		keyPath: ReferenceWritableKeyPath<T, CGFloat>,
		toValue finalValue: CGFloat,
		duration: TimeInterval,
		usingSpringWithDamping dampingRatio: CGFloat,
		initialSpringVelocity velocity: CGFloat
	) -> SKAction {
		animate(
			keyPath,
			using: .init(
				target: .changeTo(finalValue),
				duration: duration,
				dampingRatio: dampingRatio,
				initialVelocity: velocity
			)
		)
	}
}

extension SKAction {
	private static func animate<T>(
		_ keyPath: ReferenceWritableKeyPath<T, CGFloat>,
		using properties: Properties
	) -> SKAction {
		var storedSpring: Spring?
		
		return .customAction(withDuration: properties.duration) { node, elapsedTime in
			guard let holder = node as? T else {
				fatalError("node to animate did not conform to specified type")
			}
			
			let spring: Spring
			if let storedSpring = storedSpring {
				spring = storedSpring
			} else {
				spring = Spring(
					initialValue: holder[keyPath: keyPath],
					using: properties
				)
				storedSpring = spring
			}
			
			holder[keyPath: keyPath] = spring.value(at: elapsedTime)
		}
	}
}

struct Properties {
	let target: Target
	let duration: TimeInterval
	let dampingRatio: CGFloat
	let initialVelocity: CGFloat
	
	enum Target {
		case changeBy(CGFloat)
		case changeTo(CGFloat)
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
	
	init(initialValue: CGFloat, using properties: Properties) {
		self.initialValue = initialValue
		self.dampingRatio = properties.dampingRatio
		
		let initialDistance: CGFloat
		switch properties.target {
		case .changeBy(let distance):
			initialDistance = distance
			finalValue = initialValue + distance
		case .changeTo(let target):
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
			let dampingExp: CGFloat = exp(-dampingRatio * naturalFrequency * time)
			let ADamp: CGFloat = a * cos(dampedFrequency * time)
			let BDamp: CGFloat = b * sin(dampedFrequency * time)
			
			return finalValue - dampingExp * (ADamp + BDamp)
		} else if dampingRatio == 1 {
			let dampingExp: CGFloat = exp(-dampingRatio * naturalFrequency * time)
			
			return finalValue - dampingExp * (a + b * time)
		} else {
			let ADamp: CGFloat = a * exp(-time / t1)
			let BDamp: CGFloat = b * exp(-time / t2)
			return finalValue - ADamp - BDamp
		}
	}
}
