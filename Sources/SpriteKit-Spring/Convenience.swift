import SpriteKit

// MARK: - Move

public extension SKAction {
	static func move(by delta: CGVector, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .changeBy(delta.dx), using: properties),
			animate(\SKNode.position.y, .changeBy(delta.dy), using: properties),
		])
	}
	
	static func move(to location: CGPoint, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .changeTo(location.x), using: properties),
			animate(\SKNode.position.y, .changeTo(location.y), using: properties),
		])
	}
	
	static func moveBy(x deltaX: CGFloat, y deltaY: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.position.x, .changeBy(deltaX), using: properties),
			animate(\SKNode.position.y, .changeBy(deltaY), using: properties),
		])
	}
	
	static func moveTo(x: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.position.x, .changeTo(x), using: properties)
	}
	
	static func moveTo(y: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.position.y, .changeTo(y), using: properties)
	}
}

// MARK: - Rotate

public extension SKAction {
	static func rotate(byAngle radians: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.zRotation, .changeBy(radians), using: properties)
	}
	
	static func rotate(toAngle radians: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.zRotation, .changeTo(radians), using: properties)
	}
}

// MARK: - Speed

public extension SKAction {
	static func speed(by speed: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.speed, .changeBy(speed), using: properties)
	}
	
	static func speed(to speed: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.speed, .changeTo(speed), using: properties)
	}
}

// MARK: - Scale

public extension SKAction {
	static func scale(by scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		scaleX(by: scale, y: scale, using: properties)
	}
	
	static func scale(to scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		scaleX(to: scale, y: scale, using: properties)
	}
	
	static func scaleX(by xScale: CGFloat, y yScale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKNode.xScale, .changeBy(xScale), using: properties),
			animate(\SKNode.yScale, .changeBy(yScale), using: properties),
		])
	}
	
	static func scaleX(to scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.xScale, .changeTo(scale), using: properties)
	}
	
	static func scaleY(to scale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.yScale, .changeTo(scale), using: properties)
	}
	
	static func scaleX(to xScale: CGFloat, y yScale: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			scaleX(to: xScale, using: properties),
			scaleY(to: yScale, using: properties),
		])
	}
}

// MARK: - Fade

public extension SKAction {
	static func fadeIn(using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .changeTo(1), using: properties)
	}
	
	static func fadeOut(using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .changeTo(0), using: properties)
	}
	
	static func fadeAlpha(by factor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .changeBy(factor), using: properties)
	}
	
	static func fadeAlpha(to factor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKNode.alpha, .changeTo(factor), using: properties)
	}
}

// MARK: - Resize

public extension SKAction {
	static func resize(toWidth width: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.size.width, .changeTo(width), using: properties)
	}
	
	static func resize(toHeight height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.size.height, .changeTo(height), using: properties)
	}
	
	static func resize(byWidth width: CGFloat, height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			animate(\SKSpriteNode.size.width, .changeBy(width), using: properties),
			animate(\SKSpriteNode.size.height, .changeBy(height), using: properties),
		])
	}
	
	static func resize(toWidth width: CGFloat, height: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		.group([
			resize(toWidth: width, using: properties),
			resize(toHeight: height, using: properties),
		])
	}
}

// MARK: - Colorize

public extension SKAction {
	static func colorize(withColorBlendFactor colorBlendFactor: CGFloat, using properties: SpringAnimationProperties) -> SKAction {
		animate(\SKSpriteNode.colorBlendFactor, .changeTo(colorBlendFactor), using: properties)
	}
}
