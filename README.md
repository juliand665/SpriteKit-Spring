SpriteKitSpring
================

SpriteKitSpring is a set of extensions to perform spring animations with SpriteKit.

## Installation

This project uses the Swift Package Manager. Simply add `.package(url: "https://github.com/juliand665/SpriteKitSpring.git", .branch("master"))` to the overall `dependencies` and `"SpriteKitSpring"` to the target-specific `dependencies` in your `Package.swift` file.

#### Swift:
```swift
import SpriteKit_Spring
```
## Usage

In iOS 7, Apple introduced spring animations in UIKit by adding a new animation method on UIView (see [UIView documentation](https://developer.apple.com/documentation/uikit/uiview/1622594-animate)).

This library replicates this feature by adding a spring variant to most factory methods of SKAction. It's not perfect, but it aims to mimic UIKit behavior as closely as possible.

## Caveats

While generally `SKAction`s are expected to be reusable, that is all but impossible with custom actions due to the way SpriteKit calls them. So you'll have to make do with **creating a new action every time you run one**, or else you're going to run into undefined behavior (it might work in some specific cases, but as a rule of thumb, it doesn't).

## Examples

### Move

```swift
node.run(
	.moveBy(
		x: 0, y: 200,
		using: SKAction.SpringAnimationSettings(
			duration: 5,
			dampingRatio: 0.2,
			initialVelocity: 0
		)
	)
)
```

![Move](https://ataugeron.github.io/SpriteKit-Spring/bounce_1.gif)

### Scale

```swift
node.run(
	.scaleTo(
		x: 2, y: 0.5,
		using: SKAction.SpringAnimationSettings(
			duration: 5,
			dampingRatio: 0.2,
			initialVelocity: 0
		)
	)
)
```

![Scale](https://ataugeron.github.io/SpriteKit-Spring/bounce_2.gif)

### Rotate

```swift
node.run(
	.rotate(
		byAngle: .pi / 2,
		using: SKAction.SpringAnimationSettings(
			duration: 5,
			dampingRatio: 0.2,
			initialVelocity: 0
		)
	)
)
```

![Rotate](https://ataugeron.github.io/SpriteKit-Spring/bounce_3.gif)

## Notes

- Because they use `customAction(withDuration:actionBlock:)`, none of these actions are reversible (the reverse action performs the same animation).
- All these factory methods are based on the lower-level `animate(_:_:using:)` method, which can animate any CGFloat key path. If you have an SKNode subclass with a fancy CGFloat property that you'd like to animate, feel free to use these methods!

## Credits

- Original Creator: [Alexis Taugeron](http://alexistaugeron.com) ([@ataugeron](https://twitter.com/ataugeron))
- Refactor & SwiftPM Support: [Julian Dunskus](https://github.com/juliand665) ([@juliand665](https://twitter.com/juliand665))

## License

SpriteKitSpring is released under the Apache 2 license. See LICENSE for details.
