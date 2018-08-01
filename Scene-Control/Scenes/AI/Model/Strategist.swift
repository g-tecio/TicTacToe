//
//  Strategist.swift
//  TicTacToe
//
//  Created by Luis Reyes on 7/31/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import GameplayKit

struct Strategist {
    
    // 1
    private let strategist: GKMinmaxStrategist = {
        let strategist = GKMinmaxStrategist()
        
        strategist.maxLookAheadDepth = 5
        strategist.randomSource = GKARC4RandomSource()
        
        return strategist
    }()
    
    // 2
    var board: Board {
        didSet {
            strategist.gameModel = board
        }
    }
    
    // 3
    var bestCoordinate: CGPoint? {
        if let move = strategist.bestMove(for: board.currentPlayer) as? Move {
            return move.coordinate
        }
        
        return nil
    }
    
}


