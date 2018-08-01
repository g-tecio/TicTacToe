//
//  AIGameScene.swift
//  TicTacToe
//
//  Created by Luis Reyes on 7/31/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class AIGameScene: SKScene {
    
    var gameViewController: GameViewController!
    
    /// Custom Initializer
    init(sceneSize: CGSize, referenceGVC: GameViewController) {
        
        /// Set reference of GameViewControl
        gameViewController = referenceGVC
        
        /// Create scene from code
        super.init(size: sceneSize)
        
        
        /// Load scene
        if let skView = gameViewController.view as! SKView? {
            self.size = skView.bounds.size
            self.scaleMode = .fill
            
            // TODO: Comment or remove before release to App Store
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
        }
    }
    
    /// Included because is a requisite if a custom Init is used
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    var boardNode: SKSpriteNode!
    
    var gamePieceNodes = [SKNode]()
    
    var board = Board()
    var strategist: Strategist!
    
    
    let buttonMenu = SKSpriteNode(imageNamed: "ButtonMenu")
    let turnO = SKSpriteNode(imageNamed: "TurnO")
    let turnX = SKSpriteNode(imageNamed: "TurnX")
    
    // MARK: - Scene Loading
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let backgroundNode = SKSpriteNode(imageNamed: "Background")
        backgroundNode.zPosition = -1
        addChild(backgroundNode)
        
        let boardWidth = view.frame.width - 24
        let borderHeight = ((view.frame.height - boardWidth) / 2) - 24
        
        boardNode = SKSpriteNode(
            texture: SKTexture(imageNamed: "Net"),
            size: CGSize(width: boardWidth, height: boardWidth)
        )
        boardNode.position.y = -(view.frame.height / 2) + ((view.frame.height - borderHeight) / 1.8)
        boardNode.zPosition = 0
        
        addChild(boardNode)
        
        let headerNode = SKSpriteNode(
            color: UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1),
            size: CGSize(width: view.frame.width, height: borderHeight)
        )
        headerNode.alpha = 0
        headerNode.position.y = (view.frame.height / 2) - (borderHeight / 2)
        addChild(headerNode)
        

        /// Replay  Button
       
        buttonMenu.name = "buttonSprite-Menu"
        buttonMenu.zPosition = 3
        buttonMenu.position.y = -(view.frame.height / 2) + (borderHeight / 2)
        
        addChild(buttonMenu)
        
        
        /// Player O turn
 
        turnO.name = "buttonSprite-TurnO"
        turnO.zPosition = 7
        turnO.position = headerNode.position
        turnO.isHidden = true
        
        /// Player X turn

        turnX.name = "buttonSprite-TurnX"
        turnX.zPosition = 7
        turnX.position = headerNode.position
        turnX.isHidden = true
        
        /// Resizing buttons
        let resizeFactorX:CGFloat = frame.size.width/407.0
        let resizeFactorY:CGFloat = frame.size.height/599.0
        let originalSize = buttonMenu.size
        turnX.size = CGSize(width: originalSize.width*resizeFactorX/1.5
            , height: originalSize.height*resizeFactorY/2.2)
        turnO.size = CGSize(width: originalSize.width*resizeFactorX/1.5
            , height: originalSize.height*resizeFactorY/2.2)
        buttonMenu.size = CGSize(width: originalSize.width*resizeFactorX/3.4, height: originalSize.height*resizeFactorY/3.2)
        
