//
//  AIGameControls.swift
//  TicTacToe
//
//  Created by María del Pilar López Pacheco on 8/2/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct AIGameControls {
    
    let aiGameScene: AIGameScene!
    
    /// Buttons and Labels
    let buttonReplay: SKSpriteNode
    let buttonMenu: SKSpriteNode
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
    
    init(inThisScene: AIGameScene) {
        
        aiGameScene = inThisScene
        
        /// Replay  Button
        buttonReplay = SKSpriteNode.init(imageNamed: "ButtonReplay")
        buttonReplay.name = "buttonSprite-Replay"
        buttonReplay.zPosition = 3
        buttonReplay.position = CGPoint(x: aiGameScene.size.width*0.5/20, y: -(aiGameScene.size.height*3.5/10))
        
        /// Return Menu Button
        buttonMenu = SKSpriteNode.init(imageNamed: "ButtonMenu")
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        buttonMenu.position = CGPoint(x: inThisScene.size.width*0.5/20, y: -(inThisScene.size.height*4.3/10))
        
        /// Player X turn
        turnX = SKSpriteNode.init(imageNamed: "TurnX")
        turnX.name = "buttonSprite-TurnX"
        turnX.zPosition = 7
        turnX.position = CGPoint(x: aiGameScene.size.width*0.1/20, y: (aiGameScene.size.height*15/40))
        
        /// Player X wins
        turnXWin = SKSpriteNode.init(imageNamed: "XWins")
        turnXWin.name = "buttonSprite-TurnX"
        turnXWin.zPosition = 7
        turnXWin.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height*2/40))
        
        /// Player O turn
        turnO = SKSpriteNode.init(imageNamed: "TurnO")
        turnO.name = "buttonSprite-TurnO"
        turnO.zPosition = 7
        turnO.position = CGPoint(x: aiGameScene.size.width*0.1/20, y: (aiGameScene.size.height*15/40))
        
        /// Player O wins
        turnOWin = SKSpriteNode.init(imageNamed: "OWins")
        turnOWin.name = "buttonSprite-TurnX"
        turnOWin.zPosition = 7
        turnOWin.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height*35/40))
        
        /// TIE
        tie = SKSpriteNode.init(imageNamed: "TIE")
        tie.name = "buttonSprite-TurnX"
        tie.zPosition = 7
        tie.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height*35/40))
        
        lineh = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        lineh.name = "horizontal"
        lineh.zPosition = 6
        lineh.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/2))
        lineh.isHidden = true
        
        linehtop = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        linehtop.name = "horizontal-top"
        linehtop.zPosition = 6
        linehtop.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/1.48))
        linehtop.isHidden = true
        
        linehbot = SKSpriteNode.init(imageNamed: "Arrow Horizontal")
        linehbot.name = "horizontal-bottom"
        linehbot.zPosition = 6
        linehbot.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/3.1))
        linehbot.isHidden = true
        
        linev = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linev.name = "vertical"
        linev.zPosition = 6
        linev.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/2))
        linev.isHidden = true
        
        linevleft = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linevleft.name = "vertical-left"
        linevleft.zPosition = 6
        linevleft.position = CGPoint(x: aiGameScene.size.width/5, y: (aiGameScene.size.height/2))
        linevleft.isHidden = true
        
        linevright = SKSpriteNode.init(imageNamed: "Arrow Vertical")
        linevright.name = "vertical-right"
        linevright.zPosition = 6
        linevright.position = CGPoint(x: aiGameScene.size.width/1.25, y: (aiGameScene.size.height/2))
        linevright.isHidden = true
        
        diag = SKSpriteNode.init(imageNamed: "Arrow Diagonal 1")
        diag.name = "diag"
        diag.zPosition = 6
        diag.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/2))
        diag.isHidden = true
        
        diag2 = SKSpriteNode.init(imageNamed: "Arrow Diagonal 2")
        diag2.name = "inversediag"
        diag2.zPosition = 6
        diag2.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height/2))
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
        message.position = CGPoint(x: aiGameScene.size.width/2, y: (aiGameScene.size.height*18/20))
        
        /// Resizing buttons
        let resizeFactorX:CGFloat = aiGameScene.size.width/407.0
        let resizeFactorY:CGFloat = aiGameScene.size.height/599.0
        let originalSize = buttonReplay.size
        buttonReplay.size = CGSize(width: originalSize.width*resizeFactorX/2.5, height: originalSize.height*resizeFactorY/2.8)
        buttonMenu.size = CGSize(width: originalSize.width*resizeFactorX/3, height: originalSize.height*resizeFactorY/3)
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
        
        /// Resizing Net
        let resizeFactorDiagX: CGFloat = aiGameScene.size.width/818.0
        let resizeFactorDiagY: CGFloat = aiGameScene.size.height/889.0
        let diagOriginalSize = diag.size
        diag.size = CGSize(width: diagOriginalSize.width*resizeFactorDiagX/1.2, height: diagOriginalSize.height*resizeFactorDiagY/1.9)
        diag2.size = CGSize(width: diagOriginalSize.width*resizeFactorDiagX/1.2, height: diagOriginalSize.height*resizeFactorDiagY/1.9)
        
        /// Resizing Won Lines
        let resizeFactorLineX: CGFloat = aiGameScene.size.width/818.0
        let resizeFactorLineY: CGFloat = aiGameScene.size.height/889.0
        let lineOriginalSize = lineh.size
        lineh.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linehtop.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linehbot.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/1.2, height: lineOriginalSize.height*resizeFactorLineY/1.2)
        linev.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        linevleft.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        linevright.size = CGSize(width: lineOriginalSize.width*resizeFactorLineX/20, height: lineOriginalSize.height*resizeFactorLineY*14)
        
        
    }
    
}

