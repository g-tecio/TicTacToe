//
//  AIGameViewController.swift
//  TicTacToe
//
//  Created by Luis Reyes on 7/31/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import UIKit
import SpriteKit

class AIGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            let scene = AIGameScene(size: UIScreen.main.bounds.size)
            scene.scaleMode = .aspectFill
            
            view.presentScene(scene)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
