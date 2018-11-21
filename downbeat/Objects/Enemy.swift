//
//  Enemy.swift
//  downbeat
//
//  Created by Collin Howard on 11/19/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Enemy {
    
    // CONSTANTS
    
//    static let maxFallSpeed: CGFloat = 4
//
//    static let maxMoveSpeed: CGFloat = 1
//
//    static let ySpeedChange: CGFloat = 0.08
    
    static let color: UIColor = UIColor.clear
//    static let color: UIColor = UIColor.blue
    
    static let followerImages = [UIImage(named: "follower1"), UIImage(named: "follower2"), UIImage(named: "follower3"), UIImage(named: "follower4"), UIImage(named: "follower5"), UIImage(named: "follower6")]
    
    // VARIABLES
    
    var maxHealth: Int = 0
    
    var damage: Int = 0

    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var moveSpeed: CGFloat = 0
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xPos: Int = 0
    var yPos: Int = 0
    
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
    
    var direction: String = ""
    
    var type: String = ""
    
    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        if self.type == "follower" {
            
            self.maxHealth = 10
            
            self.damage = 5
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 0.375
            
            self.direction = "left"
        }
        
        self.health = self.maxHealth
        
        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))

        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = Enemy.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.type == "follower" {

            self.view.stopAnimating()
            
            self.view.animationImages = Enemy.followerImages as! [UIImage]
            
            self.view.animationDuration = 0.85
            self.view.startAnimating()
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
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
        
        if self.type == "follower" {
            
            self.direction = "left"
        }
        
        self.isFalling = false
        
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
        
        self.health = self.maxHealth

        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))
    }
    
    func move() {
        
        if self.type == "follower" {
            
            if player.x > self.x {
                
                self.direction = "right"
                
                self.xSpeed = self.moveSpeed

            } else if player.x < self.x {
                
                self.direction = "left"
                
                self.xSpeed = -self.moveSpeed

            } else {
                
                self.xSpeed = 0
            }
            
            if player.y > self.y {
                
                self.ySpeed = self.moveSpeed
                
            } else if player.x < self.x {
                
                self.ySpeed = -self.moveSpeed
                
            } else {
                
                self.ySpeed = 0
            }
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
        }
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
    
    func didHitBullet() -> Int {
        
        for i in 0 ..< bullets.count {
            
            if bullets[i].x + Bullet.radius >= self.x - (self.width / 2) && bullets[i].x - Bullet.radius <= self.x + (self.width / 2) && bullets[i].y + Bullet.radius >= self.y - (self.height / 2) && bullets[i].y - Bullet.radius <= self.y + (self.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func handleHit() {
        
        self.isHit = true

        self.health -= Bullet.damage
        
        self.isHit = false
    }
    
    func isDead() -> Bool {
        
        if self.health <= 0 {
            return true
        }
        
        return false
    }
    
//    func move() {
//
//        xSpeed = 0
//
//        if self.isJumping == true || self.isFalling == true {
//
//            setXY(x: self.x, y: self.y + ySpeed)
//
//            self.ySpeed += Player.ySpeedChange
//
//            if self.ySpeed > 0 {
//
//                self.isFalling = true
//
//                self.isRising = false
//
//                if self.ySpeed > Player.maxFallSpeed {
//                    self.ySpeed = Player.maxFallSpeed
//                }
//
//            } else if ySpeed < 0 {
//
//                self.isRising = true
//
//                self.isFalling = false
//            }
//        }
//
//        if self.isMoving == true {
//
//            var isEmpty: Bool = true
//
//            for block in currentStage.blocks {
//
//                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
//
//                    isEmpty = false
//                }
//            }
//
//            if isEmpty == true {
//
//                self.isFalling = true
//            }
//        }
//
//        if self.isFalling == true {
//
//            for block in currentStage.blocks {
//
//                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
//
//                    self.isJumping = false
//                    self.isFalling = false
//
//                    self.ySpeed = 0
//
//                    setXY(x: self.x, y: block.y - (Block.height / 2) - (Player.height / 2))
//                }
//            }
//
//        } else if isRising == true {
//
//            for block in currentStage.blocks {
//
//                if self.y - (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
//
//                    self.isFalling = true
//
//                    self.isJumping = false
//                    self.isRising = false
//
//                    self.ySpeed = 0
//
//                    setXY(x: self.x, y: block.y + (Block.height / 2) + (Player.height / 2))
//                }
//            }
//
//        }
//
//        if isMoving == true {
//
//            self.canMove = true
//
//            for block in currentStage.blocks {
//
//                if self.isMovingRight == true {
//
//                    if self.x + (Player.width / 2) + Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x + (Player.width / 2) + Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
//
//                        self.canMove = false
//
//                        setXY(x: block.x - (Block.width / 2) - (Player.width / 2) - Player.maxMoveSpeed, y: self.y)
//                    }
//
//                } else if self.isMovingLeft == true {
//
//                    if self.x - (Player.width / 2) - Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x - (Player.width / 2) - Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
//
//                        self.canMove = false
//
//                        setXY(x: block.x + (Block.width / 2) + (Player.width / 2), y: self.y)
//                    }
//                }
//
//            }
//        }
//
//    }
//
//    func jump() {
//
//        self.isJumping = true
//        self.isRising = true
//
//        self.ySpeed = -Player.maxFallSpeed
//    }
//
//    func shoot() {
//
//        self.isShooting = true
//
//        if self.direction == "left" {
//
//            bullets.append(Bullet(x: self.x - (Player.width / 2), y: self.y, direction: self.direction))
//
//        } else if self.direction == "right" {
//
//            bullets.append(Bullet(x: self.x + (Player.width / 2), y: self.y, direction: self.direction))
//        }
//
//        self.isShooting = false
//    }
}
