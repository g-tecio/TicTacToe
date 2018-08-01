//
//  GameViewController.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// TODO: Fix this class

class GameViewController: UIViewController {
	
	// MARK: App Properties
	
	/// Scene State Machine
	var sceneStateMachine: GKStateMachine!
	
	/// Scenes
	var gameScene: GameScene!
	var twoPlayersScene: TwoPlayersScene!
    var menuScene: MenuScene!
    var instructionsScene: InstructionsScene!
    var difficultyScene: DifficultyScene!
	
	// MARK: Override Methods
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        /// MenuScene Setup
        menuScene = MenuScene.init(sceneSize: view.bounds.size, referenceGVC: self)
		
        /// InstructionsScene Setup
        instructionsScene = InstructionsScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
		/// GameScene Setup
		gameScene = GameScene.init(sceneSize: view.bounds.size, referenceGVC: self)
        
        /// GameScene Setup
        difficultyScene = DifficultyScene.init(sceneSize: view.bounds.size, referenceGVC: self)
		
		/// ConfigScene Setup
		twoPlayersScene = TwoPlayersScene.init(sceneSize: view.bounds.size, referenceGVC: self)
		
		/// Creates SceneStateMachine and adds states, then enters GameSceneState
		sceneStateMachine = GKStateMachine(states: [	GameSceneState(referenceGVC: self),
                                                        MenuSceneState(referenceGVC: self),
                                                        InstructionsSceneState(referenceGVC: self),
                                                        DifficultySceneState(referenceGVC: self),
														TwoPlayersSceneState(referenceGVC: self)	] )
		sceneStateMachine.enter(MenuSceneState.self)
	}

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .allButUpsideDown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
		return true
    }
}
