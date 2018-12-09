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
//        static let color: UIColor = UIColor.green
    
    static let hitBoxColor: UIColor = UIColor.red.withAlphaComponent(0.5)

    static let followerImages = [UIImage(named: "followerEnemy1"), UIImage(named: "followerEnemy2"), UIImage(named: "followerEnemy3"), UIImage(named: "followerEnemy4"), UIImage(named: "followerEnemy5"), UIImage(named: "followerEnemy6")]
    
    static let hatLeft1Image = UIImage(named: "hatEnemyLeft1")
    static let hatLeft2Image = UIImage(named: "hatEnemyLeft2")
    
    static let penguinLeftImages = [UIImage(named: "penguinEnemyLeft1"), UIImage(named: "penguinEnemyLeft2")]
    
    static let eyeClosedImage = UIImage(named: "eyeEnemy1")
    static let eyeOpenImage = UIImage(named: "eyeEnemy3")
    static let eyeImages = [UIImage(named: "eyeEnemy2")]

    static let headImages = [UIImage(named: "headEnemy1"), UIImage(named: "headEnemy2")]

    static let foot1Image = UIImage(named: "footEnemy1")
    static let foot2Image = UIImage(named: "footEnemy2")
    static let footImages = [foot1Image, foot2Image]

    static let snakeLeft1Image = UIImage(named: "snakeEnemyLeft1")
    static let snakeLeft2Image = UIImage(named: "snakeEnemyLeft2")
    static let snakeLeftShootImage = UIImage(named: "snakeEnemyLeftShoot")
    
    static let dropImages = [UIImage(named: "dropEnemy1"), UIImage(named: "dropEnemy2")]
    static let dropEmptyImages = [UIImage(named: "dropEnemyEmpty1"), UIImage(named: "dropEnemyEmpty2")]
    static let dropDropImage = UIImage(named: "dropEnemyDrop")
    static let dropHeadImage = UIImage(named: "dropEnemyHead")

    static let sprinklerImages = [UIImage(named: "sprinklerEnemy1"), UIImage(named: "sprinklerEnemy2"), UIImage(named: "sprinklerEnemy3")]
    static let sprinklerDownImage = UIImage(named: "sprinklerEnemyDown")
    
    static let turretLeftOpenImages = [UIImage(named: "turretEnemyLeft1"), UIImage(named: "turretEnemyLeft2")]
    static let turretLeftCloseImages = [UIImage(named: "turretEnemyLeft2"), UIImage(named: "turretEnemyLeft1")]
    static let turretLeftClosedImage = UIImage(named: "turretEnemyClosedLeft")
    static let turretLeftOpenImage = UIImage(named: "turretEnemyOpenLeft")
    
    static let jumperEnemyLeft1Image = UIImage(named: "jumperEnemyLeft1")
    static let jumperEnemyLeft2Image = UIImage(named: "jumperEnemyLeft2")
    static let jumperEnemyLeftJumpImage = UIImage(named: "jumperEnemyLeftJump")

    static let minerEnemyThrowLeftImage = UIImage(named: "minerEnemyThrowLeft")
    static let minerEnemySignalLeftImage = UIImage(named: "minerEnemySignalLeft")
    static let minerEnemyShieldLeftImage = UIImage(named: "minerEnemyShieldLeft")
    
    static let checkMargin: CGFloat = Block.width * (1 / 16)

    static let hitTimeInterval: CGFloat = 0.05
//    static let hitTimeInterval: CGFloat = 0.0625

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
    
    var isSignalling: Bool = false

    var isMoving: Bool = false
    
    var isHit: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false
    
