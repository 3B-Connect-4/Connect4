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
            //please call the method to place a token right here
            //you might be able to use the following code segment to get a reference to the stack view and call the method using that
            
            //if let view = recognizer.view {
            //
            //}
        }
    }
}

