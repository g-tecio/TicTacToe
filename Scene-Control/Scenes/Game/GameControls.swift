//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct GameControls {
	
	let gameScene: GameScene!
	
	/// Buttons and Labels
	let buttonReplay: SKSpriteNode
    let buttonExit: SKSpriteNode
    let net: SKSpriteNode
    let background: SKSpriteNode
	let message: SKLabelNode
    
    let turnX: SKSpriteNode
    let turnO: SKSpriteNode
    
    let turnXWin: SKSpriteNode
    let turnOWin: SKSpriteNode
    let tie: SKSpriteNode
    
    let lineh: SKSpriteNode
    let linehtop: SKSpriteNode
    let linehbot: SKSpriteNode
    let linev: SKSpriteNode
    let linevleft: SKSpriteNode
    let linevright: SKSpriteNode
    let diag: SKSpriteNode
    let diag2: SKSpriteNode
	
	init(inThisScene: GameScene) {
		
		gameScene = inThisScene
        
        /// Net Image
        net = SKSpriteNode.init(imageNamed: "Net")
        net.name = "label-Title"
        net.zPosition = 2
        net.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
		
		/// Replay  Button
		buttonReplay = SKSpriteNode.init(imageNamed: "ButtonReplay")
		buttonReplay.name = "buttonSprite-Replay"
		buttonReplay.zPosition = 3
		buttonReplay.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*7/40))
        
        /// Replay  Button
        buttonExit = SKSpriteNode.init(imageNamed: "ButtonExit")
        buttonExit.name = "buttonSprite-Exit"
        buttonExit.zPosition = 3
        buttonExit.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*3/40))
        
        /// Player X turn
        turnX = SKSpriteNode.init(imageNamed: "TurnX")
        turnX.name = "buttonSprite-TurnX"
        turnX.zPosition = 7
        turnX.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*35/40))

        /// Player X wins
        turnXWin = SKSpriteNode.init(imageNamed: "XWins")
        turnXWin.name = "buttonSprite-TurnX"
        turnXWin.zPosition = 7
        turnXWin.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*35/40))
        
        /// Player O turn
        turnO = SKSpriteNode.init(imageNamed: "TurnO")
        turnO.name = "buttonSprite-TurnO"
        turnO.zPosition = 7
        turnO.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*35/40))
        
        /// Player O wins
        turnOWin = SKSpriteNode.init(imageNamed: "OWins")
        turnOWin.name = "buttonSprite-TurnX"
        turnOWin.zPosition = 7
        turnOWin.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*35/40))
        
        /// TIE
        tie = SKSpriteNode.init(imageNamed: "TIE")
        tie.name = "buttonSprite-TurnX"
        tie.zPosition = 7
        tie.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*35/40))
        
        lineh = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        lineh.name = "horizontal"
        lineh.zPosition = 6
        lineh.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        lineh.isHidden = true
        
        linehtop = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        linehtop.name = "horizontal-top"
        linehtop.zPosition = 6
        linehtop.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/1.48))
        linehtop.isHidden = true
        
        linehbot = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        linehbot.name = "horizontal-bottom"
        linehbot.zPosition = 6
        linehbot.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/3.1))
        linehbot.isHidden = true
        
        linev = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linev.name = "vertical"
        linev.zPosition = 6
        linev.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        linev.isHidden = true
        
        linevleft = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linevleft.name = "vertical-left"
        linevleft.zPosition = 6
        linevleft.position = CGPoint(x: gameScene.size.width/5, y: (gameScene.size.height/2))
        linevleft.isHidden = true
        
        linevright = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linevright.name = "vertical-right"
        linevright.zPosition = 6
        linevright.position = CGPoint(x: gameScene.size.width/1.25, y: (gameScene.size.height/2))
        linevright.isHidden = true
        
        diag = SKSpriteNode.init(imageNamed: "Arrow Diagonal 1")
        diag.name = "diag"
        diag.zPosition = 6
        diag.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        diag.isHidden = true
        
        diag2 = SKSpriteNode.init(imageNamed: "Arrow Diagonal 2")
        diag2.name = "inversediag"
        diag2.zPosition = 6
        diag2.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height/2))
        diag2.isHidden = true
        
        /// Label Message
        message = SKLabelNode.init(text: "")
        message.name = "gameMessage"
        message.fontName = "Avenir-Heavy"
        message.horizontalAlignmentMode = .center
        message.verticalAlignmentMode = .center
        message.fontColor = .white
        message.fontSize = 80
        message.zPosition = 6
        message.position = CGPoint(x: gameScene.size.width/2, y: (gameScene.size.height*18/20))
        
        /// Resizing buttons
        let resizeFactorX:CGFloat = gameScene.size.width/407.0
        let resizeFactorY:CGFloat = gameScene.size.height/599.0
        let originalSize = buttonReplay.size
        buttonReplay.size = CGSize(width: originalSize.width*resizeFactorX/2.5, height: originalSize.height*resizeFactorY/2.8)
        buttonExit.size = CGSize(width: originalSize.width*resizeFactorX/3.4, height: originalSize.height*resizeFactorY/3.2)
        turnX.size = CGSize(width: originalSize.width*resizeFactorX/1.5
            , height: originalSize.height*resizeFactorY/2.2)
        turnO.size = CGSize(width: originalSize.width*resizeFactorX/1.5
            , height: originalSize.height*resizeFactorY/2.2)
        turnXWin.size = CGSize(width: originalSize.width*resizeFactorX/1.4
            , height: originalSize.height*resizeFactorY/2.6)
        turnOWin.size = CGSize(width: originalSize.width*resizeFactorX/1.4
            , height: originalSize.height*resizeFactorY/2.6)
        tie.size = CGSize(width: originalSize.width*resizeFactorX/5
            , height: originalSize.height*resizeFactorY/2.6)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = gameScene.size.width/384.0
        let resizeFactorBgY:CGFloat = gameScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
        /// Resizing Net
        let resizeFactorNetX:CGFloat = gameScene.size.width/818.0
        let resizeFactorNetY:CGFloat = gameScene.size.height/889.0
        let netOriginalSize = net.size
        net.size = CGSize(width: netOriginalSize.width*resizeFactorNetX/1.2, height: netOriginalSize.height*resizeFactorNetY/1.9)
        diag.size = CGSize(width: netOriginalSize.width*resizeFactorNetX/1.2, height: netOriginalSize.height*resizeFactorNetY/1.9)
        diag2.size = CGSize(width: netOriginalSize.width*resizeFactorNetX/1.2, height: netOriginalSize.height*resizeFactorNetY/1.9)
        
        /// Resizing Won Lines
        let resizeFactorLineX:CGFloat = gameScene.size.width/818.0
        let resizeFactorLineY:CGFloat = gameScene.size.height/889.0
        let lineOriginalSize = lineh.size
        lineh.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linehtop.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linehbot.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linev.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        linevleft.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        linevright.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        

	}
	
}