//    var canMove: Bool = true
    
    var health: Int = 0
    
    var direction: String = ""
    var startDirection: String = ""

    var type: String = ""
    
    var shootTimer = Timer()
    var endShootTimer = Timer()
    //    var endShootAnimation = Timer()

    var signalTimer = Timer()

    var endStunTimer = Timer()
    
    var endHitTimer = Timer()

    var jumpTimer = Timer()

    var shootTimeInterval: CGFloat = 0
    var signalTimeInterval: CGFloat = 0

    var totalShootTimeInterval: CGFloat = 0
    
    var stunTimeInterval: CGFloat = 0
    
    var betweenShotsTimeInterval: CGFloat = 0

    var jumpTimeInterval: CGFloat = 0
    
    var isUsed: Bool = false
    
    var isStunned: Bool = false
    
    var yRange: CGFloat = 0
    
    var isResetting: Bool = false
    
    var xGoal: CGFloat = 0
    
    var shootCount: Int = 0
    
    var didReachGoal1: Bool = false
    var didReachGoal2: Bool = false

    var startY: CGFloat = 0

    var moveCount: CGFloat = 0
    
    var xShift: CGFloat = 0
    var yShift: CGFloat = 0
    
    var ySpeedChange: CGFloat = 0
    var maxFallSpeed: CGFloat = 0
    
    var view: UIImageView = UIImageView()
    var hitBox: UIView = UIView()

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
            
        } else if self.type == "penguin" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width * (24 / 16)
            self.height = Block.height * (15 / 16)
            
            self.moveSpeed = 0.5
            
        } else if self.type == "head" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.xGoal = Block.width * 4
            
            self.width = Block.width
            self.height = Block.height * (20 / 16)
            
            self.moveSpeed = 1
            
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
            
            self.moveSpeed = 1
            
        } else if self.type == "snake" {
            
            self.maxHealth = 3
            
            self.damage = 3
            
            self.width = Block.width * (26 / 16)
            self.height = Block.height * (23 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "drop" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.xGoal = Block.width * (6 / 16)

            self.width = Block.width
            self.height = Block.height * (25 / 16)
            
            self.moveSpeed = 1.25
            
        } else if self.type == "sprinkler" {
            
            self.maxHealth = 5
            
            self.damage = 3
            
            self.xGoal = Block.width * 5
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 0
            
        } else if self.type == "turret" {
            
            self.maxHealth = 3
            
            self.damage = 3
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 0
            
        } else if self.type == "jumper" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.ySpeedChange = 0.135
            self.maxFallSpeed = 4

            self.width = Block.width * (24 / 16)
            self.height = Block.height * (12 / 16)
            
            self.moveSpeed = 1
            
        } else if self.type == "miner" {
            
            self.maxHealth = 3
            
            self.damage = 5
            
            self.width = Block.width * (34 / 16)
            self.height = Block.height * (24 / 16)
            
            self.moveSpeed = 0
        }
        
        self.hitBox.backgroundColor = Enemy.hitBoxColor
        
        self.hitBox.frame.size.width = self.width
        self.hitBox.frame.size.height = self.height
        
        if self.type == "jumper" {
            
            self.xShift = -Block.width * (1 / 16)
            self.yShift = -Block.height * (14 / 16)

            self.view.frame.size.width = Block.width * (26 / 16)
            self.view.frame.size.height = Block.height * (26 / 16)
            
        } else if self.type == "miner" {
            
//            self.xShift = Block.width * (6 / 16)
//            self.yShift = Block.height * (0 / 16)
            
            self.view.frame.size.width = Block.width * (24 / 16)
            self.view.frame.size.height = self.height
            
        } else {
            
            self.view.frame.size.width = self.width
            self.view.frame.size.height = self.height
        }
        
        self.health = self.maxHealth
        
        if self.isResetting == false {
            self.setXY(x: x, y: y)
        }

        self.view.backgroundColor = Enemy.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()
        
        if self.type == "follower" {
            
            self.view.animationImages = Enemy.followerImages as! [UIImage]
            
            self.view.animationDuration = 0.85
            self.view.startAnimating()
            
        } else if self.type == "hat" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 2.25
            
            self.totalShootTimeInterval = 0.875
            
            self.view.image = Enemy.hatLeft1Image
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "penguin" {
            
            self.startY = self.y
            
            self.view.animationImages = Enemy.penguinLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
        } else if self.type == "head" {
            
            self.view.animationImages = Enemy.headImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
        } else if self.type == "foot" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.stunTimeInterval = 1.75
            
            self.view.animationImages = Enemy.footImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            self.view.startAnimating()
            
        } else if self.type == "eye" {
            
            self.isStunned = true
            
            self.stunTimeInterval = 2

            self.view.image = Enemy.eyeClosedImage
        
        } else if self.type == "snake" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 1.75
            self.signalTimeInterval = 0.3
            
            self.totalShootTimeInterval = 0.3
            
            self.view.image = Enemy.snakeLeft1Image
            
            if self.direction == "right" {
                
                //                setXY(x: self.x + (Block.width * (5 / 16)), y: self.y)
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                //                setXY(x: self.x - (Block.width * (5 / 16)), y: self.y)
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "drop" {
            
            self.view.animationImages = Enemy.dropImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
        } else if self.type == "sprinkler" {
            
            self.shootTimeInterval = 2.25
            
            self.totalShootTimeInterval = 0.875
            
            self.view.image = Enemy.sprinklerDownImage
        
            self.direction = "left"
            
        } else if self.type == "turret" {
            
            self.shootTimeInterval = 2.25

            self.totalShootTimeInterval = 0.875
            
            self.betweenShotsTimeInterval = 0.75
            
            self.view.image = Enemy.turretLeftClosedImage
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "jumper" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.jumpTimeInterval = 1.75

            self.signalTimeInterval = 0.3

            self.view.image = Enemy.jumperEnemyLeft1Image
            
            self.direction = "left"
            
        } else if self.type == "miner" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 2.25
            
//            self.signalTimeInterval = 0.2
            self.signalTimeInterval = 0.25

//            self.totalShootTimeInterval = 0.2
            self.totalShootTimeInterval = 0.25

            self.view.image = Enemy.minerEnemyShieldLeftImage
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
        
        self.startDirection = self.direction
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        if self.type == "snake" {
            
            if self.direction == "right" {
                
                self.view.frame.origin.x = self.x - self.width / 2 + (Block.width * (5 / 16))
                self.view.frame.origin.y = self.y - self.height / 2
                
            } else if self.direction == "left" {
                
                self.view.frame.origin.x = self.x - self.width / 2 - (Block.width * (5 / 16))
                self.view.frame.origin.y = self.y - self.height / 2
            }
            
        } else if self.type == "miner" {
            
            if self.direction == "right" {
                
                self.view.frame.origin.x = self.x - self.width / 2 + (Block.width * (5 / 16))
                self.view.frame.origin.y = self.y - self.height / 2
                
            } else if self.direction == "left" {
                
                self.view.frame.origin.x = self.x - self.width / 2 + (Block.width * (5 / 16))
                self.view.frame.origin.y = self.y - self.height / 2
            }
            
        } else {
            
            self.view.frame.origin.x = self.x - self.width / 2 + self.xShift
            self.view.frame.origin.y = self.y - self.height / 2 + self.yShift
        }
        
        self.hitBox.frame.origin.x = self.x - self.width / 2
        self.hitBox.frame.origin.y = self.y - self.height / 2
    }
    
    func reset() {
        
        self.isResetting = true

        self.xSpeed = 0
        self.ySpeed = 0
        
        self.isRising = false
        self.isFalling = false
        
        self.isJumping = false
        
        self.isShooting = false
        
        self.isSignalling = false
        
        self.isMoving = false
        
        self.isHit = false
        
        self.view.isHidden = false
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
//        self.canMove = true
        
        self.isUsed = false
        
        self.isStunned = false
        
        self.direction = self.startDirection
        
        self.yRange = 0
        
        self.xGoal = 0
        
        self.didReachGoal1 = false
        self.didReachGoal2 = false
        
        self.shootCount = 0

        self.startY = 0
        
        self.moveCount = 0
        
        self.xShift = 0
        self.yShift = 0
        
        self.ySpeedChange = 0
        self.maxFallSpeed = 0

        self.endTimers()
       
        self.setup(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2), type: self.type)
        
        self.isResetting = false
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
            
            if self.view.isAnimating == false {
                
                if self.isStunned == true {
                    
                    self.view.image = Enemy.eyeClosedImage
                    
                } else {
                 
                    self.view.image = Enemy.eyeOpenImage
                }
            }
            
        } else if type == "snake" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.snakeLeftShootImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.snakeLeft2Image
                
            } else {
                
                self.view.image = Enemy.snakeLeft1Image
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "drop" {
            
            if self.didReachGoal1 == true && self.didReachGoal2 == false {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.dropDropImage
            }
            
        } else if type == "sprinkler" {
            
            if self.isShooting == false {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.sprinklerDownImage
            }
            
        } else if type == "turret" {
            
            if self.view.isAnimating == false {
                
                if self.isShooting == true {
                    
                    self.view.stopAnimating()
                    
                    self.view.image = Enemy.turretLeftOpenImage
                    
                } else {
                    
                    self.view.stopAnimating()
                    
                    self.view.image = Enemy.turretLeftClosedImage
                }
            }
            
        } else if type == "jumper" {
            
//            if self.isJumping == true || self.ySpeed != 0 {
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {

                self.view.image = Enemy.jumperEnemyLeftJumpImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.jumperEnemyLeft2Image
                
            } else {
                
                self.view.image = Enemy.jumperEnemyLeft1Image
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "miner" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.minerEnemyThrowLeftImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.minerEnemySignalLeftImage
                
            } else {
                
                self.view.image = Enemy.minerEnemyShieldLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
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
                
            } else if player.y < self.y {
                
                self.ySpeed = -self.moveSpeed
                
            } else {
                
                self.ySpeed = 0
            }
            
        } else if self.type == "hat" {
            
        } else if self.type == "penguin" {
            
            // distance from player spawn ?
            
            self.y = self.startY + (sin(self.moveCount / (Block.width * 1.5)) * (Block.height * 2))
        
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed

            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
            self.moveCount += 1
            
        } else if self.type == "head" {
            
//            if self.direction == "left" {
//
//                if self.didReachGoal1 == false {
//
//                    if self.x <= player.x + self.xGoal {
//
//                        self.didReachGoal1 = true
//
//                    } else {
//
//                        self.xSpeed = -self.moveSpeed
//                        self.ySpeed = 0
//                    }
//
//                } else {
//
//                    self.xSpeed = -self.moveSpeed * 3
//
//                }
//
//            } else if self.direction == "right" {
//
//                if self.didReachGoal1 == false {
//
//                    if self.x >= player.x - self.xGoal {
//
//                        self.didReachGoal1 = true
//
//                    } else {
//
//                        self.xSpeed = self.moveSpeed
//                        self.ySpeed = 0
//                    }
//
//                } else {
//
//
//
//                }
//            }
            
        } else if self.type == "foot" {
            
            self.ySpeed = 0
            
            if self.isStunned == true {
                
                self.xSpeed = 0

            } else {
            
                var isEmpty1: Bool = true
                var isEmpty2: Bool = true
                
                for block in currentStage!.blocks {

                    if block.isInLargeBounds() == true {
                        
                        if self.y + (self.height / 2) + Enemy.checkMargin < block.y + (Block.height / 2) && self.y + (self.height / 2) + Enemy.checkMargin > block.y - (Block.height / 2) && (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2)) {
                            
                            isEmpty1 = false
                        }
                        
                        if self.y + (self.height / 2) + Enemy.checkMargin < block.y + (Block.height / 2) && self.y + (self.height / 2) + Enemy.checkMargin > block.y - (Block.height / 2) && (self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) {
                            
                            isEmpty2 = false
                        }
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
                        
                        for block in currentStage!.blocks {

                            if block.type != "ladder" && block.type != "topLadder" {
                                
                                if block.isInLargeBounds() == true {
                                    
                                    if self.x + (self.width / 2) + (self.moveSpeed * 5) < block.x + (Block.width / 2) && self.x + (self.width / 2) + (self.moveSpeed * 5) + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (self.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                        
                                        self.direction = "left"
                                        
                                        setXY(x: block.x - (Block.width / 2) - (self.width / 2) - (self.moveSpeed * 5), y: self.y)
                                    }
                                }
                                
                            }
                        }
                        
                    } else if direction == "left" {
                        
                        for block in currentStage!.blocks {

                            if block.type != "ladder" && block.type != "topLadder" {
                                
                                if block.isInLargeBounds() == true {
                                    
                                    if self.x - (self.width / 2) - (self.moveSpeed * 5) < block.x + (Block.width / 2) && self.x - (self.width / 2) - (self.moveSpeed * 5) > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                        
                                        self.direction = "right"

                                        setXY(x: block.x + (Block.width / 2) + (self.width / 2) + (self.moveSpeed * 5), y: self.y)
                                    }
                                }
                                
                            }
                        }
                        
                    }
                }

                if abs((self.y + (self.height / 2)) - (player.y + (Player.height / 2))) <= self.yRange {
                    
                    self.xSpeed = moveSpeed * 5
                    
                } else {
                    
                    self.xSpeed = moveSpeed
                }
                
                if self.direction == "left" {
                    self.xSpeed = -self.xSpeed
                }
            }
            
        } else if self.type == "eye" {
            
            self.xSpeed = 0
            self.ySpeed = 0
            
            if self.isStunned == false {

                let offset: CGFloat = Block.width * (1 / 16) * 0.1
                let offset2: CGFloat = Block.width * (1 / 16) * 0.5

                for block in currentStage!.blocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if block.isInLargeBounds() == true {
                            
                            if direction == "right" {
                                
                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (self.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.handleEyeHitBlock()
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) + offset2, y: self.y)
                                }
                                
                            } else if direction == "left" {
                                
                                if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.handleEyeHitBlock()
                                    
                                    setXY(x: block.x + (Block.width / 2) + (self.width / 2) - offset2, y: self.y)
                                }
                                
                            } else if direction == "up" {
                                
                                if self.y - (self.height / 2) - self.moveSpeed < block.y + (Block.height / 2) && self.y - (self.height / 2) - self.moveSpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                    
                                    self.handleEyeHitBlock()
                                    
                                    setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2) - offset2)
                                }
                                
                            } else if direction == "down" {
                                
                                if self.y + (self.height / 2) + self.moveSpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.moveSpeed + offset > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (self.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                    
                                    self.handleEyeHitBlock()
                                    
                                    setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2) + offset2)
                                }
                            }

                        }
                        
                    }
                }
                
                if self.direction == "left" {
                    self.xSpeed = -self.moveSpeed
                } else if self.direction == "right" {
                    self.xSpeed = self.moveSpeed
                } else if self.direction == "up" {
                    self.ySpeed = -self.moveSpeed
                } else if self.direction == "down" {
                    self.ySpeed = self.moveSpeed
                }
            }
            
        } else if self.type == "snake" {
            
            if player.x > self.x {
                
                if self.direction == "left" {
                    
                    //                    setXY(x: self.x + ((Block.width * (5 / 16) * 2)), y: self.y)
                    setXY(x: self.x, y: self.y)
                    
                    self.direction = "right"
                }
                
            } else if player.x < self.x {
                
                if self.direction == "right" {
                    
                    //                    setXY(x: self.x - ((Block.width * (5 / 16) * 2)), y: self.y)
                    setXY(x: self.x, y: self.y)
                    
                    self.direction = "left"
                }
            }
            
        } else if self.type == "drop" {
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
                if self.didReachGoal1 == false {
                 
                    if self.x < player.x + self.xGoal {
                        self.didReachGoal1 = true
                    }
                    
                } else {
                    
                    if self.didReachGoal2 == false {
                        
                        if self.x < player.x {
                            
                            self.didReachGoal2 = true
                            
                            self.view.animationImages = Enemy.dropEmptyImages as! [UIImage]
                            
                            self.view.animationDuration = 0.85 * (1 / 3)
                            self.view.startAnimating()
                            
                            self.realShoot()
                        }
                    }
                    
                }
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
                
                if self.didReachGoal1 == false {
                    
                    if self.x > player.x - self.xGoal {
                        self.didReachGoal1 = true
                    }
                    
                } else {
                    
                    if self.didReachGoal2 == false {
                        
                        if self.x > player.x {
                            
                            self.didReachGoal2 = true
                            
                            self.view.animationImages = Enemy.dropEmptyImages as! [UIImage]
                            
                            self.view.animationDuration = 0.85 * (1 / 3)
                            self.view.startAnimating()
                            
                            self.realShoot()
                        }
                    }
                    
                }
            }
            
        } else if self.type == "sprinkler" {
            
            if player.x > self.x {
                
                self.direction = "right"
                
            } else if player.x < self.x {
                
                self.direction = "left"
            }
            
            if self.isSprinklerInRange() == true {
                
                self.startTimers()
            }
            
        } else if self.type == "turret" {
            
            if player.x > self.x {
                
                self.direction = "right"
                
            } else if player.x < self.x {
                
                self.direction = "left"
            }
            
        } else if self.type == "jumper" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
