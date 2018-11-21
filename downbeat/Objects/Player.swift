//
//  Player.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Player {
    
    // CONSTANTS
    
    static let maxHealth: Int = 100
    
    static let width: CGFloat = Block.width * 0.75
    static let height: CGFloat = Block.height * 1.5
    
    static let maxFallSpeed: CGFloat = 4
    
    static let maxMoveSpeed: CGFloat = 1
    
    static let ySpeedChange: CGFloat = 0.105

//    static let color: UIColor = UIColor.lightGray
    static let color: UIColor = UIColor.clear

    static let hitBoxColor: UIColor = UIColor.red.withAlphaComponent(0.5)

    static let runRightImages = [UIImage(named: "playerRunRight1"), UIImage(named: "playerRunRight2"), UIImage(named: "playerRunRight3"), UIImage(named: "playerRunRight2")]
    static let runRightHitImages = [UIImage(named: "playerRunRight1"), UIImage(named: "empty"), UIImage(named: "playerRunRight2"), UIImage(named: "empty"), UIImage(named: "playerRunRight3"), UIImage(named: "empty"), UIImage(named: "playerRunRight2"), UIImage(named: "empty")]

    static let runShootRightImages = [UIImage(named: "playerRunShootRight1"), UIImage(named: "playerRunShootRight2"), UIImage(named: "playerRunShootRight3"), UIImage(named: "playerRunShootRight2")]
    static let runShootRightHitImages = [UIImage(named: "playerRunShootRight1"), UIImage(named: "empty"), UIImage(named: "playerRunShootRight2"), UIImage(named: "empty"), UIImage(named: "playerRunShootRight3"), UIImage(named: "empty"), UIImage(named: "playerRunShootRight2"), UIImage(named: "empty")]

    static let jumpRightImage = UIImage(named: "playerJumpRight")
    static let jumpRightHitImages = [UIImage(named: "playerJumpRight"), UIImage(named: "empty")]

    static let jumpShootRightImage = UIImage(named: "playerJumpShootRight")
    static let jumpShootRightHitImages = [UIImage(named: "playerJumpShootRight"), UIImage(named: "empty")]

    static let standRightImage = UIImage(named: "playerStandRight")
    static let standRightHitImages = [UIImage(named: "playerStandRight"), UIImage(named: "empty")]

    static let standShootRightImage = UIImage(named: "playerStandShootRight")
    static let standShootRightHitImages = [UIImage(named: "playerStandShootRight"), UIImage(named: "empty")]

    static let xShift: CGFloat = Block.width * (16 / 30)
    static let yShift: CGFloat = Block.height * 0
    
    static let animationCycleTime: Double = 0.55

    // VARIABLES

    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var isRising: Bool = false
    var isFalling: Bool = false
    
    var isJumping: Bool = false
    var isShooting: Bool = false
    
    var isMoving: Bool = false
    
    var isHit: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false

    var canMove: Bool = true

    var health: Int = 0
    
    var direction: String = "right"
    
    var shootTimer = Timer()
    
    var endHitTimer = Timer()
    var hitAnimationTimer = Timer()
    
    var view: UIImageView = UIImageView()
    var hitBox: UIView = UIView()

    init() {
        
        self.health = Player.maxHealth
        
        setXY(x: self.x, y: self.y)
    
        self.view.frame.size.width = Block.width * (30 / 16)
        self.view.frame.size.height = Block.height * (30 / 16)
        
        self.view.backgroundColor = Player.color

        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.hitBox.backgroundColor = Player.hitBoxColor
        
        self.hitBox.frame.size.width = Player.width
        self.hitBox.frame.size.height = Player.height
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        if self.direction == "left" {
            self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift - (Block.width * (1 / 16))
        } else if self.direction == "right" {
            self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift
        }
        
        self.view.frame.origin.y = self.y - Player.height / 2 - Player.yShift
        
        self.hitBox.frame.origin.x = self.x - Player.width / 2
        self.hitBox.frame.origin.y = self.y - Player.height / 2
    }
    
