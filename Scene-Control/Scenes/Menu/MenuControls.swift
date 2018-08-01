//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct MenuControls {
	
	/// Title Label
	let titleLabel: SKSpriteNode
	
	/// Exit Button and Label
	let buttonSprite: SKSpriteNode
    
    /// Game Button
    let buttonGame:SKSpriteNode
    
    /// Background Image
    let background: SKSpriteNode
	
	init(inThisScene: MenuScene) {
		
		/// Title Label
        titleLabel = SKSpriteNode.init(imageNamed: "Title")
        titleLabel.name = "label-Title"
        titleLabel.zPosition = 2
        titleLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/1.4))
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Play  Button
        buttonGame = SKSpriteNode.init(imageNamed: "ButtonPlay")
        buttonGame.name = "buttonSprite-Game"
        buttonGame.zPosition = 3
        buttonGame.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*5/15))
		
		/// Instructions  Button
		buttonSprite = SKSpriteNode.init(imageNamed: "Button2Players")
		buttonSprite.name = "buttonSprite-2Players"
		buttonSprite.zPosition = 3
		buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*3/15))
        
        /// Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/380.0
        let resizeFactorY:CGFloat = inThisScene.size.height/850.0
        let originalSize = buttonSprite.size
        buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX/3, height: originalSize.height*resizeFactorY/2.5)
        buttonGame.size = CGSize(width: originalSize.width*resizeFactorX/3, height: originalSize.height*resizeFactorY/2.5)
        
        /// Resizing Title
        let resizeFactorTitleX:CGFloat = inThisScene.size.width/818.0
        let resizeFactorTitleY:CGFloat = inThisScene.size.height/889.0
        let titleOriginalSize = titleLabel.size
        titleLabel.size = CGSize(width: titleOriginalSize.width*resizeFactorTitleX/1.2, height: titleOriginalSize.height*resizeFactorTitleY/1.9)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = inThisScene.size.width/384.0
        let resizeFactorBgY:CGFloat = inThisScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
	}

}
