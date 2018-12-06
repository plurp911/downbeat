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
    
    static let eyeImages = [UIImage(named: "eyeEnemy1"), UIImage(named: "eyeEnemy2"), UIImage(named: "eyeEnemy3")]

    static let headImages = [UIImage(named: "headEnemy1"), UIImage(named: "headEnemy2")]

    static let foot1Image = UIImage(named: "footEnemy1")
    static let foot2Image = UIImage(named: "footEnemy2")
    static let footImages = [foot1Image, foot2Image]

    static let checkMargin: CGFloat = Block.width * (1 / 16)

    static var bulletsToRemove = [Int]()

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
    
    var endStunTimer = Timer()
    
    var shootTimeInterval: CGFloat = 0
    
    var totalShootTimeInterval: CGFloat = 0
    
    var stunTimeInterval: CGFloat = 0

    var isUsed: Bool = false
    
    var isStunned: Bool = false
    
    var yRange: CGFloat = 0
    
    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String, direction: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.direction = direction
        
        self.setup(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2), type: type)
    }
    
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
            
//            self.direction = "left"
            
        } else if self.type == "penguin" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width * (24 / 16)
            self.height = Block.height * (15 / 16)
            
            self.moveSpeed = 1.25
            
            self.direction = "left"
            
        } else if self.type == "head" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width
            self.height = Block.height * (20 / 16)
            
            self.moveSpeed = 0.8125
            
