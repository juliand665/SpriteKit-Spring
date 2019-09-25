import SpriteKit

// MARK: - Move

public extension SKAction {
	static func move(by delta: CGVector, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			animate(keyPath: \SKNode.position.x, byValue: delta.dx, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			animate(keyPath: \SKNode.position.y, byValue: delta.dy, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
	
	static func move(to location: CGPoint, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			animate(keyPath: \SKNode.position.x, toValue: location.x, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			animate(keyPath: \SKNode.position.y, toValue: location.y, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
	
	static func moveBy(x deltaX: CGFloat, y deltaY: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			animate(keyPath: \SKNode.position.x, byValue: deltaX, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			animate(keyPath: \SKNode.position.y, byValue: deltaY, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
	
	static func moveTo(x: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.position.x, toValue: x, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func moveTo(y: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.position.y, toValue: y, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
}


// MARK: - Rotate

public extension SKAction {
	static func rotate(byAngle radians: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.zRotation, byValue: radians, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func rotate(toAngle radians: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.zRotation, toValue: radians, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
}


// MARK: - Speed

public extension SKAction {
	static func speed(by speed: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.speed, byValue: speed, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func speed(to speed: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.speed, toValue: speed, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
}


// MARK: - Scale

public extension SKAction {
	static func scale(by scale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		scaleX(by: scale, y: scale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func scale(to scale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		scaleX(to: scale, y: scale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func scaleX(by xScale: CGFloat, y yScale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			animate(keyPath: \SKNode.xScale, byValue: xScale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			animate(keyPath: \SKNode.yScale, byValue: yScale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
	
	static func scaleX(to scale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.xScale, toValue: scale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func scaleY(to scale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.yScale, toValue: scale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func scaleX(to xScale: CGFloat, y yScale: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			scaleX(to: xScale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			scaleY(to: yScale, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
}


// MARK: - Fade

public extension SKAction {
	static func fadeIn(withDuration duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.alpha, toValue: 1, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func fadeOut(withDuration duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.alpha, toValue: 0, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func fadeAlpha(by factor: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.alpha, byValue: factor, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func fadeAlpha(to factor: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKNode.alpha, toValue: factor, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
}


// MARK: - Resize

public extension SKAction {
	static func resize(toWidth width: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKSpriteNode.size.width, toValue: width, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func resize(toHeight height: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKSpriteNode.size.height, toValue: height, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func resize(byWidth width: CGFloat, height: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			animate(keyPath: \SKSpriteNode.size.width, byValue: width, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			animate(keyPath: \SKSpriteNode.size.height, byValue: height, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
	
	static func resize(toWidth width: CGFloat, height: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		.group([
			resize(toWidth: width, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
			resize(toHeight: height, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity),
		])
	}
}


// MARK: - Colorize

public extension SKAction {
	static func colorize(withColorBlendFactor colorBlendFactor: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath: \SKSpriteNode.colorBlendFactor, toValue: colorBlendFactor, duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
}


// MARK: - Damping Logic

public extension SKAction {
	static func animate<T>(keyPath: ReferenceWritableKeyPath<T, CGFloat>, byValue initialDistance: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath, .changeBy(initialDistance), duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	static func animate<T>(keyPath: ReferenceWritableKeyPath<T, CGFloat>, toValue finalValue: CGFloat, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		animate(keyPath, .changeTo(finalValue), duration: duration, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity)
	}
	
	private static func animate<T>(_ keyPath: ReferenceWritableKeyPath<T, CGFloat>, _ target: Target, duration: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat) -> SKAction {
		var storedSpring: Spring?
		
		return .customAction(withDuration: duration) { node, elapsedTime in
			guard let holder = node as? T else {
				fatalError("node to animate did not conform to specified type")
			}
			
			let spring: Spring
			if let storedSpring = storedSpring {
				spring = storedSpring
			} else {
				spring = Spring(
					initialValue: holder[keyPath: keyPath],
					target,
					duration: duration,
					dampingRatio: dampingRatio,
					initialVelocity: velocity
				)
				storedSpring = spring
			}
			
			holder[keyPath: keyPath] = spring.value(at: elapsedTime)
		}
	}
	
	private enum Target {
		case changeBy(CGFloat)
		case changeTo(CGFloat)
	}
	
	private struct Spring {
		private var initialValue: CGFloat
		private var finalValue: CGFloat
		private var dampingRatio: CGFloat
		private var naturalFrequency: CGFloat
		private var dampedFrequency: CGFloat
		private var t1, t2: CGFloat
		private var a, b: CGFloat
		
		init(initialValue: CGFloat, _ target: Target, duration: TimeInterval, dampingRatio: CGFloat, initialVelocity: CGFloat) {
			self.initialValue = initialValue
			self.dampingRatio = dampingRatio
			
			let initialDistance: CGFloat
			switch target {
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
			
			naturalFrequency = magicNumber / CGFloat(duration)
			dampedFrequency = naturalFrequency * sqrt(1 - pow(dampingRatio, 2))
			t1 = 1 / (naturalFrequency * (dampingRatio - sqrt(pow(dampingRatio, 2) - 1)))
			t2 = 1 / (naturalFrequency * (dampingRatio + sqrt(pow(dampingRatio, 2) - 1)))
			
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
}
