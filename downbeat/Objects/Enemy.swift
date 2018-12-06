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
    
    static let penguinLeftImages = [UIImage(named: "penguinEnemyLeft1"), UIImage(named: "penguinEnemyLeft2")]
    
    // VARIABLES
    
    var maxHealth: Int = 0
    
    var damage: Int = 0
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var moveSpeed: CGFloat = 0
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xPos: Int = -1
    var yPos: Int = -1
    
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
    
    var shootTimer = Timer()
    var endShootTimer = Timer()
    //    var endShootAnimation = Timer()
    
    var shootTimeInterval: CGFloat = 0
    
    var totalShootTimeInterval: CGFloat = 0
    
    var isUsed: Bool = false
    
    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.setup(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2), type: type)
    }
    
    init(x: CGFloat, y: CGFloat, type: String) {
        
        self.setup(x: x, y: y, type: type)
    }
    
    func setup(x: CGFloat, y: CGFloat, type: String) {
        
        self.type = type
        
        if self.type == "follower" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 0.375
            
            self.direction = "left"
            
        } else if self.type == "hat" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width * (18 / 16)
            self.height = self.width
            
            self.moveSpeed = 0
            
            self.direction = "left"
            
        } else if self.type == "penguin" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width * (24 / 16)
            self.height = Block.width * (15 / 16)
            
            self.moveSpeed = 1.25
            
            self.direction = "left"
        }
        
        self.health = self.maxHealth
        
        self.setXY(x: x, y: y)
        
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
            
            //            self.shootTimeInterval = 3.25
            self.shootTimeInterval = 2.25
            
            self.totalShootTimeInterval = 0.875
            
            self.view.image = Enemy.hatLeft1Image
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            //            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: true)
            
        } else if self.type == "penguin" {
            
            self.view.animationImages = Enemy.penguinLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
    }
    
    func reset() {
        
        //        if self.type == "follower" {
        //
        //            self.direction = "left"
        //
        //        } else if self.type == "penguin" {
        //
        //            self.direction = "left"
        //        }
        //
        //        self.isFalling = false
        //
        //        self.xSpeed = 0
        //        self.ySpeed = 0
        //
        //        self.isRising = false
        //
        //        self.isJumping = false
        //
        //        self.isShooting = false
        ////        self.isShootingAnimation = false
        //
        //        self.isMoving = false
        //
        //        self.isHit = false
        //
        //        self.isMovingLeft = false
        //        self.isMovingRight = false
        //
        //        self.canMove = true
        //
        //        self.health = self.maxHealth
        //
        //        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))
        
        self.xSpeed = 0
        self.ySpeed = 0
        
        self.isRising = false
        self.isFalling = false
        
        self.isJumping = false
        
        self.isShooting = false
        //    self.isShootingAnimation = false
        
        self.isMoving = false
        
        self.isHit = false
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
        self.canMove = true
        
        self.isUsed = false
        
        self.setup(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2), type: self.type)
    }
    
    func updateAnimation() {
        
        if type == "follower" {
            
        } else if type == "hat" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.hatLeft2Image
                
            } else {
                
                self.view.image = Enemy.hatLeft1Image
            }
            
        } else if type == "penguin" {
            
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
                
            } else if player.y < self.y {
                
                self.ySpeed = -self.moveSpeed
                
            } else {
                
                self.ySpeed = 0
            }
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
            
        } else if self.type == "hat" {
            
        } else if self.type == "penguin" {
            
            // distance from player spawn ?
            
            self.direction = "left"
            
            self.xSpeed = -self.moveSpeed
            self.ySpeed = 0
            
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
        
        var bulletsToRemove = [Int]()
        
        for i in 0 ..< bullets.count {
            
            if bullets[i].x + (bullets[i].width / 2) >= self.x - (self.width / 2) && bullets[i].x - (bullets[i].width / 2) <= self.x + (self.width / 2) && bullets[i].y + (bullets[i].height / 2) >= self.y - (self.height / 2) && bullets[i].y - (bullets[i].height / 2) <= self.y + (self.height / 2) {
                
                if self.type == "follower" {
                    
                    return i
                    
                } else if self.type == "hat" {
                    
                    if bullets[i].type == "regular" {
                        
                        if self.isShooting == true {
                            
                            return i
                            
                        } else {
                            
                            if bullets[i].xSpeed >= 0 {
                                deflectedBullets.append(DeflectedBullet(x: bullets[i].x, y: bullets[i].y, direction: "left"))
                            } else {
                                deflectedBullets.append(DeflectedBullet(x: bullets[i].x, y: bullets[i].y, direction: "right"))
                            }
                            
                            bulletsToRemove.append(i)
                        }
                        
                    } else if bullets[i].type == "cutter" {
                        
                        return i
                        
                    } else if bullets[i].type == "blade" {
                        
                        return i
                    }
                    
                } else if self.type == "penguin" {
                    
                    return i
                }
                
            }
        }
        
        if bulletsToRemove.count > 0 {
            removeObjects(type: "bullets", toRemove: bulletsToRemove)
        }
        
        return -1
    }
    
    func handleHit(bulletDamage: Int) {
        
        self.isHit = true
        
        self.health -= bulletDamage
        
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
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
        }
    }
    
    @objc func realShoot() {
        
        if self.type == "follower" {
            
        } else if self.type == "hat" {
            
            if self.direction == "left" {
                
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: -0.75, type: "smallRegular"))
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 0, type: "smallRegular"))
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 0.75, type: "smallRegular"))
                
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: -1.5, type: "smallRegular"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 0, type: "smallRegular"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: -1.5, ySpeed: 1.5, type: "smallRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {
                
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: -0.75, type: "smallRegular"))
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 0, type: "smallRegular"))
                //                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 0.75, type: "smallRegular"))
                
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: -1.5, type: "smallRegular"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 0, type: "smallRegular"))
                enemyBullets.append(EnemyBullet(x: self.x, y: self.y, xSpeed: 1.5, ySpeed: 1.5, type: "smallRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "penguin" {
            
        }
    }
    
    //    func updateFreeze() {
    //
    //        if isPaused == true {
    //
    //            if self.view.isAnimating == true {
    //                self.view.stopAnimating()
    //            }
    //
    //        } else {
    //
    //            self.view.startAnimating()
    //        }
    //    }
    
    @objc func stopShoot() {
        
        //        self.canMove = true
        
        self.isShooting = false
    }
    
    func startTimers() {
        
        if self.shootTimeInterval > 0 {
            
            if self.shootTimer.isValid == false {
                
                self.shootTimer.invalidate()
                
                self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    func endTimers() {
        self.shootTimer.invalidate()
        self.endShootTimer.invalidate()
    }
}
