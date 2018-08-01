//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class DifficultyScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
	/// Game Controls
	var difficultyControls: DifficultyControls!
    
//    var entities = [GKEntity]()
//    var graphs = [String : GKGraph]()
	
    private var lastUpdateTime : TimeInterval = 0

	/// Custom Initializer
	init(sceneSize: CGSize, referenceGVC: GameViewController) {
		
		/// Set reference of GameViewControl
		gameViewController = referenceGVC
		
		/// Create scene from code
		super.init(size: sceneSize)
		
		/// Menu Controls
        difficultyControls = DifficultyControls.init(inThisScene: self)
		
		
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
	
	/// Present Elements to the Scene
	override func didMove(to view: SKView) {
		
		/// Present Label and Button
		self.addChild(difficultyControls.background)
        self.addChild(difficultyControls.titleLabel)
        self.addChild(difficultyControls.buttonEasy)
        self.addChild(difficultyControls.buttonHard)
//        self.addChild(difficultyControls.buttonMenu)
	}
	
	/// Before another Scence will be presented
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	/// Touch event
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let item = atPoint(location)
			
			/// Exit and return to GameScene
			if (item.name == "buttonSprite-Easy") {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = AIGameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
                
			}
            if (item.name == "buttonSprite-2Players") {
            gameViewController.sceneStateMachine.enter(GameSceneState.self)
                
            }
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
}