//                self.width = Block.width * (19 / 16)
//                self.height = Block.height * (10 / 16)
//
////                self.xShift = 0
//                self.xShift = -Block.width * (1 / 16)
//
//                self.yShift = 0
  
                self.width = Block.width * (24 / 16)
//                self.height = Block.height * (26 / 16)
                self.height = Block.height * (12 / 16)

                //                self.xShift = 0
                self.xShift = -Block.width * (1 / 16)
                self.yShift = 0

            } else {
                
                self.width = Block.width * (24 / 16)
                self.height = Block.height * (12 / 16)
                
                self.xShift = -Block.width * (1 / 16)
                self.yShift = -Block.height * (14 / 16)
            }
            
            
            
            if self.isJumping == true || self.isFalling == true {
                
                self.ySpeed += self.ySpeedChange
                
                if self.ySpeed > 0 {
                    
                    self.isFalling = true
                    
                    self.isRising = false
                    
                    if self.ySpeed > self.maxFallSpeed {
                        self.ySpeed = self.maxFallSpeed
                    }
                    
                } else if ySpeed < 0 {
                    
                    self.isRising = true
                    
                    self.isFalling = false
                }
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            //            if self.xSpeed != 0 {
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
//                        if self.direction == "right" {
                        
                            if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                
                                //                                    self.canMove = false
                                
                                setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                            }
                            
