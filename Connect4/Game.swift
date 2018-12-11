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
}
