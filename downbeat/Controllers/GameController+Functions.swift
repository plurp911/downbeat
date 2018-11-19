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
            
            player.move()
            
            var bulletsToRemove = [Int]()
            
            for i in 0 ..< bullets.count {
                
                bullets[i].move()
                
                if bullets[i].isInBounds() == false {
                    bulletsToRemove.append(i)
                }
            }
            
            for i in 0 ..< bulletsToRemove.count {
                
                let newI = bulletsToRemove.count - i - 1
                
                bullets.remove(at: bulletsToRemove[newI])
            }
            
            var enemiesToRemove = [Int]()
            
            for i in 0 ..< currentStage.enemies.count {
            
                if currentStage.enemies[i].isInBounds() == true {
                    
                    currentStage.enemies[i].move()

                } else {
                    
                    enemiesToRemove.append(i)
                }
            }
            
            for i in 0 ..< enemiesToRemove.count {
                
                let newI = enemiesToRemove.count - i - 1
                
                currentStage.enemies.remove(at: enemiesToRemove[newI])
            }

            if player.isMoving == true {
                
                 if player.isMovingLeft == true {
                    
                    if player.canMove == true {
                        
                        if currentStage.x >= 0 {
                            
                            currentStage.reset()
                            
                            player.move(direction: "left")

                        } else if player.x > (gameView.frame.size.width / 2) {
                            
                            player.move(direction: "left")

                        } else {
                            
                            currentStage.move(direction: "left")
                            
                            moveBullets(direction: "left")
                            moveEnemies(direction: "left")

                            currentStage.moveBlocks()
                        }
                    }

                } else if player.isMovingRight == true {
                    
                    if currentStage.x <= (((CGFloat)(-currentStage.numberOfHorizontalBlocks)) * Block.width) + gameView.frame.size.width {
                        
                        currentStage.x = (((CGFloat)(-currentStage.numberOfHorizontalBlocks)) * Block.width) + gameView.frame.size.width
                        
                        currentStage.moveBlocks()

                        player.move(direction: "right")
                        
                    } else if player.x < (gameView.frame.size.width / 2) {
                        
                        player.move(direction: "right")
                        
                    } else {
                        
                        currentStage.move(direction: "right")
                        
                        moveBullets(direction: "right")
                        moveEnemies(direction: "right")

                        currentStage.moveBlocks()
                    }
                }
                
            }
            
            draw()
        }
    }
    
    func moveBullets(direction: String) {
        
        for i in 0 ..< bullets.count {
            
            if direction == "left" {
                
                bullets[i].setXY(x: bullets[i].x + Player.maxMoveSpeed, y: bullets[i].y)
                
            } else if direction == "right" {
                
                bullets[i].setXY(x: bullets[i].x - Player.maxMoveSpeed, y: bullets[i].y)
            }
        }
        
    }
    
    func moveEnemies(direction: String) {
        
        for i in 0 ..< currentStage.enemies.count {
            
            if currentStage.enemies[i].isInBounds() == true {
                
                if direction == "left" {
                    
                    currentStage.enemies[i].setXY(x: currentStage.enemies[i].x + Player.maxMoveSpeed, y: currentStage.enemies[i].y)
                    
                } else if direction == "right" {
                    
                    currentStage.enemies[i].setXY(x: currentStage.enemies[i].x - Player.maxMoveSpeed, y: currentStage.enemies[i].y)
                }
            }
            
        }
    }
    
    func draw() {
        
        removeAllSubviews()
        removeAllLines()
        
        for b in currentStage.blocks {
            gameView.addSubview(b.view)
        }
        
        for b in bullets {
            gameView.addSubview(b.view)
        }

        for e in currentStage.enemies {
            gameView.addSubview(e.view)
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
