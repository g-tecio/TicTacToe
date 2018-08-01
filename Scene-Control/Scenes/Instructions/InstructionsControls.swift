//
//  ConfigControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct InstructionsControls {
	
	/// Title Label
	let titleLabel: SKLabelNode
	
	/// Exit Button and Label
	let buttonSprite:SKSpriteNode
	let buttonLabel: SKLabelNode
	
	init(inThisScene: InstructionsScene) {
		
		/// Title Label
		titleLabel = SKLabelNode.init(text: "Instructions Scene")
		titleLabel.name = "titleLabel-Inst"
		titleLabel.fontName = "Avenir-Heavy"
		titleLabel.horizontalAlignmentMode = .center
		titleLabel.verticalAlignmentMode = .center
		titleLabel.fontColor = .white
		titleLabel.fontSize = 32
		titleLabel.zPosition = 2
		titleLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(3/4)))
		
		/// Exit  Button
		buttonSprite = SKSpriteNode.init(imageNamed: "")
		buttonSprite.name = "buttonSprite-MenuInst"
		buttonSprite.zPosition = 1
		buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*1/13))
		
		/// Resizing depending to screen size
		let resizeFactorX:CGFloat = inThisScene.size.width/380.0
		let resizeFactorY:CGFloat = inThisScene.size.height/850.0
		let originalSize = buttonSprite.size
		buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)
		
		/// Exit Game label
		buttonLabel = SKLabelNode.init(text: "Return to Menu")
		buttonLabel.name = "buttonLabel-MenuInst"
		buttonLabel.fontName = "Avenir-Heavy"
		buttonLabel.horizontalAlignmentMode = .center
		buttonLabel.verticalAlignmentMode = .center
		buttonLabel.fontColor = .white
		buttonLabel.fontSize = 24
		buttonLabel.zPosition = 2
		buttonLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		buttonSprite.addChild(buttonLabel)
	}

}