//                        } else if self.direction == "left" {
                        
                            if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                
                                //                                    self.canMove = false
                                
                                setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                            }
                            
//                        }
                    }
                    
                }
            }
            
            //            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if self.isRising == false {
                
                var isEmpty: Bool = true
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (self.height / 2) + self.ySpeed <= block.y - (Block.height / 2) + self.ySpeed && self.y + (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                isEmpty = false
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                isEmpty = false
                            }
                        }
                        
                    }
                }
                
//                for bullet in bullets {
//
//                    if bullet.type == "beam" {
//
//                        if self.y + (self.height / 2) + self.ySpeed < bullet.y + (bullet.height / 2) && self.y + (self.height / 2) + self.ySpeed > bullet.y - (bullet.height / 2) && ((self.x + (self.width / 2) <= bullet.x + (bullet.width / 2) && self.x + (self.width / 2) > bullet.x - (bullet.width / 2)) || (self.x - (self.width / 2) < bullet.x + (bullet.width / 2) && self.x - (self.width / 2) >= bullet.x - (bullet.width / 2))) {
//
//                            isEmpty = false
//                        }
//                    }
//
//                }
                
                if isEmpty == true {
                    
                    self.isFalling = true
                }
            }
            
            if self.isFalling == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (self.height / 2) + self.maxFallSpeed <= block.y - (Block.height / 2) + self.maxFallSpeed && self.y + (self.height / 2) + self.maxFallSpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isJumping = false
                                self.isFalling = false

                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                if self.signalTimer.isValid == false {
                                    
                                    self.signalTimer.invalidate()
                                    
                                    self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                if self.signalTimer.isValid == false {
                                    
                                    self.signalTimer.invalidate()
                                    
                                    self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
//                for bullet in bullets {
//
//                    if bullet.type == "beam" {
//
//                        if self.y + (self.height / 2) + self.ySpeed < bullet.y + (bullet.height / 2) && self.y + (self.height / 2) + self.ySpeed > bullet.y - (bullet.height / 2) && ((self.x + (self.width / 2) <= bullet.x + (bullet.width / 2) && self.x + (self.width / 2) > bullet.x - (bullet.width / 2)) || (self.x - (self.width / 2) < bullet.x + (bullet.width / 2) && self.x - (self.width / 2) >= bullet.x - (bullet.width / 2))) {
//
//                            self.isJumping = false
//                            self.isFalling = false
//
//                            self.ySpeed = 0
//
//                            setXY(x: self.x, y: bullet.y - (bullet.height / 2) - (self.height / 2))
//                        }
//                    }
//
//                }
                
            }
            
            
            
            
            
//            if self.isRising == true {
//
//                for block in selectedBlocks {
//
//                    if block.isHidden == false {
//
//                        if block.isLadder == false && block.isTopLadder == false {
//
//                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
//
//                                self.isFalling = true
//
//                                self.isJumping = false
//                                self.isRising = false
//
//                                self.xSpeed = 0
//                                self.ySpeed = 0
//
//                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
//                            }
//                        }
//
//                    }
//
//                }
//            }
            
            

            
            
////            if self.xSpeed != 0 {
//
//                for block in selectedBlocks {
//
//                    if block.isHidden == false {
//
//                        if block.isLadder == false && block.isTopLadder == false {
//
//                            if self.direction == "right" {
//
//                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
//
////                                    self.canMove = false
//
//                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
//                                }
//
//                            } else if self.direction == "left" {
//
//                                if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
//
////                                    self.canMove = false
//
//                                    setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
//                                }
//
//                            }
//                        }
//
//                    }
//                }
//
////            }
            
            
            
            
            
            
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }

            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if self.isJumping == false {
                
//                self.xSpeed = 0
//                self.ySpeed = 0
                
                if player.x >= self.x {
                    
                    self.direction = "right"
                    
                } else {
                    
                    self.direction = "left"
                }
                
            }
            
        } else if self.type == "miner" {
            
//            if player.x > self.x {
//
//                if self.direction == "left" {
//
//                    //                    setXY(x: self.x + ((Block.width * (5 / 16) * 2)), y: self.y)
//                    setXY(x: self.x, y: self.y)
//
//                    self.direction = "right"
//                }
//
//            } else if player.x < self.x {
//
//                if self.direction == "right" {
//
//                    //                    setXY(x: self.x - ((Block.width * (5 / 16) * 2)), y: self.y)
//                    setXY(x: self.x, y: self.y)
//
//                    self.direction = "left"
//                }
//            }
            
        }
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
    
    func isSprinklerInRange() -> Bool {
        
        if self.type == "sprinkler" {
            
            if player.x <= self.x + self.xGoal && player.x >= self.x - self.xGoal {
                
                return true
            }
            
        } else {
            
            return true
        }

        return false
    }
    
    func handleEyeHitBlock() {
        
        self.view.animationImages = Enemy.eyeImages as! [UIImage]
        
        self.view.animationRepeatCount = 1
        
        self.view.animationDuration = 0.1
        self.view.startAnimating()
        
        self.isStunned = true
        
        if self.direction == "left" {
            
            self.direction = "right"
            
        } else if self.direction == "right" {
            
            self.direction = "left"
            
        } else if self.direction == "up" {
            
            self.direction = "down"
            
        } else if self.direction == "down" {
            
            self.direction = "up"
        }
        
        self.endStunTimer.invalidate()
        
        self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
    }
    
    func isInBounds() -> Bool {
        
        if self.type == "foot" {
            
            if self.x + (self.width / 2) >= -(screenSize.height * (screenRatio)) && self.x - (self.width / 2) <= (screenSize.height * (screenRatio)) + (screenSize.height * (screenRatio)) {
                return true
            }
            
        } else {
         
            if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
                return true
            }
        }
        
        return false
    }
    
    func didHitBullet() -> Int {
        
        Enemy.bulletsToRemove.removeAll()
        
        for i in 0 ..< bullets.count {
            
            if bullets[i].type != "beam" {
                
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
                            
                        } else if bullets[i].type == "magnet" {
                            
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
                        
                    } else if self.type == "snake" {
                        
                        return i
                        
                    } else if self.type == "drop" {
                        
                        return i
                        
                    } else if self.type == "sprinkler" {
                        
                        return i
                        
                    } else if self.type == "turret" {
                        
                        return i
                        
                    } else if self.type == "jumper" {
                        
                        return i
                        
                    } else if self.type == "miner" {
                        
                        if bullets[i].type == "regular" {
                            
                            if self.isShooting == true || self.isSignalling == true {
                                
                                return i
                                
                            } else {
                                
                                if (bullets[i].xSpeed >= 0 && self.direction == "right") || (bullets[i].xSpeed <= 0 && self.direction == "left") {
                                    
                                    return i

                                } else {
                                    
                                    self.handleDeflectBullet(i: i)
                                }
                            }
                            
                        } else if bullets[i].type == "cutter" {
                            
                            return i
                            
                        } else if bullets[i].type == "blade" {
                            
                            return i
                            
                        } else if bullets[i].type == "magnet" {
                            
                            return i
                        }
                    }
                    
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

        self.view.isHidden = true

        if self.type == "foot" {
            
            self.isStunned = true
            
            self.endStunTimer.invalidate()
            
            self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)

        } else {
            
            self.health -= bulletDamage
        }
        
        self.endHitTimer.invalidate()
        
        self.endHitTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.hitTimeInterval), target: self, selector: #selector(stopHit), userInfo: nil, repeats: false)
    }
    
    @objc func stopHit() {
        
        self.isHit = false
        
        self.view.isHidden = false
    }
    
    func isDead() -> Bool {
        
        if self.health <= 0 {
            return true
        }
        
        return false
    }
    
    @objc func jump() {
        
        self.isSignalling = false
        
        self.isJumping = true
        self.isRising = true
        
        if self.direction == "right" {
            
            self.xSpeed = self.moveSpeed
            
        } else if self.direction == "left" {
            
            self.xSpeed = -self.moveSpeed
        }
        
        self.ySpeed = -self.maxFallSpeed
    }
    
    @objc func shoot() {
        
        if self.isShooting == false {
            
            self.isShooting = true
            
            self.isSignalling = false
            
            if self.type == "sprinkler" {
                
                self.view.animationImages = Enemy.sprinklerImages as! [UIImage]
                
                self.view.animationDuration = 0.85 * (1 / 3)
                self.view.startAnimating()
                
            } else if self.type == "turret" {
                
                self.view.animationImages = Enemy.turretLeftOpenImages as! [UIImage]
                
                self.view.animationRepeatCount = 1
                
                self.view.animationDuration = 0.15
                self.view.startAnimating()
            }
            
            //            self.isShootingAnimation = true
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
        }
    }
    
    @objc func signal() {
        
        if self.isSignalling == false {
            
            self.isSignalling = true
        }
        
        if self.type == "jumper" {
            
            if self.jumpTimer.isValid == false {
                
                self.jumpTimer.invalidate()
                
                self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
            }
        }
        
    }
    
    @objc func realShoot() {
        
        if self.type == "follower" {
            
        } else if self.type == "hat" {
            
            let bulletSpeed: CGFloat = 1.5

            let xOffset: CGFloat = Block.width * (12 / 16)
            let yOffset: CGFloat = Block.width * (3 / 16)

            if self.direction == "left" {

                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: -bulletSpeed, ySpeed: -bulletSpeed, type: "mediumRegular"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "mediumRegular"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: -bulletSpeed, ySpeed: bulletSpeed, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {

                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, xSpeed: bulletSpeed, ySpeed: -bulletSpeed, type: "mediumRegular"))
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "mediumRegular"))
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, xSpeed: bulletSpeed, ySpeed: bulletSpeed, type: "mediumRegular"))

                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "penguin" {
            
        } else if self.type == "head" {
            
        } else if self.type == "foot" {
            
        } else if self.type == "eye" {
            
        } else if self.type == "snake" {
            
            let bulletSpeed: CGFloat = 2.5
            
            let xOffset: CGFloat = Block.width * (14 / 16)
            let yOffset: CGFloat = Block.width * (4 / 16)
            
            if self.direction == "left" {
                
                //                enemyBullets.append(EnemyBullet(x: self.x - (Block.width * (4 / 16)), y: self.y + (Block.height * (2 / 16)), target: "player", type: "mediumRegular"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, target: "player", speed: bulletSpeed, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, target: "player", speed: bulletSpeed, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "drop" {
         
            let bulletSpeed: CGFloat = 2

            let yOffset: CGFloat = Block.width * (0 / 16)
            
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y + yOffset, xSpeed: 0, ySpeed: bulletSpeed, type: "dropHead"))
            
        } else if self.type == "sprinkler" {
            
            let bulletSpeedMax: CGFloat = 3.25
            let bulletSpeedMin: CGFloat = bulletSpeedMax / (sqrt(2))

            let yOffset: CGFloat = Block.width * (4 / 16)
            
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y - yOffset, xSpeed: -bulletSpeedMin, ySpeed: -bulletSpeedMin, type: "smallOrange"))
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y - yOffset, xSpeed: -bulletSpeedMax, ySpeed: 0, type: "smallOrange"))
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y - yOffset, xSpeed: 0, ySpeed: -bulletSpeedMax, type: "smallOrange"))
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y - yOffset, xSpeed: bulletSpeedMin, ySpeed: -bulletSpeedMin, type: "smallOrange"))
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y - yOffset, xSpeed: bulletSpeedMax, ySpeed: 0, type: "smallOrange"))
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "turret" {
            
            let bulletSpeed: CGFloat = 3.25
            
            let yOffset: CGFloat = Block.width * (0 / 16)

            var xOffset: CGFloat = Block.width * (8 / 16)
            
            var goalX: CGFloat = 0
            var goalY: CGFloat = 0
            
            if self.shootCount == 0 {
                
                goalX = 3
                goalY = -2.5
                
            } else if self.shootCount == 1 {
                
                goalX = 5
                goalY = -1
                
            } else if self.shootCount == 2 {
                
                goalX = 5
                goalY = 1
                
            } else {
                
                goalX = 3
                goalY = 2.5
            }
            
            if self.direction == "left" {
                
                goalX = -goalX
                xOffset = -xOffset
            }

            enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, targetX: goalX, targetY: goalY, speed: bulletSpeed, type: "smallBlue"))
            
            if self.shootCount >= 3 {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
                self.shootCount = 0
                
            } else {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.betweenShotsTimeInterval), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
                
                self.shootCount += 1
            }
            
        } else if self.type == "miner" {
            
            let bulletXSpeed: CGFloat = 1
            let bulletYSpeed: CGFloat = -4

            let xOffset: CGFloat = -Block.width * (4 / 16)
            let yOffset: CGFloat = -Block.width * (12 / 16)
            
            if self.direction == "left" {
                
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: -bulletXSpeed, ySpeed: bulletYSpeed, type: "axe"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, xSpeed: bulletXSpeed, ySpeed: bulletYSpeed, type: "axe"))

                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
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
        
        self.shootCount = 0
        
        if self.type == "turret" {
            
            self.view.animationImages = Enemy.turretLeftCloseImages as! [UIImage]
            
            self.view.animationRepeatCount = 1
            
            self.view.animationDuration = 0.15
            self.view.startAnimating()
        }
        
        self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval - self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
    }
    
    @objc func stopStun() {
        
        self.isStunned = false
        
        if self.type == "foot" {
         
            self.view.animationImages = Enemy.footImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            self.view.startAnimating()
            
        } else if self.type == "eye" {
            
            self.view.animationImages = Enemy.eyeImages as! [UIImage]
            
            self.view.animationRepeatCount = 1
            
            self.view.animationDuration = 0.1
            self.view.startAnimating()
        }
    }
    
    func startTimers() {
        
        if self.isSprinklerInRange() == true {
            
            if self.shootTimeInterval > 0 {
                
                if self.shootTimer.isValid == false && self.endShootTimer.isValid == false && self.signalTimer.isValid == false {
                    
                    self.shootTimer.invalidate()
                    
                    self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                    
                    self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval - self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                }
            }
            
        }
        
        if self.type == "eye" {
            
            if self.endStunTimer.isValid == false {
                
                self.endStunTimer.invalidate()
                
                self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
            }
            
        }
        
        if self.type == "jumper" {
            
//            if self.jumpTimer.isValid == false {
//
//                self.jumpTimer.invalidate()
//
//                self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
//            }
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
        }
        
    }
    
    func endTimers() {
        self.shootTimer.invalidate()
        self.endShootTimer.invalidate()
        self.signalTimer.invalidate()
        self.endStunTimer.invalidate()
        self.endHitTimer.invalidate()
    }
}
