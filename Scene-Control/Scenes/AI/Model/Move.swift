//
//  Move.swift
//  TicTacToe
//
//  Created by Luis Reyes on 7/31/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import GameplayKit

class Move: NSObject, GKGameModelUpdate {
    
    enum Score: Int {
        case none
        case win
    }
    
    var value: Int = 0
    var coordinate: CGPoint
    
    init(_ coordinate: CGPoint) {
        self.coordinate = coordinate
    }
    
}
