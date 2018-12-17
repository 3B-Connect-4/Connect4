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
    func reset(){
        for row in 0...5 {
            for col in 0...6
            {
                tokenGrid[col][row] = Player.PlayerID.NONE
            }
        }
    }
    func dropToken(col: Int, playerColor: Player.PlayerID){
        for row in 0...5
        {
            if tokenGrid[col][row] == Player.PlayerID.NONE
            {
                tokenGrid[col][row] = playerColor
                break
            }
        }
        
    }
    
    //precondition: the row and col should correspond to an already-existing token on the top of a column
    /*func causedAWin(col: Int, row: Int) -> Bool {
        let p = tokenGrid[col][row] //the player to evaluate for a win
        if p == Player.PlayerID.NONE {
            return false; //returns false if there is not already a token there
        }
        
        //keeps track of number of matching tokens in each direction
        //0 moves up (should always be zero...), 1 is up-right, 2 is right, etc. to 7 as up-left
        var elimDirs = Array(repeating: 0, count: 8)
        for i in 0...3 {
            if elimDirs[0] == i && tokenGrid[col][row + 1] == p {
                elimDirs[0] = i + 1
            }
            if elimDirs[1] == i && tokenGrid[col + 1][row + 1] == p {
                elimDirs[1] = i + 1
            }
            if elimDirs[2] == i && tokenGrid[col + 1][row] == p {
                elimDirs[2] = i + 1
            }
            if elimDirs[3] == i && tokenGrid[col + 1][row - 1] == p {
                elimDirs[3] = i + 1
            }
            if elimDirs[4] == i && tokenGrid[col][row - 1] == p {
                elimDirs[4] = i + 1
            }
            if elimDirs[5] == i && tokenGrid[col - 1][row - 1] == p {
                elimDirs[5] = i + 1
            }
            if elimDirs[6] == i && tokenGrid[col - 1][row] == p {
                elimDirs[6] = i + 1
            }
            if elimDirs[7] == i && tokenGrid[col - 1[row + 1] == p {
                elimDirs[7] = i + 1
            }
        }*/
    }