//            self.direction = "left"
            
        } else if self.type == "foot" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width
            self.height = Block.height * (8 / 16)
            
            self.moveSpeed = 0.375
            
            self.yRange = Block.height * (2 / 16)
            
            self.direction = "right"
            
        } else if self.type == "eye" {
            
            self.maxHealth = 5
            
            self.damage = 8
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 0.375
            
            //            self.direction = "left"
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
            
            setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            
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
            
        } else if self.type == "head" {
            

            
        } else if self.type == "foot" {
            
            setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            
            self.stunTimeInterval = 1.75
            
            self.view.animationImages = Enemy.footImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            self.view.startAnimating()
            
        } else if self.type == "eye" {
            

            
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
        
        self.isStunned = false
        
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
            
        } else if type == "head" {
            
            
            
        } else if type == "foot" {
            
            if self.isStunned == true {
                
                self.view.stopAnimating()
                
//                if (Int)(self.x) % 2 == 0 {
//                    self.view.image = Enemy.foot1Image
//                } else {
//                    self.view.image = Enemy.foot2Image
//                }
                
                self.view.image = Enemy.foot2Image
            }
            
        } else if type == "eye" {
            
            
            
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
            
        } else if self.type == "hat" {
            
        } else if self.type == "penguin" {
            
            // distance from player spawn ?
            
            self.direction = "left"
            
            self.xSpeed = -self.moveSpeed
            self.ySpeed = 0
            
        } else if self.type == "head" {
            
            
            
        } else if self.type == "foot" {
            
            self.ySpeed = 0
            
            if self.isStunned == true {
                
                self.xSpeed = 0

            } else {
            
                var isEmpty1: Bool = true
                var isEmpty2: Bool = true
                
                for block in selectedBlocks {
                    
                    if self.y + (self.height / 2) + Enemy.checkMargin < block.y + (Block.height / 2) && self.y + (self.height / 2) + Enemy.checkMargin > block.y - (Block.height / 2) && (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2)) {
                        
                        isEmpty1 = false
                    }
                    
                    if self.y + (self.height / 2) + Enemy.checkMargin < block.y + (Block.height / 2) && self.y + (self.height / 2) + Enemy.checkMargin > block.y - (Block.height / 2) && (self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) {
                        
                        isEmpty2 = false
                    }
                }
                
                if isEmpty1 == true || isEmpty2 == true {
                    
                    if self.direction == "left" {
                        
                        self.direction = "right"
                        
                    } else if self.direction == "right" {
                        
                        self.direction = "left"
                    }
                    
                } else {
                    
                    let offset: CGFloat = Block.width * (1 / 16) * 0.1
                    
                    if direction == "right" {
                        
                        for block in selectedBlocks {
                            
                            if block.type != "ladder" && block.type != "topLadder" {
                                
                                if self.x + (self.width / 2) + (self.moveSpeed * 3) < block.x + (Block.width / 2) && self.x + (self.width / 2) + (self.moveSpeed * 3) + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (self.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.direction = "left"
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - (self.moveSpeed * 3), y: self.y)
                                }
                                
                            }
                        }
                        
                    } else if direction == "left" {
                        
                        for block in selectedBlocks {
                            
                            if block.type != "ladder" && block.type != "topLadder" {
                                
                                if self.x + (self.width / 2) + (self.moveSpeed * 3) < block.x + (Block.width / 2) && self.x + (self.width / 2) + (self.moveSpeed * 3) + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.direction = "right"
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - (self.moveSpeed * 3), y: self.y)
                                }
                                
                            }
                        }
                        
                    }
                }

                if abs((self.y + (self.height / 2)) - (player.y + (Player.height / 2))) <= self.yRange {
                    
                    self.xSpeed = moveSpeed * 3
                    
                } else {
                    
                    self.xSpeed = moveSpeed
                }
                
                if self.direction == "left" {
                    self.xSpeed = -self.xSpeed
                }
            }
            
        } else if self.type == "eye" {
            
            
            
        }
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
    
    func didHitBullet() -> Int {
        
        Enemy.bulletsToRemove.removeAll()
        
        for i in 0 ..< bullets.count {
            
            if bullets[i].x + (bullets[i].width / 2) >= self.x - (self.width / 2) && bullets[i].x - (bullets[i].width / 2) <= self.x + (self.width / 2) && bullets[i].y + (bullets[i].height / 2) >= self.y - (self.height / 2) && bullets[i].y - (bullets[i].height / 2) <= self.y + (self.height / 2) {
                
                if self.type == "follower" {
                    
                    return i
                    
                } else if self.type == "hat" {
                    
                    if bullets[i].type == "regular" {
                        
                        if self.isShooting == true {
                            
                            return i
                            
                        } else {
                            
                            self.handleDeflectBullet(i: i)
                        }
                        
                    } else if bullets[i].type == "cutter" {
                        
                        return i
                        
                    } else if bullets[i].type == "blade" {
                        
                        return i
                    }
                    
                } else if self.type == "penguin" {
                    
                    return i
                    
                } else if self.type == "head" {
                    
                    return i
                    
                } else if self.type == "foot" {
                    
                    return i
                    
                } else if self.type == "eye" {
                    
                    return i
                }
                
            }
        }
        
        if Enemy.bulletsToRemove.count > 0 {
            removeObjects(type: "bullets", toRemove: Enemy.bulletsToRemove)
        }
        
        return -1
    }
    
    func handleDeflectBullet(i: Int) {
        
        if bullets[i].xSpeed >= 0 {
            deflectedBullets.append(DeflectedBullet(x: bullets[i].x, y: bullets[i].y, direction: "left"))
        } else {
            deflectedBullets.append(DeflectedBullet(x: bullets[i].x, y: bullets[i].y, direction: "right"))
        }
        
        Enemy.bulletsToRemove.append(i)
    }
    
    func handleHit(bulletDamage: Int) {
        
        self.isHit = true

        if self.type == "foot" {
            
            self.isStunned = true
            
            self.endStunTimer.invalidate()
            
            self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)

        } else {
            
            self.health -= bulletDamage
        }
        
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
            
        } else if self.type == "head" {
            
            
            
        } else if self.type == "foot" {
            
            
            
        } else if self.type == "eye" {
            
            
            
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
    
    @objc func stopStun() {
        
        self.isStunned = false
        
        self.view.animationImages = Enemy.footImages as! [UIImage]
        
        self.view.animationDuration = 0.85 * 0.15
        self.view.startAnimating()
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
        self.endStunTimer.invalidate()
    }
}
