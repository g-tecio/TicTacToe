//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct DifficultyControls {
	
	/// Title Label
	let titleLabel: SKSpriteNode
	
	/// Easy Mode Game Button
	let buttonEasy: SKSpriteNode
    
    /// Hard Mode Game Button
    let buttonHard:SKSpriteNode
    
//    /// Return Menu Button
//    let buttonMenu:SKSpriteNode
    
    /// Background Image
    let background: SKSpriteNode
	
	init(inThisScene: DifficultyScene) {
		
		/// Title Label
        titleLabel = SKSpriteNode.init(imageNamed: "Difficulty")
        titleLabel.name = "label-Title"
        titleLabel.zPosition = 2
        titleLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/1.4))
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Play  Button
        buttonEasy = SKSpriteNode.init(imageNamed: "ButtonEasy")
        buttonEasy.name = "buttonSprite-Easy"
        buttonEasy.zPosition = 3
        buttonEasy.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*6/15))
		
		/// Instructions  Button
		buttonHard = SKSpriteNode.init(imageNamed: "ButtonHard")
		buttonHard.name = "buttonSprite-Hard"
		buttonHard.zPosition = 3
		buttonHard.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*4/15))
        
//        /// Instructions  Button
//        buttonMenu = SKSpriteNode.init(imageNamed: "ButtonMenu")
//        buttonMenu.name = "buttonSprite-Menu"
//        buttonMenu.zPosition = 3
//        buttonMenu.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*2/15))
		
        
        /// Resizing Buttons
        let resizeFactorX:CGFloat = inThisScene.size.width/380.0
        let resizeFactorY:CGFloat = inThisScene.size.height/850.0
        let originalSize = buttonEasy.size
        buttonEasy.size = CGSize(width: originalSize.width*resizeFactorX/3, height: originalSize.height*resizeFactorY/2.5)
        buttonHard.size = CGSize(width: originalSize.width*resizeFactorX/3, height: originalSize.height*resizeFactorY/2.5)
        
//        /// Resizing Menu Buttons
//        let resizeFactorMenuX:CGFloat = inThisScene.size.width/380.0
//        let resizeFactorMenuY:CGFloat = inThisScene.size.height/850.0
//        let originalSizeMenu = buttonMenu.size
//        buttonMenu.size = CGSize(width: originalSizeMenu.width*resizeFactorMenuX/3.5, height: originalSizeMenu.height*resizeFactorMenuY/2.5)
        
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
