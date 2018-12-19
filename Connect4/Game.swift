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
    
    //should be the current player
    var currentPlayer: Player.PlayerID
    
    init() {
        tokenGrid = Array(repeating: Array(repeating: .NONE, count: numRows), count: numCols)
        isAcceptingInput = true
        currentPlayer = .RED
        
        var col: Int
        while !gridIsFull() {
            printGrid()
            col = randomMove(p: .RED)
            if (causedAWin(col: col, row: highestToken(col: col))) {
                break
            }
            printGrid()
            col = randomMove(p: .YELLOW)
            if (causedAWin(col: col, row: highestToken(col: col))) {
                break
            }
        }
        printGrid()
    }
    func reset(){
        for row in 0..<numRows {
            for col in 0..<numCols {
                tokenGrid[col][row] = .NONE
            }
        }
    }
    
    //will return the row index of the dropped token if there is a successful drop
    //otherwise (if invalid column or column is full) return -1
    func dropToken(col: Int, playerColor: Player.PlayerID) -> Int {
        print("calling dropToken with column", col)
        if col < 0 || col >= numCols {
            print("Error: invalid column", col)
            return -1
        } else {
            for row in 0..<numRows {
                if tokenGrid[col][row] == Player.PlayerID.NONE {
                    tokenGrid[col][row] = playerColor
                    if currentPlayer == .RED {
                        currentPlayer = .YELLOW
                    } else {
                        currentPlayer = .RED
                    }
                    return row
                }
            }
            return -1
        }
    }
    
    //precondition: the row and col should correspond to an already-existing token on the top of a column
    func causedAWin(col: Int, row: Int) -> Bool {
        let p = tokenGrid[col][row] //the player to evaluate for a win
        if p == .NONE {
            return false; //returns false if there is not already a token there
        }
        
        //keeps track of number of matching tokens in each direction
        //0 moves up (should always be zero...), 1 is up-right, 2 is right, etc. to 7 as up-left
        var elimDirs = Array(repeating: 0, count: 8)
        for i in 1...3 {
            if elimDirs[0] == i - 1 && isMatchingToken(col: col, row: row + i, matches: p) {
                elimDirs[0] = i
            }
            if elimDirs[1] == i - 1 && isMatchingToken(col: col + i, row: row + i, matches: p) {
                elimDirs[1] = i
            }
            if elimDirs[2] == i - 1 && isMatchingToken(col: col + i, row: row, matches: p) {
                elimDirs[2] = i
            }
            if elimDirs[3] == i - 1 && isMatchingToken(col: col + i, row: row - i, matches: p) {
                elimDirs[3] = i
            }
            if elimDirs[4] == i - 1 && isMatchingToken(col: col, row: row - i, matches: p) {
                elimDirs[4] = i
            }
            if elimDirs[5] == i - 1 && isMatchingToken(col: col - i, row: row - i, matches: p) {
                elimDirs[5] = i
            }
            if elimDirs[6] == i - 1 && isMatchingToken(col: col - i, row: row, matches: p) {
                elimDirs[6] = i
            }
            if elimDirs[7] == i - 1 && isMatchingToken(col: col - i, row: row + i, matches: p) {
                elimDirs[7] = i
            }
        }
        
        //adds up opposite directions, returns true if any sum to 3 or more (the middle token is not counted to determine four-in-a-row)
        for i in 0..<4 {
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
    
    func randomMove(p: Player.PlayerID) -> Int {
        if !gridIsFull() {
            var success = false
            var ranCol = -1
            while !success {
                ranCol = Int.random(in: 0..<numCols)
                success = dropToken(col: ranCol, playerColor: p) != -1
            }
            return ranCol
        }
        return -1
    }
    
    func gridIsFull() -> Bool {
        for c in 0..<numCols {
            if highestToken(col: c) != numRows - 1 {
                return false
            }
        }
        return true
    }
    
    func highestToken(col: Int) -> Int {
        for row in 0..<numRows {
            if tokenGrid[col][row] == Player.PlayerID.NONE {
                return row - 1
            }
        }
        return numRows - 1
    }
    
    func printGrid() {
        for row in stride(from: numRows - 1, through: 0, by: -1) {
            for col in 0..<numCols {
                print(Player.toChar(tokenGrid[col][row]), terminator:" ")
            }
            print()
        }
        print()
    }
}
