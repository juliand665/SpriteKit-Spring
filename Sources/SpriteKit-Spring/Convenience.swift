import SpriteKit

// MARK: - Move

public extension SKAction {
	static func move(by delta: CGVector, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .add(delta.dx), using: properties),
			animate(\SKNode.position.y, .add(delta.dy), using: properties),
		])
	}
	
	static func move(to location: CGPoint, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .change(to: location.x), using: properties),
			animate(\SKNode.position.y, .change(to: location.y), using: properties),
		])
	}
	
	static func moveBy(x deltaX: CGFloat, y deltaY: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .add(deltaX), using: properties),
			animate(\SKNode.position.y, .add(deltaY), using: properties),
		])
	}
	
	static func moveTo(x: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.position.x, .change(to: x), using: properties)
	}
	
	static func moveTo(y: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.position.y, .change(to: y), using: properties)
	}
}

// MARK: - Rotate

public extension SKAction {
	static func rotate(byAngle radians: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.zRotation, .add(radians), using: properties)
	}
	
	static func rotate(toAngle radians: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.zRotation, .change(to: radians), using: properties)
	}
}

// MARK: - Speed

public extension SKAction {
	static func speed(by speed: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.speed, .multiply(by: speed), using: properties)
	}
	
	static func speed(to speed: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.speed, .change(to: speed), using: properties)
	}
}

// MARK: - Scale

public extension SKAction {
	static func scale(by scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		scaleBy(x: scale, y: scale, using: properties)
	}
	
	static func scale(to scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		scaleTo(x: scale, y: scale, using: properties)
	}
	
	static func scaleBy(x: CGFloat, y: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.xScale, .multiply(by: x), using: properties),
			animate(\SKNode.yScale, .multiply(by: y), using: properties),
		])
	}
	
	static func scaleTo(x scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.xScale, .change(to: scale), using: properties)
	}
	
	static func scaleTo(y scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.yScale, .change(to: scale), using: properties)
	}
	
	static func scaleTo(x: CGFloat, y: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			scaleTo(x: x, using: properties),
			scaleTo(y: y, using: properties),
		])
	}
}

// MARK: - Fade

public extension SKAction {
	static func fadeIn(using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .change(to: 1), using: properties)
	}
	
	static func fadeOut(using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .change(to: 0), using: properties)
	}
	
	static func fadeAlpha(by factor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .multiply(by: factor), using: properties)
	}
	
	static func fadeAlpha(to factor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .change(to: factor), using: properties)
	}
}

// MARK: - Resize

public extension SKAction {
	static func resizeTo(width: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.size.width, .change(to: width), using: properties)
	}
	
	static func resizeTo(height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.size.height, .change(to: height), using: properties)
	}
	
	static func resizeBy(width: CGFloat, height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKSpriteNode.size.width, .add(width), using: properties),
			animate(\SKSpriteNode.size.height, .add(height), using: properties),
		])
	}
	
	static func resizeTo(width: CGFloat, height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			resizeTo(width: width, using: properties),
			resizeTo(height: height, using: properties),
		])
	}
}

// MARK: - Colorize

public extension SKAction {
	static func colorize(withColorBlendFactor colorBlendFactor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.colorBlendFactor, .change(to: colorBlendFactor), using: properties)
	}
}
