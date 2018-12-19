//
//  ViewController.swift
//  Connect 4
//
//  Created by Biddulph, Caleb D on 12/5/18.
//  Copyright © 2018 Connect 4 Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let game: Game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func columnTap(recognizer:UITapGestureRecognizer) {
        if game.isAcceptingInput {
            if let view = recognizer.view {
                if let subviews = view.superview?.subviews {
                    for v in 0..<subviews.count {
                        if view == subviews[v] {
                            game.dropToken(col: v, playerColor: game.currentPlayer)
                        }
                    }
                } else {
                    print("Error: something happened in ViewController")
                }
            }
        }
    }
}

