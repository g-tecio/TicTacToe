//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
	/// Game Controls
	var menuControls: MenuControls!
    
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
        menuControls = MenuControls.init(inThisScene: self)
		
		
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
		self.addChild(menuControls.background)
        self.addChild(menuControls.titleLabel)
		self.addChild(menuControls.buttonSprite)
        self.addChild(menuControls.buttonGame)
        
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
			if (item.name == "buttonSprite-Game") {
                gameViewController.sceneStateMachine.enter(DifficultySceneState.self)
			}
            if (item.name == "buttonSprite-2Players") {
                gameViewController.sceneStateMachine.enter(GameSceneState.self)
                
            }
            if (item.name == "buttonSprite-Exit") {
                exit(0)
            }
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
}
