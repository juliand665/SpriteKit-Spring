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
