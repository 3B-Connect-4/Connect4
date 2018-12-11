//
//  Game.swift
//  Connect 4
//
//  Created by Biddulph, Caleb D on 12/7/18.
//  Copyright © 2018 Connect 4 Inc. All rights reserved.
//

import Foundation

class Game {
    
    var tokenGrid: [[Player.PlayerID]]
    
    init() {
        tokenGrid = Array(repeating: Array(repeating: Player.PlayerID.NONE, count: 6), count: 7)
    }
    func reset(){
        for row in 0...5 {
            for col in 0...6
            {
                tokenGrid[col][row] = Player.PlayerID.NONE
            }
        }
    }
}
