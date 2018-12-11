//
//  Game.swift
//  Connect 4
//
//  Created by Biddulph, Caleb D on 12/7/18.
//  Copyright © 2018 Connect 4 Inc. All rights reserved.
//

import Foundation

class Game {
    
    //tokenGrid[0] keeps track of the leftmost column, tokenGrid[1] the next, etc. to tokenGrid[6] on the left
    //tokenGrid[0][0] is the bottommost token in the leftmost column, and tokenGrid[0][5] is the top left token
    var tokenGrid: [[Player.PlayerID]]
    
    init() {
        tokenGrid = Array(repeating: Array(repeating: Player.PlayerID.NONE, count: 6), count: 7)
    }
}
