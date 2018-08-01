//
//  ConfigSceneState.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuSceneState: SceneState {
	
	// MARK: Properties
	
	
	// MARK: Initializer
	
	required init(referenceGVC: GameViewController) {
		super.init(referenceGVC: referenceGVC, sceneStateName: "MenuSceneState")
	}
	
	// MARK: Overrride Methos
	
	override func didEnter(from previousState: GKState?) {
		super.didEnter(from: previousState)
		
		/// Present scene
		if let skView = gameViewController.view as! SKView? {
			skView.presentScene(gameViewController.menuScene, transition: SKTransition.flipHorizontal(withDuration: 0.3))
		}
	}
	
	override func willExit(to nextState: GKState) {
		super.willExit(to: nextState)
	}
	
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		if (stateClass is GameSceneState.Type) || (stateClass is InstructionsSceneState.Type) || (stateClass is DifficultySceneState.Type) {
			return true
		}
		else {
			return false
		}
	}
	
}

