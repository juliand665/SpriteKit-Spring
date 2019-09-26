import SpriteKit

public extension SKAction {
	func usingSpring(with properties: Spring.AnimationProperties) -> Self {
		timingFunction = Spring.timingFunction(with: properties)
		return self
	}
}

private typealias FloatLiteralType = Float

public enum Spring {
	public static func timingFunction(with properties: AnimationProperties) -> SKActionTimingFunction {
		// lots of math adapted from http://www.ryanjuckett.com/programming/damped-springs/
		
		let damping = Damping(ratio: properties.dampingRatio)
		let naturalFrequency = damping.naturalFrequency
		let initialVelocity = -properties.initialVelocity // flipped because these formulas assume resting position at 0
		
		switch damping {
		case .underdamped(let ratio):
			let dampedFrequency = naturalFrequency * sqrt(1 - ratio * ratio)
			let coefficient = (ratio * naturalFrequency + initialVelocity) / dampedFrequency
			
			return { time in
				let dampingExp = exp(-naturalFrequency * ratio * time)
				let scaledFrequency = dampedFrequency * time
				let dampened1 = cos(scaledFrequency)
				let dampened2 = coefficient * sin(scaledFrequency)
				return 1 - (dampened1 + dampened2) * dampingExp
			}
			
		case .criticallyDamped:
			let coefficient = initialVelocity + naturalFrequency
			
			return { time in
				let dampingExp = exp(-naturalFrequency * time)
				return 1 - (coefficient * time + 1) * dampingExp
			}
			
		case .overdamped(let ratio):
			let root = sqrt(ratio * ratio - 1)
			let z1 = naturalFrequency * (-ratio - root)
			let z2 = naturalFrequency * (-ratio + root)
			let coefficient1 = (initialVelocity - z2) / (z1 - z2)
			let coefficient2 = 1 - coefficient1
			
			return { time in
				let dampened1 = coefficient1 * exp(z1 * time)
				let dampened2 = coefficient2 * exp(z2 * time)
				return 1 - (dampened1 + dampened2)
			}
		}
	}
	
	private enum Damping {
		case underdamped(_ ratio: Float)
		case criticallyDamped
		case overdamped(_ ratio: Float)
		
		var naturalFrequency: Float {
			// picked manually to visually match the behavior of UIKit
			switch self {
			case .underdamped(let ratio):
				return 8 / ratio
			case .criticallyDamped:
				return 10
			case .overdamped(let ratio):
				return 12 * ratio
			}
		}
		
		init(ratio: Float) {
			precondition(ratio > 0, "invalid damping ratio!")
			
			if ratio < 1 {
				self = .underdamped(ratio)
			} else if ratio == 1 {
				self = .criticallyDamped
			} else {
				self = .overdamped(ratio)
			}
		}
	}
	
	public struct AnimationProperties {
		/**
		The ratio of the spring's damping coefficient to its critical damping coefficient.
		
		Possible values:
		- `0`: **undamped**; the spring will never slow down (this is **invalid** and will yield an error)
		- `0..<1`: **underdamped**; the spring will overshoot its resting position at least once
		- `1`: **critically damped**; the spring will reach its resting position in minimal time
		- `1...`: **overdamped**; the spring won't overshoot but will take longer due to being slowed down
		*/
		let dampingRatio: Float
		
		/**
		How fast the spring is initially moving, relative to the total distance to cover and the total duration.
		
		For example, an initial velocity of 2 means the spring would be moving fast enough to cover the entire distance twice over the course of the animation if it were moving at a constant speed.
		*/
		let initialVelocity: Float
		
		/**
		Check out the individual properties' documentation for additional information.
		
		- Parameters:
			- dampingRatio: The ratio of the spring's damping coefficient to its critical damping coefficient.
			- initialVelocity: How fast the spring is initially moving, relative to the total distance to cover and the total duration.
		*/
		public init(dampingRatio: Float, initialVelocity: Float) {
			self.dampingRatio = dampingRatio
			
			self.initialVelocity = initialVelocity
		}
	}
}
