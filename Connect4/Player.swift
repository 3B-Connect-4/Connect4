//
//  Player.swift
//  Connect4
//
//  Created by Muppana, Revanth on 12/7/18.
//  Copyright © 2018 Muppana, Revanth. All rights reserved.
//

import Foundation

class Player {    
    
    enum PlayerID {
        case RED
        case YELLOW
        case NONE
    }
    var color: PlayerID
    var score: Int
    
    init(color: PlayerID) {
        self.color = color
        self.score = 0
    }
    
    static func toChar(_ p: PlayerID) -> Character {
        switch p {
        case .RED:
            return "R"
        case .YELLOW:
            return "Y"
        case .NONE:
            return "·"
        }
    }
}
