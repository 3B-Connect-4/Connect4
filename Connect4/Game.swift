//
//  Game.swift
//  Connect 4
//
//  Created by Biddulph, Caleb D on 12/7/18.
//  Copyright © 2018 Connect 4 Inc. All rights reserved.
//

import Foundation

class Game {
    
    let numRows = 6
    let numCols = 7
    
    //tokenGrid[0] keeps track of the leftmost column, tokenGrid[1] the next, etc. to tokenGrid[6] on the left
    //tokenGrid[0][0] is the bottommost token in the leftmost column, and tokenGrid[0][5] is the top left token
    var tokenGrid: [[Player.PlayerID]]
    
    //set this as false during transitions between turns
    var isAcceptingInput: Bool
    
    init() {
        tokenGrid = Array(repeating: Array(repeating: Player.PlayerID.NONE, count: numRows), count: numCols)
        isAcceptingInput = true
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
    func causedAWin(col: Int, row: Int) -> Bool {
        let p = tokenGrid[col][row] //the player to evaluate for a win
        if p == Player.PlayerID.NONE {
            return false; //returns false if there is not already a token there
        }
        
        //keeps track of number of matching tokens in each direction
        //0 moves up (should always be zero...), 1 is up-right, 2 is right, etc. to 7 as up-left
        var elimDirs = Array(repeating: 0, count: 8)
        for i in 1...3 {
            if elimDirs[0] == i - 1 && isMatchingToken(col: col, row: row + 1, matches: p) {
                elimDirs[0] = i
            }
            if elimDirs[1] == i - 1 && isMatchingToken(col: col + 1, row: row + 1, matches: p) {
                elimDirs[1] = i
            }
            if elimDirs[2] == i - 1 && isMatchingToken(col: col + 1, row: row, matches: p) {
                elimDirs[2] = i
            }
            if elimDirs[3] == i - 1 && isMatchingToken(col: col + 1, row: row - 1, matches: p) {
                elimDirs[3] = i
            }
            if elimDirs[4] == i - 1 && isMatchingToken(col: col, row: row - 1, matches: p) {
                elimDirs[4] = i
            }
            if elimDirs[5] == i - 1 && isMatchingToken(col: col - 1, row: row - 1, matches: p) {
                elimDirs[5] = i
            }
            if elimDirs[6] == i - 1 && isMatchingToken(col: col - 1, row: row, matches: p) {
                elimDirs[6] = i
            }
            if elimDirs[7] == i - 1 && isMatchingToken(col: col - 1, row: row + 1, matches: p) {
                elimDirs[7] = i
            }
        }
        
        //adds up opposite directions, returns true if any sum to 3 or more (the middle token is not counted to determine four-in-a-row)
        for i in 0...3 {
            if elimDirs[i] + elimDirs[i+4] >= 3 {
                return true
            }
        }
        return false
    }
    
    func isMatchingToken(col: Int, row: Int, matches player: Player.PlayerID) -> Bool {
        if col < 0 || col >= numCols || row < 0 || row >= numRows {
            return false
        }
        return tokenGrid[col][row] == player
    }
    func randomMove(playerColorforRan: Player.PlayerID) {
        let ranCol = Int.random(in: 0...7)
        dropToken(col: ranCol, playerColor: playerColorforRan)
    }
}
