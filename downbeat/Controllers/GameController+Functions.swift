//
//  GameController+Functions.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {
    
    func setupStage() {
    
        
        
    }
    
    @objc func move() {
        
        if isPaused == false {
            
            movePlayer()
            
            if player.isMoving == true {
                
                 if player.isMovingLeft == true {
                    
//                    if currentStage.x <= 0 {
//
//                        currentStage.x
//
//                    }
                    
                    currentStage.move(direction: "left")

                    currentStage.moveBlocks()

                } else if player.isMovingRight == true {
                    
                    currentStage.move(direction: "right")

                    currentStage.moveBlocks()
                }
            }
            
            draw()
        }
    }
    
    func movePlayer() {
        
        player.move()
    }
    
    func draw() {
        
        removeAllSubviews()
        removeAllLines()
        
        for b in currentStage.blocks {
            gameView.addSubview(b.view)
        }

        gameView.addSubview(player.view)
    }
    
    func removeAllSubviews() {
        
        for view in gameView.subviews {
            
            view.removeFromSuperview()
            
        }
    }
    
    func removeAllLines() {
        
        if let lines = gameView.layer.sublayers {
            
            for line in lines {
                
                line.removeFromSuperlayer()
                
            }
        }
    }
    
}
