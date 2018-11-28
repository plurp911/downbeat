//
//  GameController+Functions.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {
    
//    func setupStage() {
//
//    }
    
    @objc func move() {
        
        if isPaused == false {
            
            player.updateAnimation()
            
            player.isMovingUp = false
            player.isMovingDown = false
            
            if player.ySpeed < 0 {
                
                player.isMovingUp = true
                
            } else if player.ySpeed > 0 {
                
                player.isMovingDown = true
            }

            if isTransitioningRight == true {
                
                player.isMoving = true
                player.isMovingRight = true
                
                player.isMovingLeft = false
                
            } else if isTransitioningUp == true {
                
//                player.isMoving = true
                player.isMovingUp = true

                player.isMovingDown = false
                
                player.isMoving = false
                player.isMovingLeft = false
                player.isMovingRight = false
                
            } else if isTransitioningDown == true {
                
                //                player.isMoving = true
                player.isMovingDown = true

                player.isMovingUp = false
                
                player.isMoving = false
                player.isMovingLeft = false
                player.isMovingRight = false
                
            } else if player.isKnockedBack == false {
                
                if player.isClimbing == true {
                    player.direction = "right"
                }
                
                if isRightPressed == false {
                    
                    player.isMoving = false
                    player.isMovingRight = false
                    
                    if isLeftPressed == true {
                        
                        if player.isClimbing == false {
                            
                            player.isMoving = true
                            player.isMovingLeft = true
                        }
                        
                        player.isMovingRight = false
                        
                        player.direction = "left"
                    }
                    
                    //                player.updateAnimation()
                }
                
                if isLeftPressed == false {
                    
                    player.isMoving = false
                    player.isMovingLeft = false
                    
                    if isRightPressed == true {
                        
                        if player.isClimbing == false {
                            
                            player.isMoving = true
                            player.isMovingRight = true
                        }
                        
                        player.isMovingLeft = false
                        
                        player.direction = "right"
                    }
                    
                    //                player.updateAnimation()
                }
                
                if player.isClimbing == true {
                    
                    if isUpPressed == false && isDownPressed == false {
                        player.ySpeed = 0
                    }
                    
                } else if player.isFalling == false && player.isJumping == false && player.isRising == false && player.isAtPeak == false {
                    
//                    player.ySpeed = 0
//
//                    canClimb = true
                }
                
//                if player.isShooting == false {

                if isLeftPressed == false && isRightPressed == false {
                    
                    if (isUpPressed == true && isDownPressed == false) || (isUpPressed == false && isDownPressed == true) {
                        
                        if let ladder = player.didHitLadder() {

//                            if ladder.isTopLadder == true {

                                if player.numberOfLaddersTouching() == 1 {

                                    if let topLadder = player.isTouchingTopLadder() {

                                        if isUpPressed == true {
                                            
                                            if player.isFalling == false && player.isJumping == false && player.isRising == false && player.isAtPeak == false {
                                                
                                                player.setXY(x: player.x, y: topLadder.y - (Block.height / 2) - (Player.height / 2))
                                                
                                                canMoveLeft = true
                                                canMoveRight = true
                                                
                                                player.move()
                                                
                                                player.isClimbing = false
                                                
                                                player.ySpeed = 0
                                            }
                                            
                                        } else if isDownPressed == true {
                                            
                                            if player.isClimbing == true {
                                                
                                                player.setXY(x: player.x, y: topLadder.y + (Block.height / 2) - (Player.height / 2))
                                                
                                            }
                                        }
                                        
                                    }
                                }

//                            } else {
                            
//                            player.direction = "right"
                            
                            var shouldClimb: Bool = true
                            
                            if isDownPressed == true {
                                print()
                                print(ladder.y + (Block.height / 2))
                                print(player.y + (Player.height / 2))
                            }
                            
                            if player.isClimbing == false {
                                
                                if (isUpPressed == true && ladder.y - (Block.height / 2) == player.y + (Player.height / 2)) || (isDownPressed == true && ladder.y + (Block.height / 2) == player.y + (Player.height / 2)) {
                                    
                                    //                                print("SHOULD CLIMB")
                                    
                                    shouldClimb = false
                                }
                            }
                            
                            if shouldClimb == true {
                                
                                if ladder.x != player.x {
                                    
                                    if ladder.x > player.x {
                                        
                                        player.isMoving = true
                                        player.isMovingRight = true
                                        
                                        repeat {
                                            
                                            handleMoving()
                                            
                                        } while (ladder.x > player.x)
                                        
                                    } else if ladder.x < player.x {
                                        
                                        player.isMoving = true
                                        player.isMovingLeft = true
                                        
                                        repeat {
                                            
                                            handleMoving()
                                            
                                        } while (ladder.x < player.x)
                                    }
                                    
//                                    player.setXY(x: ladder.x, y: player.y)

                                    player.isMoving = false
                                    player.isMovingLeft = false
                                    player.isMovingRight = false
                                }
                                
                                if isUpPressed == true {
                                    player.ySpeed = -Player.climbSpeed
                                } else {
                                    player.ySpeed = Player.climbSpeed
                                }
                                
                                player.isClimbing = true
                                
                                player.setXY(x: ladder.x, y: player.y)
                            }
                            
//                            }

                        } else {
                            
                            if player.isFalling == false && player.isJumping == false && player.isRising == false && player.isAtPeak == false {
                                
                                canMoveLeft = true
                                canMoveRight = true
                                
                                player.move()
                                
                                player.isClimbing = false
                                
                                //                            if player.isFalling == false && player.isJumping == false && player.isRising == false && player.isAtPeak == false {
                                //
                                player.ySpeed = 0
                            }
//
//                                player.isFalling = true
//                                player.isLanding = true
//
//                                //                    canClimb = true
//                            }
                        }
                        
                    }
                }
                
//            }
                
            }
            
            player.move()
            
//            if player.isInBounds() == false {
//
//                print("GAME OVER")
//
//                //                handleGameOver()
//            }
            
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
            
//            powerupsToRemove.removeAll()
//
//            for i in 0 ..< currentStage!.powerups.count {
//
//                currentStage!.powerups[i].move()
//
//                if currentStage!.powerups[i].view.isAnimating == false || currentStage!.powerups[i].isInBounds() == false {
//                    powerupsToRemove.append(i)
//                }
//            }
//
//            removeObjects(type: "stagePowerups", toRemove: powerupsToRemove)
            
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
            
//            let stagePowerupPos: Int = player.didHitStagePowerup()
//
//            if stagePowerupPos >= 0 {
//
//                player.handlePowerup(type: currentStage!.powerups[stagePowerupPos].type)
//
//                currentStage!.powerups.remove(at: stagePowerupPos)
//            }
            
            let selectedPowerupPos: Int = player.didHitSelectedPowerup()
            
            if selectedPowerupPos >= 0 {
                
                player.handlePowerup(type: selectedPowerups[selectedPowerupPos].type)
                
                selectedPowerups[selectedPowerupPos].isUsed = true
                
                selectedPowerups.remove(at: selectedPowerupPos)
            }

//            let enemyPos: Int = player.didHitEnemy()
//
//            if enemyPos >= 0 {
//
//                if player.isHit == false {
//                    player.handleHit(damage: currentStage!.enemies[enemyPos].damage, enemyDirection: currentStage!.enemies[enemyPos].direction)
//                }
//            }
            
            let selectedEnemyPos: Int = player.didHitSelectedEnemy()
            
            if selectedEnemyPos >= 0 {
                
                if player.isHit == false {
                    player.handleHit(damage: selectedEnemies[selectedEnemyPos].damage, enemyDirection: selectedEnemies[selectedEnemyPos].direction)
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
            
            
            
            
            
            
            
            
            
            
            
            
            bulletsToRemove.removeAll()
            
            let bulletPos: Int = player.didHitOwnBullet()
            
            if bulletPos >= 0 {

                bulletsToRemove.append(bulletPos)
            }
            
            removeObjects(type: "bullets", toRemove: bulletsToRemove)
            
            
            
            
            
            
            
            
            
            
        
            var selectedEnemiesToRemove = [Int]()
            
            bulletsToRemove.removeAll()
            
            for i in 0 ..< selectedEnemies.count {
            
//                if selectedEnemies[i].isInBounds() == true {
                
                    selectedEnemies[i].move()
                    selectedEnemies[i].updateAnimation()

                    let bulletPos: Int = selectedEnemies[i].didHitBullet()
                    
                    if bulletPos >= 0 {
                        
                        if bullets[bulletPos].type == "regular" {
                           
                            bulletsToRemove.append(bulletPos)
                            
                        } else if bullets[bulletPos].type == "cutter" {
                            
                        }
                        
                        selectedEnemies[i].handleHit(bulletDamage: bullets[bulletPos].damage)
                        
                        if selectedEnemies[i].isDead() == true {
                            
                            selectedEnemies[i].isUsed = true
                            
                            selectedEnemies[i].endTimers()
                            
                            explosions.append(Explosion(x: selectedEnemies[i].x, y: selectedEnemies[i].y))
                            
                            handleMakePowerup(x: selectedEnemies[i].x, y: selectedEnemies[i].y)
                            
                            selectedEnemiesToRemove.append(i)
                        }
                    }

//                } else {
//
//                    selectedEnemiesToRemove.append(i)
//                }
            }
            
//            removeObjects(type: "selectedEnemies", toRemove: selectedEnemiesToRemove)
            removeObjects(type: "bullets", toRemove: bulletsToRemove)
            removeObjects(type: "selectedEnemies", toRemove: selectedEnemiesToRemove)

            handleMoving()
            
            draw()
        }
    }
    
    func handleMoving() {
        
        if player.isMoving == true {
            
            if player.isMovingLeft == true {
                
                if player.canMove == true {
                    
                    if currentStage!.x >= 0 {
                        
//                        currentStage!.reset()
                        
                        player.move(direction: "left")
                        
                        //                            currentStage!.updateObjectArrays(direction: "left")
                        
                    } else if player.x > (gameView.frame.size.width / 2) {
                        
                        player.move(direction: "left")
                        
                    } else {
                        
                        currentStage!.move(direction: "left")
                        
                        moveObjects(direction: "left")
                        
                        //                            currentStage!.updateObjectArrays(direction: "left")
                        
                        currentStage!.moveObjects()

                        currentStage!.updateObjectArrays(direction: "left")
                    }
                }
                
            } else if player.isMovingRight == true {

                if isTransitioningRight == true {
                    
                    handleTransition(direction: "right")

                } else {
                    
                    if currentStage!.x <= (((CGFloat)(-currentStage!.numberOfHorizontalBlocks)) * Block.width) + gameView.frame.size.width {
                        
                        currentStage!.x = (((CGFloat)(-currentStage!.numberOfHorizontalBlocks)) * Block.width) + gameView.frame.size.width
                        
                        currentStage!.moveObjects()
                        
                        player.move(direction: "right")
                        
                        //                        currentStage!.updateObjectArrays(direction: "right")
                        
                    } else if player.x < (gameView.frame.size.width / 2) {
                        
                        player.move(direction: "right")
                        
                    } else {
                        
                        currentStage!.move(direction: "right")
                        
                        moveObjects(direction: "right")
                        
                        //                        currentStage!.updateObjectArrays(direction: "right")
                        
                        currentStage!.moveObjects()
                        
                        currentStage!.updateObjectArrays(direction: "right")
                    }
                }

            }
        }

        if player.isMovingUp == true && isTransitioningUp == true {
            
            handleTransition(direction: "up")
            
        } else if player.isMovingDown == true && isTransitioningDown == true {

            handleTransition(direction: "down")
        }
    }
    
    func handleTransition(direction: String) {
        
        for _ in 0 ..< 5 {
//        for _ in 0 ..< 1 {

            currentStage!.move(direction: direction)
            nextStage!.move(direction: direction)
            
            moveObjects(direction: direction)
            
            //                        currentStage!.updateObjectArrays(direction: "right")
            
            currentStage!.moveObjects()
            nextStage!.moveObjects()
            
            if direction == "right" {

                player.move(direction: "left")

            } else if direction == "up" {
                
                player.move(direction: "down")

            } else if direction == "down" {

                player.move(direction: "up")
            }
            
            //                        currentStage!.updateObjectArrays(direction: "right")
            //                        nextStage!.updateObjectArrays(direction: "right")
            
            bullets.removeAll()
            explosions.removeAll()
            powerups.removeAll()
            enemyBullets.removeAll()
            deflectedBullets.removeAll()
            
            removeUnwantedEnemies(direction: direction)
            removeUnwantedEnemySpawners(direction: direction)
            removeUnwantedPowerups(direction: direction)
            
            if direction == "right" {
                
                currentStage!.updateBlocks(direction: direction)
                //                        currentStage!.updateEnemies(direction: "right")
                currentStage!.updatePowerups(direction: direction)
                //                        currentStage!.updateEnemySpawners(direction: "right")
                
                nextStage!.updateBlocks(direction: direction)
                //                        nextStage!.updateEnemies(direction: "right")
                nextStage!.updatePowerups(direction: direction)
                //                        nextStage!.updateEnemySpawners(direction: "right")
            } else {
                
//                currentStage!.setupSelectedArrays()
//                nextStage!.setupSelectedArrays()
            }
        }
        
    }
    
    func removeUnwantedEnemies(direction: String) {
        
        var selectedEnemiesToRemove = [Int]()

        for i in 0 ..< selectedEnemies.count {
            
            if direction == "right" {
                
                if selectedEnemies[i].x < player.x {
                    
                    selectedEnemiesToRemove.append(i)
                }
                
            } else if direction == "up" {
                
                if selectedEnemies[i].y > player.y {
                    
                    selectedEnemiesToRemove.append(i)
                }
                
            } else if direction == "down" {
                
                if selectedEnemies[i].y < player.y {
                    
                    selectedEnemiesToRemove.append(i)
                }
            }
            
        }
        
        removeObjects(type: "selectedEnemies", toRemove: selectedEnemiesToRemove)
    }
    
    func removeUnwantedEnemySpawners(direction: String) {
        
        var selectedEnemySpawnersToRemove = [Int]()
        
        for i in 0 ..< selectedEnemySpawners.count {
            
            if direction == "right" {
                
                if selectedEnemySpawners[i].x < player.x {
                    
                    selectedEnemySpawnersToRemove.append(i)
                }
                
            } else if direction == "up" {
                
                if selectedEnemySpawners[i].y > player.y {
                    
                    selectedEnemySpawnersToRemove.append(i)
                }
                
            } else if direction == "down" {
                
                if selectedEnemySpawners[i].y < player.y {
                    
                    selectedEnemySpawnersToRemove.append(i)
                }
            }
            
        }
        
        removeObjects(type: "selectedEnemySpawners", toRemove: selectedEnemySpawnersToRemove)
    }
    
    func removeUnwantedPowerups(direction: String) {
        
        var selectedPowerupsToRemove = [Int]()
        
        for i in 0 ..< selectedPowerups.count {
            
            if direction == "right" {
                
                if selectedPowerups[i].x < player.x {
                    
                    selectedPowerupsToRemove.append(i)
                }
                
            } else if direction == "up" {
                
                if selectedPowerups[i].y > player.y {
                    
                    selectedPowerupsToRemove.append(i)
                }
                
            } else if direction == "down" {
                
                if selectedPowerups[i].y < player.y {
                    
                    selectedPowerupsToRemove.append(i)
                }
            }
            
        }
        
        removeObjects(type: "selectedPowerups", toRemove: selectedPowerupsToRemove)
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
       
        for i in 0 ..< selectedEnemies.count {
            
//            if selectedEnemies[i].isInBounds() == true {
            
                if direction == "left" {
                    
                    if player.isKnockedBack == true {
                        selectedEnemies[i].setXY(x: selectedEnemies[i].x + Player.knockBackMoveSpeed, y: selectedEnemies[i].y)
                    } else {
                        selectedEnemies[i].setXY(x: selectedEnemies[i].x + Player.maxMoveSpeed, y: selectedEnemies[i].y)
                    }
                    
                } else if direction == "right" {
                    
                    if player.isKnockedBack == true {
                        selectedEnemies[i].setXY(x: selectedEnemies[i].x - Player.knockBackMoveSpeed, y: selectedEnemies[i].y)
                    } else {
                        selectedEnemies[i].setXY(x: selectedEnemies[i].x - Player.maxMoveSpeed, y: selectedEnemies[i].y)
                    }
                }
                
//            }
            
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
    
    func moveObjects(direction: String) {
        
        moveBullets(direction: direction)
        moveDeflectedBullets(direction: direction)
        moveExplosions(direction: direction)
        movePowerups(direction: direction)
        moveEnemies(direction: direction)
        moveEnemyBullets(direction: direction)
    }
    
    func draw() {
        
        removeAllSubviews()
        removeAllLines()
        
        for b in selectedBlocks {
            gameView.addSubview(b.view)
        }
        
        for e in selectedEnemySpawners {
            gameView.addSubview(e.view)
        }
        
        for e in explosions {
            gameView.addSubview(e.view)
        }
        
        for p in powerups {
            gameView.addSubview(p.view)
        }
        
        for p in selectedPowerups {
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
        
        for e in selectedEnemies {
            gameView.addSubview(e.view)
        }
        
//        gameView.addSubview(player.hitBox)
        gameView.addSubview(player.view)
        
        gameView.addSubview(player.healthBar.view)
        gameView.addSubview(player.energyBar.view)

        for t in player.healthBar.ticks {
            gameView.addSubview(t.view)
        }
        
        for t in player.energyBar.ticks {
            gameView.addSubview(t.view)
        }
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
    
    func handleMakePowerup(x: CGFloat, y: CGFloat) {
        
        if CGFloat(arc4random()) / CGFloat(UInt32.max) < chanceOfPowerup {
            
            let random = arc4random_uniform(4)
            
            if random == 0 {
                powerups.append(Powerup(x: x, y: y, type: "smallHealth"))
            } else if random == 1 {
                powerups.append(Powerup(x: x, y: y, type: "largeHealth"))
            } else if random == 2 {
                powerups.append(Powerup(x: x, y: y, type: "smallEnergy"))
            } else {
                powerups.append(Powerup(x: x, y: y, type: "largeEnergy"))
            }

        }
    }

}
