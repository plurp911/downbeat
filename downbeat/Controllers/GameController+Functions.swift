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
        
        if player.isKnockedBack == false {
            
            if isRightPressed == false {
                
                player.isMoving = false
                player.isMovingRight = false
                
                if isLeftPressed == true {
                    
                    player.isMoving = true
                    player.isMovingLeft = true
                    
                    player.isMovingRight = false
                    
                    player.direction = "left"
                }
                
                player.updateAnimation()
            }
            
            if isLeftPressed == false {
                
                player.isMoving = false
                player.isMovingLeft = false
                
                if isRightPressed == true {
                    
                    player.isMoving = true
                    player.isMovingRight = true
                    
                    player.isMovingLeft = false
                    
                    player.direction = "right"
                }
                
                player.updateAnimation()
            }
        }

        if isPaused == false {
            
            player.move()
            
            if player.isInBounds() == false {
                
                print("GAME OVER")
                
//                handleGameOver()
            }

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
            
            var explosionsToRemove = [Int]()
            
            for i in 0 ..< explosions.count {
                
                if explosions[i].view.isAnimating == false {
                    explosionsToRemove.append(i)
                }
            }
            
            for i in 0 ..< explosionsToRemove.count {
                
                let newI = explosionsToRemove.count - i - 1
                
                explosions.remove(at: explosionsToRemove[newI])
            }
            
            var powerupsToRemove = [Int]()
            
            for i in 0 ..< powerups.count {
                
                powerups[i].move()
                
                if powerups[i].view.isAnimating == false || powerups[i].isInBounds() == false {
                    powerupsToRemove.append(i)
                }
            }
            
            for i in 0 ..< powerupsToRemove.count {
                
                let newI = powerupsToRemove.count - i - 1
                
                powerups.remove(at: powerupsToRemove[newI])
            }
            
            let powerupPos: Int = player.didHitPowerup()
            
            if powerupPos >= 0 {
                
                player.handlePowerup(type: powerups[powerupPos].type)
                
                powerups.remove(at: powerupPos)
            }
            
            let enemyPos: Int = player.didHitEnemy()

            if enemyPos >= 0 {
                
                if player.isHit == false {
                    player.handleHit(damage: currentStage.enemies[enemyPos].damage, enemyDirection: currentStage.enemies[enemyPos].direction)
                }
            }
        
            var enemiesToRemove = [Int]()
            
            bulletsToRemove.removeAll()
            
            for i in 0 ..< currentStage.enemies.count {
            
                if currentStage.enemies[i].isInBounds() == true {
                    
                    currentStage.enemies[i].move()
                    
                    let bulletPos: Int = currentStage.enemies[i].didHitBullet()
                    
                    if bulletPos >= 0 {
                        
                        bulletsToRemove.append(bulletPos)
                        
                        currentStage.enemies[i].handleHit()
                        
                        if currentStage.enemies[i].isDead() == true {
                            
                            explosions.append(Explosion(x: currentStage.enemies[i].x, y: currentStage.enemies[i].y))
                            
                            powerups.append(Powerup(x: currentStage.enemies[i].x, y: currentStage.enemies[i].y, type: "largeHealth"))
                            
                            enemiesToRemove.append(i)
                        }
                    }

                } else {
                    
                    enemiesToRemove.append(i)
                }
            }
            
            for i in 0 ..< bulletsToRemove.count {
                
                let newI = bulletsToRemove.count - i - 1
                
                bullets.remove(at: bulletsToRemove[newI])
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
                            moveExplosions(direction: "left")
                            movePowerups(direction: "left")
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
                        moveExplosions(direction: "right")
                        movePowerups(direction: "right")
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
                
                if player.isKnockedBack == true {
                    bullets[i].setXY(x: bullets[i].x + Player.knockBackMoveSpeed, y: bullets[i].y)
                } else {
                    bullets[i].setXY(x: bullets[i].x + Player.maxMoveSpeed, y: bullets[i].y)
                }
                
            } else if direction == "right" {
                
                if player.isKnockedBack == true {
                    bullets[i].setXY(x: bullets[i].x - Player.knockBackMoveSpeed, y: bullets[i].y)
                } else {
                    bullets[i].setXY(x: bullets[i].x - Player.maxMoveSpeed, y: bullets[i].y)
                }
            }
            
        }
    }
    
    func moveExplosions(direction: String) {
        
        for i in 0 ..< explosions.count {
            
            if direction == "left" {
                
                if player.isKnockedBack == true {
                    explosions[i].setX(x: explosions[i].x + Player.knockBackMoveSpeed)
                } else {
                    explosions[i].setX(x: explosions[i].x + Player.maxMoveSpeed)
                }
                
            } else if direction == "right" {
                
                if player.isKnockedBack == true {
                    explosions[i].setX(x: explosions[i].x - Player.knockBackMoveSpeed)
                } else {
                    explosions[i].setX(x: explosions[i].x - Player.maxMoveSpeed)
                }
            }
            
        }
    }
    
    func movePowerups(direction: String) {
        
        for i in 0 ..< powerups.count {
            
            if direction == "left" {
                
                if player.isKnockedBack == true {
                    powerups[i].setXY(x: powerups[i].x + Player.knockBackMoveSpeed, y: powerups[i].y)
                } else {
                    powerups[i].setXY(x: powerups[i].x + Player.maxMoveSpeed, y: powerups[i].y)
                }
                
            } else if direction == "right" {
                
                if player.isKnockedBack == true {
                    powerups[i].setXY(x: powerups[i].x - Player.knockBackMoveSpeed, y: powerups[i].y)
                } else {
                    powerups[i].setXY(x: powerups[i].x - Player.maxMoveSpeed, y: powerups[i].y)
                }
            }
            
        }
    }
    
    func moveEnemies(direction: String) {
        
        for i in 0 ..< currentStage.enemies.count {
            
            if currentStage.enemies[i].isInBounds() == true {
                
                if direction == "left" {
                    
                    if player.isKnockedBack == true {
                        currentStage.enemies[i].setXY(x: currentStage.enemies[i].x + Player.knockBackMoveSpeed, y: currentStage.enemies[i].y)
                    } else {
                        currentStage.enemies[i].setXY(x: currentStage.enemies[i].x + Player.maxMoveSpeed, y: currentStage.enemies[i].y)
                    }
                    
                } else if direction == "right" {
                    
                    if player.isKnockedBack == true {
                        currentStage.enemies[i].setXY(x: currentStage.enemies[i].x - Player.knockBackMoveSpeed, y: currentStage.enemies[i].y)
                    } else {
                        currentStage.enemies[i].setXY(x: currentStage.enemies[i].x - Player.maxMoveSpeed, y: currentStage.enemies[i].y)
                    }
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
        
        for e in explosions {
            gameView.addSubview(e.view)
        }
        
        for p in powerups {
            gameView.addSubview(p.view)
        }

        for e in currentStage.enemies {
            gameView.addSubview(e.view)
        }
        
//        gameView.addSubview(player.hitBox)
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