///Add who won
//        turnXWin.size = CGSize(width: originalSize.width*resizeFactorX/1.4
//            , height: originalSize.height*resizeFactorY/2.6)
//        turnOWin.size = CGSize(width: originalSize.width*resizeFactorX/1.4
//            , height: originalSize.height*resizeFactorY/2.6)
        
        addChild(turnO)
        addChild(turnX)
        
        
        
        

        
        strategist = Strategist(board: board)
        
        resetGame()
        updateGame()
    }
    
    // MARK: - Game Logic
    
    fileprivate func resetGame() {
        let actions = [
            SKAction.scale(to: 0, duration: 0.25),
            SKAction.customAction(withDuration: 0.5, actionBlock: { node, duration in
                node.removeFromParent()
            })
        ]
        gamePieceNodes.forEach { node in
            node.run(SKAction.sequence(actions))
        }
        gamePieceNodes.removeAll()
        
        board = Board()
        strategist.board = board
        
    }
    
    fileprivate func updateGame() {
        var gameOverTitle: String? = nil
        
        if let winner = board.winningPlayer, winner == board.currentPlayer {
            gameOverTitle = "\(winner.name) Wins!"
        } else if board.isFull {
            gameOverTitle = "Draw"
        }
        
        if gameOverTitle != nil {
            let alert = UIAlertController(title: gameOverTitle, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Play Again", style: .default) { _ in
                self.resetGame()
                self.updateGame()
            }
            
            alert.addAction(alertAction)
            view?.window?.rootViewController?.present(alert, animated: true)
            
            return
        }
        
        board.currentPlayer = board.currentPlayer.opponent
        
        if board.currentPlayer.name == "X" {
            turnX.isHidden = false
            turnO.isHidden = true
        }
        if board.currentPlayer.name == "O" {
            turnX.isHidden = true
            turnO.isHidden = false
        }
        
        //informationLabel.text = "Player \(board.currentPlayer.name) Turn"
        
        if board.currentPlayer.value == .brain {
            processAIMove()
        }
    }
    
    fileprivate func updateBoard(with x: Int, y: Int) {
        guard board[x, y] == .empty else { return }
        
        board[x, y] = board.currentPlayer.value
        let sizeValue = boardNode.size.width / 3 - 20
        let spriteSize = CGSize(
            width: sizeValue,
            height: sizeValue
        )
        
        var nodeImageName: String
        
        //Image Name for the board
        if board.currentPlayer.value == .zombie {
            nodeImageName = "circle"
        } else {
            nodeImageName = "cross"
        }
        
        let pieceNode = SKSpriteNode(imageNamed: nodeImageName)
        pieceNode.size = CGSize(
            width: spriteSize.width / 2,
            height: spriteSize.height / 2
        )
        pieceNode.position = position(for: CGPoint(x: x, y: y))
        addChild(pieceNode)
        
        gamePieceNodes.append(pieceNode)
        
        pieceNode.run(SKAction.scale(by: 2, duration: 0.25))
        
        updateGame()
    }
    
    fileprivate func position(for boardCoordinate: CGPoint) -> CGPoint {
        let boardWidth = boardNode.size.width
        let halfThirdOfBoard = (boardWidth / 3) / 2
        
        var xPosition: CGFloat = 0
        var yPosition: CGFloat = 0
        
        if boardCoordinate.x == 0 {
            xPosition = -((boardWidth / 2) - halfThirdOfBoard)
        } else if boardCoordinate.x == 1 {
            xPosition = 0
        } else if boardCoordinate.x == 2 {
            xPosition = (boardWidth / 2) - halfThirdOfBoard
        }
        
        if boardCoordinate.y == 0 {
            yPosition = (boardWidth / 2) - halfThirdOfBoard
        } else if boardCoordinate.y == 1 {
            yPosition = 0
        } else if boardCoordinate.y == 2 {
            yPosition = -((boardWidth / 2) - halfThirdOfBoard)
        }
        
        return CGPoint(x: xPosition, y: yPosition + boardNode.position.y)
    }
    
    
    fileprivate func processAIMove() {
        // 1
        DispatchQueue.global().async { [unowned self] in
            // 2
            let strategistTime = CFAbsoluteTimeGetCurrent()
            guard let bestCoordinate = self.strategist.bestCoordinate else {
                return
            }
            // 3
            let delta = CFAbsoluteTimeGetCurrent() - strategistTime
            
            let aiTimeCeiling = 0.75
            // 4
            let delay = max(delta, aiTimeCeiling)
            // 5
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.updateBoard(with: Int(bestCoordinate.x), y: Int(bestCoordinate.y))
            }
        }
    }
    
    // MARK: - Touches
    
    fileprivate func processTouchOnBoard(touch: UITouch) {
        let locationInBoard = touch.location(in: boardNode)
        let halfThirdOfBoard = (boardNode.size.width / 3) / 2
        
        var boardCoordinate: CGPoint = .zero
        
        if locationInBoard.x > halfThirdOfBoard {
            boardCoordinate.x = 2
        } else if locationInBoard.x < -halfThirdOfBoard {
            boardCoordinate.x = 0
        } else {
            boardCoordinate.x = 1
        }
        
        if locationInBoard.y > halfThirdOfBoard {
            boardCoordinate.y = 0
        } else if locationInBoard.y < -halfThirdOfBoard {
            boardCoordinate.y = 2
        } else {
            boardCoordinate.y = 1
        }
        
        updateBoard(with: Int(boardCoordinate.x), y: Int(boardCoordinate.y))
    }
    
    fileprivate func handleTouchEnd(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard board.currentPlayer.value == .zombie else {
            return
        }
        
        for touch in touches {
            for node in nodes(at: touch.location(in: self)) {
                if node == boardNode {
                    processTouchOnBoard(touch: touch)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        handleTouchEnd(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        handleTouchEnd(touches, with: event)
    }
    /// Touch event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let item = atPoint(location)
            
            /// Exit and return to GameScene
            
            if (item.name == "buttonSprite-Menu"){
                gameViewController.sceneStateMachine.enter(MenuSceneState
                    .self)
            }

        }
    }//END touches Began
    
}