//    func didHitGoal() -> Bool {
//
////        if distance(x1: goal.x, y1: goal.y, x2: player.x, y2: player.y) <= Player.radius + (Goal.width / 2) {
////            return true
////        }
//
//        return false
//    }
    
    func reset() {

        self.setXY(x: currentStage.playerStartX, y: currentStage.playerStartY)

        self.isFalling = true
        
        self.xSpeed = 0
        self.ySpeed = 0

        self.isRising = false
        
        self.isJumping = false
        self.isShooting = false
        
        self.isMoving = false
        
        self.isHit = false
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
        self.canMove = true
        
        self.health = Player.maxHealth
        
        self.direction = "right"
    }
    
    func move(direction: String) {
        
        self.direction = direction
        
        if self.direction == "left" {
            
            xSpeed = -Player.maxMoveSpeed
            
            setXY(x: self.x + self.xSpeed, y: self.y)
            
        } else if self.direction == "right" {
            
            xSpeed = Player.maxMoveSpeed
            
            setXY(x: self.x + self.xSpeed, y: self.y)
        }
    }
    
    func move() {
        
        self.xSpeed = 0
        
        if self.ySpeed != 0 {
            self.updateAnimation()
        }

        if self.isJumping == true || self.isFalling == true {
            
            self.setXY(x: self.x, y: self.y + ySpeed)
            
            self.ySpeed += Player.ySpeedChange
            
            if self.ySpeed > 0 {
                
                self.isFalling = true

                self.isRising = false
                
                if self.ySpeed > Player.maxFallSpeed {
                    self.ySpeed = Player.maxFallSpeed
                }
                
            } else if ySpeed < 0 {
                
                self.isRising = true

                self.isFalling = false
            }
        }
        
        if self.isMoving == true {

            var isEmpty: Bool = true
            
            for block in currentStage.blocks {
                
                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                    
                    isEmpty = false
                }
            }
            
            if isEmpty == true {
                
                self.isFalling = true
            }
        }
        
        if self.isFalling == true {
            
            for block in currentStage.blocks {
                
                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                    
                    self.isJumping = false
                    self.isFalling = false
                    
                    self.ySpeed = 0
                    
                    setXY(x: self.x, y: block.y - (Block.height / 2) - (Player.height / 2))
                    
                    self.updateAnimation()
                }
            }
            
        }
        
        if self.isRising == true {
            
            for block in currentStage.blocks {
                
//                if self.y - (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                if self.y - (Player.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {

                    self.isFalling = true

                    self.isJumping = false
                    self.isRising = false

                    self.ySpeed = 0

                    setXY(x: self.x, y: block.y + (Block.height / 2) + (Player.height / 2))
                }
            }
            
        }
        
        if isMoving == true {
            
            self.canMove = true
            
            for block in currentStage.blocks {
                
                if self.isMovingRight == true {
                    
                    if self.x + (Player.width / 2) + Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x + (Player.width / 2) + Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                        
                        self.canMove = false
                        
                        setXY(x: block.x - (Block.width / 2) - (Player.width / 2) - Player.maxMoveSpeed, y: self.y)
                    }
                    
                } else if self.isMovingLeft == true {
                    
                    if self.x - (Player.width / 2) - Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x - (Player.width / 2) - Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                        
                        self.canMove = false

                        setXY(x: block.x + (Block.width / 2) + (Player.width / 2), y: self.y)
                    }
                }
                
            }
        }
        
    }
    
    func jump() {
        
        self.isJumping = true
        self.isRising = true
        
        self.ySpeed = -Player.maxFallSpeed
    }
    
    func shoot() {
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShooting == false {
            
            self.isShooting = true

            self.shootTimer = Timer.scheduledTimer(timeInterval: 0.125, target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
            if self.direction == "left" {
                
                bullets.append(Bullet(x: self.x - (Player.width / 2), y: self.y, direction: self.direction))
                
            } else if self.direction == "right" {
                
                bullets.append(Bullet(x: self.x + (Player.width / 2), y: self.y, direction: self.direction))
            }
        }
        
    }
    
    @objc func stopShoot() {
        
        canMoveLeft = true
        canMoveRight = true
        
        self.isShooting = false
        
        player.updateAnimation()
    }
    
    func updateAnimation() {
        
        print("RUN")
            
        if ySpeed != 0 {
            
            if direction == "left" {

                self.handleJumpAnimation()
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
                self.handleJumpAnimation()
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if isMoving == true {
            
            if isMovingLeft == true {
                
                if canMoveLeft == true {
                    
                    canMoveLeft = false
                    
                    canMoveRight = true

                    self.handleRunAnimation()

                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                }
                
            } else if isMovingRight == true {
                
                if canMoveRight == true {
                    
                    canMoveRight = false
                    
                    canMoveLeft = true

                    self.handleRunAnimation()
                    
                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
            
        } else if isMoving == false && ySpeed == 0 && isJumping == false && self.isFalling == false && self.isRising == false {
            
            if direction == "left" {
                
                self.handleStandAnimation()
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
                self.handleStandAnimation()

                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
        
        setXY(x: self.x, y: self.y)
    }
    
    func handleJumpAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShooting == true {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.jumpShootRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 0.5
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.image = Player.jumpShootRightImage
//            }
            
            self.view.image = Player.jumpShootRightImage

        } else {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.jumpRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 0.5
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.image = Player.jumpRightImage
//            }
            
            self.view.image = Player.jumpRightImage
        }
        
    }
    
    func handleRunAnimation() {
        
        self.view.stopAnimating()
        
        if self.isShooting == true {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.runShootRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 2
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.animationImages = Player.runShootRightImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime
//                self.view.startAnimating()
//            }
            
            self.view.animationImages = Player.runShootRightImages as! [UIImage]
            
            self.view.animationDuration = Player.animationCycleTime
            self.view.startAnimating()
            
        } else {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.runRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 2
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.animationImages = Player.runRightImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime
//                self.view.startAnimating()
//            }
            
            self.view.animationImages = Player.runRightImages as! [UIImage]
            
            self.view.animationDuration = Player.animationCycleTime
            self.view.startAnimating()
        }
        
    }
    
    func handleStandAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShooting == true {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.standShootRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 0.5
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.image = Player.standShootRightImage
//            }
            
            self.view.image = Player.standShootRightImage

        } else {
            
//            if self.isHit == true {
//
//                self.view.animationImages = Player.standRightHitImages as! [UIImage]
//
//                self.view.animationDuration = Player.animationCycleTime * 0.5
//                self.view.startAnimating()
//
//            } else {
//
//                self.view.image = Player.standRightImage
//            }
            
            self.view.image = Player.standRightImage
        }
        
    }
    
    func handlePowerup(type: String) {
        
        if type == "largeHealth" {
            
            self.health += 30
            
            if self.health > Player.maxHealth {
                self.health = Player.maxHealth
            }
        }
        
    }
    
    func didHitPowerup() -> Int {
        
        for i in 0 ..< powerups.count {
            
            if powerups[i].x + (powerups[i].width / 2) >= self.x - (Player.width / 2) && powerups[i].x - (powerups[i].width / 2) <= self.x + (Player.width / 2) && powerups[i].y + (powerups[i].width / 2) >= self.y - (Player.height / 2) && powerups[i].y - (powerups[i].width / 2) <= self.y + (Player.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func didHitEnemy() -> Int {
        
        for i in 0 ..< currentStage.enemies.count {
            
            if currentStage.enemies[i].x + (currentStage.enemies[i].width / 2) >= self.x - (Player.width / 2) && currentStage.enemies[i].x - (currentStage.enemies[i].width / 2) <= self.x + (Player.width / 2) && currentStage.enemies[i].y + (currentStage.enemies[i].width / 2) >= self.y - (Player.height / 2) && currentStage.enemies[i].y - (currentStage.enemies[i].width / 2) <= self.y + (Player.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func stopJump() {
        
        self.isFalling = true
        
        self.isJumping = false
        self.isRising = false
        
        self.ySpeed = 0
    }
    
    func handleHit(damage: Int) {
        
        print("000000000000000000")
        
//        canMoveLeft = true
//        canMoveRight = true
        
        self.isHit = true
        
        self.health -= damage
        
        if self.health <= 0 {
            print("GAME OVER")
        }
        
        self.endHitTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(endHit), userInfo: nil, repeats: false)
        self.hitAnimationTimer = Timer.scheduledTimer(timeInterval: Player.animationCycleTime / 5, target: self, selector: #selector(handleHitAnimation), userInfo: nil, repeats: true)

//        self.updateAnimation()
    }
    
    @objc func endHit() {
        
        self.hitAnimationTimer.invalidate()

        self.view.isHidden = false
        
//        canMoveLeft = true
//        canMoveRight = true
        
        self.isHit = false
        
//        player.updateAnimation()
    }
    
    @objc func handleHitAnimation() {
        self.view.isHidden = !self.view.isHidden
    }
}
