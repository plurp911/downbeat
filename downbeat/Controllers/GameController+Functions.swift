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
            
            player.updateAnimation()
            
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
                    
                    //                player.updateAnimation()
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
                    
                    //                player.updateAnimation()
                }
            }
            
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
            
            removeObjects(type: "bullets", toRemove: bulletsToRemove)
            
            var deflectedBulletsToRemove = [Int]()
            
            for i in 0 ..< deflectedBullets.count {
                
                deflectedBullets[i].move()
                
                if deflectedBullets[i].isInBounds() == false {
                    deflectedBulletsToRemove.append(i)
                }
            }
            
            removeObjects(type: "deflectedBullets", toRemove: deflectedBulletsToRemove)
            
            var explosionsToRemove = [Int]()
            
            for i in 0 ..< explosions.count {
                
                if explosions[i].view.isAnimating == false {
                    explosionsToRemove.append(i)
                }
            }
            
            removeObjects(type: "explosions", toRemove: explosionsToRemove)

            var powerupsToRemove = [Int]()
            
            for i in 0 ..< powerups.count {
                
                powerups[i].move()
                
                if powerups[i].view.isAnimating == false || powerups[i].isInBounds() == false {
                    powerupsToRemove.append(i)
                }
            }
            
            removeObjects(type: "powerups", toRemove: powerupsToRemove)
            
            var enemyBulletsToRemove = [Int]()
            
            for i in 0 ..< enemyBullets.count {
                
                enemyBullets[i].move()
                
                if enemyBullets[i].isInBounds() == false {
                    enemyBulletsToRemove.append(i)
                }
            }
            
            removeObjects(type: "enemyBullets", toRemove: enemyBulletsToRemove)
            
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
            
            enemyBulletsToRemove.removeAll()

            let enemyBulletPos: Int = player.didHitEnemyBullet()
            
            if enemyBulletPos >= 0 {
                
                if player.isHit == false {
                    
                    if enemyBullets[enemyBulletPos].xSpeed >= 0 {
                        
                        player.handleHit(damage: enemyBullets[enemyBulletPos].damage, enemyDirection: "right")
                        
                    } else {
                        
                        player.handleHit(damage: enemyBullets[enemyBulletPos].damage, enemyDirection: "left")
                    }
                }
                
            }
            
            removeObjects(type: "enemyBullets", toRemove: enemyBulletsToRemove)
        
            var enemiesToRemove = [Int]()
            
            bulletsToRemove.removeAll()
            
            for i in 0 ..< currentStage.enemies.count {
            
                if currentStage.enemies[i].isInBounds() == true {
                    
                    currentStage.enemies[i].move()
                    currentStage.enemies[i].updateAnimation()

                    let bulletPos: Int = currentStage.enemies[i].didHitBullet()
                    
                    if bulletPos >= 0 {
                        
                        bulletsToRemove.append(bulletPos)
                        
                        currentStage.enemies[i].handleHit()
                        
                        if currentStage.enemies[i].isDead() == true {
                            
                            explosions.append(Explosion(x: currentStage.enemies[i].x, y: currentStage.enemies[i].y))
                            
//                            powerups.append(Powerup(x: currentStage.enemies[i].x, y: currentStage.enemies[i].y, type: "largeHealth"))
                            
                            enemiesToRemove.append(i)
                        }
                    }

                } else {
                    
                    enemiesToRemove.append(i)
                }
            }
            
            removeObjects(type: "bullets", toRemove: bulletsToRemove)
            removeObjects(type: "enemies", toRemove: enemiesToRemove)

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
                            moveDeflectedBullets(direction: "left")
                            moveExplosions(direction: "left")
                            movePowerups(direction: "left")
                            moveEnemies(direction: "left")
                            moveEnemyBullets(direction: "left")

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
                        moveDeflectedBullets(direction: "right")
                        moveExplosions(direction: "right")
                        movePowerups(direction: "right")
                        moveEnemies(direction: "right")
                        moveEnemyBullets(direction: "right")

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
    
    func moveDeflectedBullets(direction: String) {
        
        for i in 0 ..< deflectedBullets.count {
            
            if direction == "left" {
                
                if player.isKnockedBack == true {
                    deflectedBullets[i].setXY(x: deflectedBullets[i].x + Player.knockBackMoveSpeed, y: deflectedBullets[i].y)
                } else {
                    deflectedBullets[i].setXY(x: deflectedBullets[i].x + Player.maxMoveSpeed, y: deflectedBullets[i].y)
                }
                
            } else if direction == "right" {
                
                if player.isKnockedBack == true {
                    deflectedBullets[i].setXY(x: deflectedBullets[i].x - Player.knockBackMoveSpeed, y: deflectedBullets[i].y)
                } else {
                    deflectedBullets[i].setXY(x: deflectedBullets[i].x - Player.maxMoveSpeed, y: deflectedBullets[i].y)
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
    
    func moveEnemyBullets(direction: String) {
        
        for i in 0 ..< enemyBullets.count {
            
            if direction == "left" {
                
                if player.isKnockedBack == true {
                    enemyBullets[i].setXY(x: enemyBullets[i].x + Player.knockBackMoveSpeed, y: enemyBullets[i].y)
                } else {
                    enemyBullets[i].setXY(x: enemyBullets[i].x + Player.maxMoveSpeed, y: enemyBullets[i].y)
                }
                
            } else if direction == "right" {
                
                if player.isKnockedBack == true {
                    enemyBullets[i].setXY(x: enemyBullets[i].x - Player.knockBackMoveSpeed, y: enemyBullets[i].y)
                } else {
                    enemyBullets[i].setXY(x: enemyBullets[i].x - Player.maxMoveSpeed, y: enemyBullets[i].y)
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
        
        for e in explosions {
            gameView.addSubview(e.view)
        }
        
        for p in powerups {
            gameView.addSubview(p.view)
        }
        
        for e in enemyBullets {
            gameView.addSubview(e.view)
        }
        
        for b in bullets {
            gameView.addSubview(b.view)
        }
        
        for d in deflectedBullets {
            gameView.addSubview(d.view)
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
