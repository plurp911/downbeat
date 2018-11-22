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
//    static let color: UIColor = UIColor.green
    
    static let followerImages = [UIImage(named: "follower1"), UIImage(named: "follower2"), UIImage(named: "follower3"), UIImage(named: "follower4"), UIImage(named: "follower5"), UIImage(named: "follower6")]
    
    static let hatLeft1Image = UIImage(named: "hatEnemyLeft1")
    static let hatLeft2Image = UIImage(named: "hatEnemyLeft2")

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
//    var isShootingAnimation: Bool = false

    var isMoving: Bool = false
    
    var isHit: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false
    
    var canMove: Bool = true
    
    var health: Int = 0
    
    var direction: String = ""
    
    var type: String = ""
    
    var view: UIImageView = UIImageView()
    
    var shootTimer = Timer()
    var endShootTimer = Timer()
//    var endShootAnimation = Timer()

    var shootTimeInterval: CGFloat = 0

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
            
        } else if self.type == "hat" {
            
            self.maxHealth = 10
            
            self.damage = 5
            
            self.width = Block.width * (18 / 16)
            self.height = self.width
            
            self.moveSpeed = 0
            
            self.direction = "right"
        }
        
        self.health = self.maxHealth
        
        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))

        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = Enemy.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()

        if self.type == "follower" {
            
            self.view.animationImages = Enemy.followerImages as! [UIImage]
            
            self.view.animationDuration = 0.85
            self.view.startAnimating()
            
        } else if self.type == "hat" {
            
            self.shootTimeInterval = 3.25
            
            self.view.image = Enemy.hatLeft1Image
            
            if self.direction == "right" {
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            } else if self.direction == "left" {
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: true)
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
    }
    
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
//        self.isShootingAnimation = false
        
        self.isMoving = false
        
        self.isHit = false
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
        self.canMove = true
        
        self.health = self.maxHealth

        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))
    }
    
    func updateAnimation() {
        
        if type == "follower" {
            
        } else if type == "hat" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.hatLeft2Image

            } else {
                
                self.view.image = Enemy.hatLeft1Image
            }
        }
        
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
            
        } else if self.type == "hat" {
            
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
                
                
                if self.type == "hat" {
                    
                    if self.isShooting == true {
                        return i
                    }
                    
                } else if self.type == "hat" {
                    
                    return i
                }
                
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
    
//    func jump() {
//
//    }

    @objc func shoot() {

        if self.isShooting == false {
            
            self.isShooting = true
            //            self.isShootingAnimation = true
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: 0.5 / 2, target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
        }
    }
    
    @objc func realShoot() {
        
        if self.type == "follower" {
            
        } else if self.type == "hat" {
            
            if self.direction == "left" {
                
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: -0.75, type: "smallEnemyBullet"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 0, type: "smallEnemyBullet"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 0.75, type: "smallEnemyBullet"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: 0.5 / 2, target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)

            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: -0.75, type: "smallEnemyBullet"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 0, type: "smallEnemyBullet"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 0.75, type: "smallEnemyBullet"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: 0.5 / 2, target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
        }
        
    }
    
    @objc func stopShoot() {
        
//        self.canMove = true
        
        self.isShooting = false
    }
    
    func endTimers() {
        self.shootTimer.invalidate()
        self.endShootTimer.invalidate()
    }
}
