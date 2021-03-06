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
    
    static let maxHealth: Int = 32
    static let maxEnergy: Int = 32
    
    static let width: CGFloat = Block.width * 0.75
    static let height: CGFloat = Block.height * 1.5
    
    static var maxFallSpeed: CGFloat = 4
    
    static var maxMoveSpeed: CGFloat = 1
    
    static var climbSpeed: CGFloat = 0.75
    
    static var knockBackMoveSpeed: CGFloat = 0.425
    
    static var ySpeedChange: CGFloat = 0.105
    
    static let color: UIColor = UIColor.clear
    
    static let hitBoxColor: UIColor = UIColor.red.withAlphaComponent(0.5)
    
    static let knockedBackRightImages = [UIImage(named: "playerKnockedBackRight1"), UIImage(named: "playerKnockedBackRight2"), UIImage(named: "playerKnockedBackRight1"), UIImage(named: "playerKnockedBackRight2"), UIImage(named: "playerKnockedBackRight1"), UIImage(named: "playerKnockedBackRight2")]
    
    static let runRightImages = [UIImage(named: "playerRunRight1"), UIImage(named: "playerRunRight2"), UIImage(named: "playerRunRight3"), UIImage(named: "playerRunRight2")]
    static let runShootRightImages = [UIImage(named: "playerRunShootRight1"), UIImage(named: "playerRunShootRight2"), UIImage(named: "playerRunShootRight3"), UIImage(named: "playerRunShootRight2")]
    static let runThrowRightImages = [UIImage(named: "playerRunThrowRight1"), UIImage(named: "playerRunThrowRight2"), UIImage(named: "playerRunThrowRight3"), UIImage(named: "playerRunThrowRight2")]
    
    static let jumpRightImage = UIImage(named: "playerJumpRight")
    static let jumpShootRightImage = UIImage(named: "playerJumpShootRight")
    static let jumpThrowRightImage = UIImage(named: "playerJumpThrowRight")
    
    static let standRightImage = UIImage(named: "playerStandRight")
    static let standShootRightImage = UIImage(named: "playerStandShootRight")
    static let standThrowRightImage = UIImage(named: "playerStandThrowRight")
    
    static let climbImage = UIImage(named: "playerClimb1")
    static let climbImages = [UIImage(named: "playerClimb1"), UIImage(named: "playerClimb2")]
    
    static let climbShootRightImage = UIImage(named: "playerClimbShootRight")
    static let climbThrowRightImage = UIImage(named: "playerClimbThrowRight")
    
    static let climbEndImage = UIImage(named: "playerClimbEnd")
    
    static let xShift: CGFloat = Block.width * (16 / 30)
    static let yShift: CGFloat = Block.height * 0

    static let xShiftBullet: CGFloat = Block.width * (11 / 16)
    static let yShiftBullet: CGFloat = -Block.height * (1 / 16)
    
    static let animationCycleTime: Double = 0.55
    
    static let hitTime: CGFloat = 2
    
    static let knockBackTime: CGFloat = 0.475
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var isRising: Bool = false
    var isFalling: Bool = false
    
    var isJumping: Bool = false
    
    var isShooting: Bool = false
    var isShootingAnimation: Bool = false
    
    var isMoving: Bool = false
    
    var isHit: Bool = false
    
    var isKnockedBack: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false
    
    var isMovingUp: Bool = false
    var isMovingDown: Bool = false
    
    var isAtPeak: Bool = false
    
    var isClimbing: Bool = false
    
    var canMove: Bool = true
    
    var isDead: Bool = false
    
    var health: Int = 0
    
    var energyPos: Int = -1
    
    var energies: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]

    var energyCosts: [Int] = [1, 2, 2, 3, 3, 3, 4, 5]
    
    var direction: String = "right"
    
    var beforeYSpeed: CGFloat = 0
    
    var power: String = "regular"

    var powers = ["cutter", "blade", "beam", "magnet", "shield", "bubble", "tornado", "bomb"]

    var endShootTimer = Timer()
    var endShootAnimationTimer = Timer()
    
    var endHitTimer = Timer()
    var hitAnimationTimer = Timer()
    
    var endKnockBackTimer = Timer()
    
    var timerFireTimes = [String : CGFloat]()
    
    var healthBar: EnergyBar = EnergyBar(type: "health")
    var energyBar: EnergyBar = EnergyBar(type: "energy")
    
    var view: UIImageView = UIImageView()
    var hitBox: UIView = UIView()
    
    init() {
        
        self.health = Player.maxHealth
        
        for i in 0 ..< self.energies.count {
            self.energies[i] = Player.maxEnergy
        }
        
        setXY(x: self.x, y: self.y)
        
        self.view.frame.size.width = Block.width * (31 / 16)
        self.view.frame.size.height = Block.height * (31 / 16)
        
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
        
        if self.isClimbing == true && self.isShootingAnimation == false {
            
            self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift
            
        } else {
            
            if self.direction == "left" {
                
                self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift - (Block.width * (1 / 16))
                
            } else if self.direction == "right" {
                
                self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift
            }
        }
        
        self.view.frame.origin.y = self.y - Player.height / 2 - Player.yShift
        
        self.hitBox.frame.origin.x = self.x - Player.width / 2
        self.hitBox.frame.origin.y = self.y - Player.height / 2
    }
    
    func reset() {
        
        self.setXY(x: currentStage!.playerStartX, y: currentStage!.playerStartY)
        
        self.endTimers()
        
        self.isFalling = true
        
        self.xSpeed = 0
        self.ySpeed = 0
        
        self.isRising = false
        
        self.isJumping = false
        
        self.isShooting = false
        self.isShootingAnimation = false
        
        self.isMoving = false
        
//        self.isHit = false
        
        self.endHit()
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
        self.isMovingUp = false
        self.isMovingDown = false
        
        self.isAtPeak = false
        
        self.canMove = true
        
        self.isDead = false
        
        self.health = Player.maxHealth
        
        for i in 0 ..< self.energies.count {
            self.energies[i] = Player.maxEnergy
        }
        
        self.direction = "right"
        
        self.power = "regular"
        
        self.energyPos = -1
        
        self.healthBar.setEnergy(energy: self.health)
        
        self.energyBar.updateImages(power: self.power)
        
        if self.energyPos >= 0 {
            self.energyBar.setEnergy(energy: self.energies[self.energyPos])
        }
    }
    
    static func updateSpeeds() {

        Player.maxMoveSpeed = newVal(oldVal: Player.maxMoveSpeed)
        Player.climbSpeed = newVal(oldVal: Player.climbSpeed)
        Player.knockBackMoveSpeed = newVal(oldVal: Player.knockBackMoveSpeed)
//        Player.ySpeedChange = newVal(oldVal: Player.ySpeedChange)
    }
    
    func move(direction: String) {
        
        if direction == "left" {
            
            self.direction = direction
            
            if self.isKnockedBack == true {
                self.xSpeed = -Player.knockBackMoveSpeed
            } else {
                self.xSpeed = -Player.maxMoveSpeed
            }
            
            if isTransitioningRight == true {
                
                if let upcomingStage = nextStage {
                    
                    if upcomingStage.boss == "" {
                        
                        setXY(x: self.x + (self.xSpeed * (((screenSize.height * screenRatio) - Player.width) / (screenSize.height * screenRatio))), y: self.y)
                        
                    } else {
                        
                        setXY(x: self.x + (self.xSpeed * (((screenSize.height * screenRatio) - Player.width - Block.width) / (screenSize.height * screenRatio))), y: self.y)
                    }
                    
                } else {
                    
                    setXY(x: self.x + (self.xSpeed * (((screenSize.height * screenRatio) - Player.width) / (screenSize.height * screenRatio))), y: self.y)
                }
                
            } else {
                
                setXY(x: self.x + self.xSpeed, y: self.y)
            }
            
        } else if direction == "right" {
            
            self.direction = direction
            
            if self.isKnockedBack == true {
                self.xSpeed = Player.knockBackMoveSpeed
            } else {
                self.xSpeed = Player.maxMoveSpeed
            }
            
            setXY(x: self.x + self.xSpeed, y: self.y)
            
        } else if direction == "up" {
            
            if self.isKnockedBack == true {
                self.ySpeed = -Player.knockBackMoveSpeed
            } else {
                self.ySpeed = -Player.maxMoveSpeed
            }
            
            setXY(x: self.x, y: self.y + (self.ySpeed * ((screenSize.height - Player.height) / screenSize.height)))
            
        } else if direction == "down" {
            
            if self.isKnockedBack == true {
                self.ySpeed = Player.knockBackMoveSpeed
            } else {
                self.ySpeed = Player.maxMoveSpeed
            }
            
            setXY(x: self.x, y: self.y + (self.ySpeed * ((screenSize.height - Player.height) / screenSize.height)))
        }
    }
    
    func move() {
        
        self.xSpeed = 0
        
        if self.ySpeed != 0 {
            self.isAtPeak = false
        }
        
        if isTransitioningRight == false && isTransitioningUp == false && isTransitioningDown == false {
            
            if self.isClimbing == true {
                
                self.isJumping = false
                self.isFalling = false
                self.isRising = false
                
                self.setXY(x: self.x, y: self.y + ySpeed)
                
            } else if self.isJumping == true || self.isFalling == true {
                
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
            
        }
        
        if self.isMoving == true && self.isRising == false {
            
            var isEmpty: Bool = true
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isTopLadder == true {
                        
                        if self.y + (Player.height / 2) + self.ySpeed <= block.y - (Block.height / 2) + self.ySpeed && self.y + (Player.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                            
                            isEmpty = false
                        }
                        
                    } else if block.isLadder == false {
                        
                        if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                            
                            isEmpty = false
                        }
                    }
                    
                }
            }
            
            for bullet in bullets {
                
                if bullet.type == "beam" {
                    
                    if self.y + (Player.height / 2) + self.ySpeed < bullet.y + (bullet.height / 2) && self.y + (Player.height / 2) + self.ySpeed > bullet.y - (bullet.height / 2) && ((self.x + (Player.width / 2) <= bullet.x + (bullet.width / 2) && self.x + (Player.width / 2) > bullet.x - (bullet.width / 2)) || (self.x - (Player.width / 2) < bullet.x + (bullet.width / 2) && self.x - (Player.width / 2) >= bullet.x - (bullet.width / 2))) {
                        
                        isEmpty = false
                    }
                }
                
            }
            
            if isEmpty == true {
                
                self.isFalling = true
            }
        }
        
        if isTransitioningRight == false && isTransitioningUp == false && isTransitioningDown == false {
            
            if self.isFalling == true || self.isClimbing == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (Player.height / 2) + Player.maxFallSpeed <= block.y - (Block.height / 2) + Player.maxFallSpeed && self.y + (Player.height / 2) + Player.maxFallSpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                                
                                if self.view.isAnimating == false && (self.view.image == Player.jumpRightImage || self.view.image == Player.jumpShootRightImage || self.view.image == Player.jumpThrowRightImage) {
                                    
                                    playSound(name: "land")
                                }
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                self.isAtPeak = false
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (Player.height / 2))
                                
                                if self.isClimbing == true {
                                    
                                    self.isClimbing = false
                                }
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                                
                                if self.view.isAnimating == false && (self.view.image == Player.jumpRightImage || self.view.image == Player.jumpShootRightImage || self.view.image == Player.jumpThrowRightImage) {
                                    
                                    playSound(name: "land")
                                }
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                self.isAtPeak = false
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (Player.height / 2))
                                
                                if self.isClimbing == true {
                                    
                                    self.isClimbing = false
                                }
                                
                            }
                        }
                        
                    }
                }
                
                for bullet in bullets {
                    
                    if bullet.type == "beam" {
                        
                        if self.y + (Player.height / 2) + self.ySpeed < bullet.y + (bullet.height / 2) && self.y + (Player.height / 2) + self.ySpeed > bullet.y - (bullet.height / 2) && ((self.x + (Player.width / 2) <= bullet.x + (bullet.width / 2) && self.x + (Player.width / 2) > bullet.x - (bullet.width / 2)) || (self.x - (Player.width / 2) < bullet.x + (bullet.width / 2) && self.x - (Player.width / 2) >= bullet.x - (bullet.width / 2))) {
 
                            self.isJumping = false
                            self.isFalling = false
                            
                            self.ySpeed = 0
                            
                            self.isAtPeak = false
                            
                            setXY(x: self.x, y: bullet.y - (bullet.height / 2) - (Player.height / 2))
                            
                            if self.isClimbing == true {
                                
                                self.isClimbing = false
                            }
                            
                        }
                    }
                    
                }
                
            }
        }
        
        if self.isRising == true {
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.y - (Player.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                            
                            self.isFalling = true
                            
                            self.isJumping = false
                            self.isRising = false
                            
                            self.ySpeed = 0
                            
                            self.isAtPeak = true
                            
                            setXY(x: self.x, y: block.y + (Block.height / 2) + (Player.height / 2))
                        }
                    }
                    
                }
                
            }
        }
        
        if self.isClimbing == true && self.ySpeed < 0 {
            
            for block in selectedBlocks {
                
                if block.isLadder == false && block.isTopLadder == false {
                    
                    if self.y - (Player.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                        
                        self.ySpeed = 0
                        
                        setXY(x: self.x, y: block.y + (Block.height / 2) + (Player.height / 2))
                    }
                }
                
            }
        }
        
        if self.isMovingUp == true {
            
            if self.y - (Player.height / 2) <= 0 {
                
                if isTransitioningUp == false {
                    
                    if self.isClimbing == true {
                        
                        if currentLevel?.isNextStage(direction: "up") != nil && (((CGFloat)((currentStage?.numberOfHorizontalBlocks)!) <= (CGFloat)(numberOfVerticalBricks) * screenRatio) || abs(player.x - ((screenSize.height * screenRatio) / 2)) > Player.maxMoveSpeed) {
                            
                            nextStage = currentLevel?.isNextStage(direction: "up")
                            
                            nextStage!.setupAsNextStage(direction: "up")
                            
                            isTransitioningUp = true
                            
                            self.beforeYSpeed = self.ySpeed
                        }
                    }
                    
                } else {
                    
                    setXY(x: self.x, y: (Player.width / 2) + Player.maxFallSpeed)
                }
                
            } else {
                
                if isTransitioningUp == true {
                    
                    if self.y + (Player.height / 2) >= screenSize.height {
                        
                        setXY(x: self.x, y: screenSize.height - (Player.width / 2) - 10)
                    }
                    
                    if currentStage!.y >= screenSize.height {
                        
                        isTransitioningUp = false
                        
                        currentStage = nextStage
                        
                        nextStage = nil
                        
                        currentLevel!.updateCurrentStagePos()
                        currentStage!.setupSelectedArrays()
                        
                        self.ySpeed = self.beforeYSpeed
                    }
                }
                
            }
            
        } else if self.isMovingDown == true {
            
            if self.y + (Player.height / 2) >= screenSize.height {
                
                if isTransitioningDown == false {
                    
                    if currentLevel?.isNextStage(direction: "down") != nil && (((CGFloat)((currentStage?.numberOfHorizontalBlocks)!) <= (CGFloat)(numberOfVerticalBricks) * screenRatio) || abs(player.x - ((screenSize.height * screenRatio) / 2)) > Player.maxMoveSpeed) {
                        
                        nextStage = currentLevel?.isNextStage(direction: "down")
                        
                        nextStage!.setupAsNextStage(direction: "down")
                        
                        isTransitioningDown = true
                        
                        self.beforeYSpeed = self.ySpeed
                        
                    } else {
                        
                        if self.y >= screenSize.height {
                            
                            self.isDead = true
                        }
                    }
                    
                } else {
                    
                    setXY(x: self.x, y: screenSize.height - (Player.width / 2) - Player.maxFallSpeed)
                }
                
            } else {
                
                if isTransitioningDown == true {
                    
                    if self.y - (Player.height / 2) <= 0 {
                        
                        setXY(x: self.x, y: (Player.width / 2) + 10)
                    }
                    
                    if currentStage!.y <= -screenSize.height {
                        
                        isTransitioningDown = false
                        
                        currentStage = nextStage
                        
                        nextStage = nil
                        
                        currentLevel!.updateCurrentStagePos()
                        currentStage!.setupSelectedArrays()
                        
                        self.ySpeed = self.beforeYSpeed
                    }
                }
                
            }
        }
        
        if self.isMoving == true {
            
            self.canMove = true
            
            if self.isMovingRight == true {
                
                if self.x + (Player.width / 2) >= screenSize.height * screenRatio {
                    
                    if isTransitioningRight == false {
                        
                        if currentLevel?.isNextStage(direction: "right") != nil {
                            
                            nextStage = currentLevel?.isNextStage(direction: "right")
                            
                            nextStage!.setupAsNextStage(direction: "right")
                            
                            isTransitioningRight = true
                            
                            self.beforeYSpeed = self.ySpeed
                            self.ySpeed = 0
                        }
                    }
                    
                    self.canMove = false
                    
                    setXY(x: (screenSize.height * screenRatio) - (Player.width / 2) - self.xSpeed, y: self.y)
                    
                } else {
                    
                    if isTransitioningRight == true {
                        
                        if nextStage!.boss == "" {
                            
                            if self.x - (Player.width / 2) <= 0 {
                                
                                self.canMove = false
                                
                                setXY(x: (Player.width / 2) + self.xSpeed, y: self.y)
                            }
                            
                        } else {
                            
                            if self.x - (Player.width / 2) <= Block.width {
                                
                                self.canMove = false
                                
                                setXY(x: (Player.width / 2) + self.xSpeed + Block.width, y: self.y)
                            }
                        }
                        
                        if currentStage!.x <= -((CGFloat)(currentStage!.numberOfHorizontalBlocks) * Block.width)  {
                            
                            isTransitioningRight = false
                            
                            currentStage = nextStage
                            
                            nextStage = nil
                            
                            currentLevel!.updateCurrentStagePos()
                            currentStage!.setupSelectedArrays()
                            
                            self.ySpeed = self.beforeYSpeed
                            
                            if currentStage!.boss != "" {
                                
                                currentStage!.addBlockWall()
                                
                                Enemy.bossHealthBar.updateImages(power: currentStage!.boss)
                                Enemy.bossHealthBar.setEnergy(energy: Enemy.maxBossHealth)
                            }
                            
                        }
                    }
                    
                }
                
            } else if self.isMovingLeft == true {
                
                if self.x - (Player.width / 2) <= 0 {
                    
                    self.canMove = false
                    
                    setXY(x: (Player.width / 2) + self.xSpeed, y: self.y)
                }
            }
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.isMovingRight == true {
                            
                            if self.isKnockedBack == true {
                                
                                if self.x + (Player.width / 2) + Player.knockBackMoveSpeed < block.x + (Block.width / 2) && self.x + (Player.width / 2) + Player.knockBackMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.canMove = false
                                    
                                    setXY(x: block.x - (Block.width / 2) - (Player.width / 2) - Player.knockBackMoveSpeed, y: self.y)
                                }
                                
                            } else {
                                
                                if self.x + (Player.width / 2) + Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x + (Player.width / 2) + Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.canMove = false
                                    
                                    setXY(x: block.x - (Block.width / 2) - (Player.width / 2) - Player.maxMoveSpeed, y: self.y)
                                }
                            }
                            
                        } else if self.isMovingLeft == true {
                            
                            if self.isKnockedBack == true {
                                
                                if self.x - (Player.width / 2) - Player.knockBackMoveSpeed < block.x + (Block.width / 2) && self.x - (Player.width / 2) - Player.knockBackMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.canMove = false
                                    
                                    setXY(x: block.x + (Block.width / 2) + (Player.width / 2), y: self.y)
                                }
                                
                            } else {
                                
                                if self.x - (Player.width / 2) - Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x - (Player.width / 2) - Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    self.canMove = false
                                    
                                    setXY(x: block.x + (Block.width / 2) + (Player.width / 2), y: self.y)
                                }
                            }
                            
                        }
                    }
                    
                }
            }
            
        }
    }
    
    func jump() {
        
        if self.isClimbing == true {
            
            self.isFalling = true
            
            self.isClimbing = false
            
            self.ySpeed = 0
            
        } else {
            
            self.isJumping = true
            self.isRising = true
            
            self.ySpeed = -Player.maxFallSpeed
        }
    }
    
    func shoot() {
        
        var canShootBullet: Bool = false
        
        if self.power == "regular" {
            
            if bullets.count < 3 {
                canShootBullet = true
            }
            
        } else if self.power == "cutter" {
            
            if bullets.count < 3 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "blade" {
            
            if bullets.count < 1 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "beam" {
            
            if self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "magnet" {
            
            if bullets.count < 1 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "shield" {
            
            if self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "tornado" {
            
            if bullets.count < 1 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "bubble" {
            
            if bullets.count < 2 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
            
        } else if self.power == "bomb" {
            
            if bullets.count < 1 && self.energies[self.energyPos] >= self.energyCosts[self.energyPos]  {
                
                canShootBullet = true
            }
        }
        
        if canShootBullet == true {
            
            canMoveLeft = true
            canMoveRight = true
            
            if self.isShooting == false {
                
                if self.isClimbing == false || (self.isClimbing == true && self.ySpeed == 0) {
                    
                    if self.energyPos >= 0 {
                        
                        self.energies[self.energyPos] -= self.energyCosts[self.energyPos]
                        
                        self.energyBar.setEnergy(energy: self.energies[self.energyPos])
                    }
                    
                    self.isShooting = true
                    self.isShootingAnimation = true
                    
                    self.endShootTimer.invalidate()
                    self.endShootAnimationTimer.invalidate()
                    
                    self.isShooting = false
                    
                    self.endShootAnimationTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(stopShootAnimation), userInfo: nil, repeats: false)
                    
                    var yOffset: CGFloat = 0
                    
                    if self.isClimbing == true {
                        
                        yOffset = -Block.height * (1 / 16)
                        
                    } else if self.view.isAnimating == true {
                        
                        yOffset = Block.height * (1 / 16)
                    }
                    
                    if self.power == "regular" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "shoot")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "shoot")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "cutter" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "blade" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: "upLeft", type: self.power))
                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: "downLeft", type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: "upRight", type: self.power))
                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: "downRight", type: self.power))
                        }
                        
                    } else if self.power == "beam" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "shoot")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "shoot")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "magnet" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "shield" {
                        
                        if bullets.count <= 0 {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x, y: self.y, direction: self.direction, type: self.power))
                            
                        } else {
                            
                            var canRemoveBullet: Bool = false
                            
                            for bullet in bullets {
                                
                                if bullet.didReachGoal == false {
                                    
                                    canRemoveBullet = true
                                    
                                    bullet.useEnergyTimer.invalidate()
                                }
                            }
                            
                            if canRemoveBullet == true {
                                
                                bullets.removeAll()
                            }
                        }
                        
                    } else if self.power == "tornado" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 0.6, direction: self.direction, type: self.power))
                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 1, direction: self.direction, type: self.power))
                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 1.4, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 0.6, direction: self.direction, type: self.power))
                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 1, direction: self.direction, type: self.power))
                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet, y: self.y - Player.yShiftBullet + yOffset, moveSpeed: 1.4, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "bubble" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet - (Block.width * (4 / 16)), y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet + (Block.width * (4 / 16)), y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                        
                    } else if self.power == "bomb" {
                        
                        if self.direction == "left" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x - (Player.width / 2) - Player.xShiftBullet - (Block.width * (4 / 16)), y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                            
                        } else if self.direction == "right" {
                            
                            playSound(name: "throw")

                            bullets.append(Bullet(x: self.x + (Player.width / 2) + Player.xShiftBullet + (Block.width * (4 / 16)), y: self.y - Player.yShiftBullet + yOffset, direction: self.direction, type: self.power))
                        }
                    }
                    
                }
            }
            
        }
    }
    
    @objc func stopShoot() {
        self.isShooting = false
    }
    
    @objc func stopShootAnimation() {
        
        canMoveLeft = true
        canMoveRight = true
        
        self.isShootingAnimation = false
    }
    
    func updateAnimation() {
        
        if isTransitioningRight == false && isTransitioningUp == false && isTransitioningDown == false {
            
            if self.ySpeed == 0 {
                self.isRising = false
            }
            
            if self.isClimbing == false || self.ySpeed == 0 {
                canClimb = true
            }
            
            if self.isKnockedBack == true {
                
                if canBeKnockedBack == true {
                    
                    canBeKnockedBack = false
                    
                    if direction == "left" {
                        
                        self.handleKnockedBackAnimation()
                        
                        self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                        
                    } else if direction == "right" {
                        
                        self.handleKnockedBackAnimation()
                        
                        self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                    }
                }
                
            } else if isClimbing == true {
                
                if self.ySpeed == 0 {
                    
                    self.handleStopClimbAnimation()
                    
                } else {
                    
                    if canClimb == true {
                        
                        canClimb = false
                        
                        handleClimbAnimation()
                    }
                }
                
            } else if self.ySpeed != 0 {
                
                if direction == "left" {
                    
                    self.handleJumpAnimation()
                    
                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                    
                } else if direction == "right" {
                    
                    self.handleJumpAnimation()
                    
                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                
            } else if isMoving == true {
                
                if self.didHandleJumpAnimation() == false {
                    
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
                    
                }
                
            } else if isMoving == false && ySpeed == 0 && isJumping == false && self.isFalling == false && self.isRising == false {
                
                if self.didHandleJumpAnimation() == false {
                    
                    if direction == "left" {
                        
                        self.handleStandAnimation()
                        
                        self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                        
                    } else if direction == "right" {
                        
                        self.handleStandAnimation()
                        
                        self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                }
                
            }
            
            setXY(x: self.x, y: self.y)
        }
    }
    
    func didHandleJumpAnimation() -> Bool {
        
        if self.isAtPeak == true {
            
            if direction == "left" {
                
                self.handleJumpAnimation()
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
                self.handleJumpAnimation()
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            return true
        }
        
        return false
    }
    
    func handleKnockedBackAnimation() {
        
        self.view.stopAnimating()
        
        self.view.animationImages = Player.knockedBackRightImages as! [UIImage]
        
        self.view.animationDuration = (Double)(Player.knockBackTime)
        self.view.startAnimating()
        
        explosions.append(Explosion(x: self.x - (Player.width / 2) - (Block.width * (4 / 16)), y: self.y - (Player.height / 2) - (Block.height * (2 / 16)), type: "smoke"))
        explosions.append(Explosion(x: self.x, y: self.y - (Player.height / 2) - (Block.height * (8 / 16)), type: "smoke"))
        explosions.append(Explosion(x: self.x + (Player.width / 2) + (Block.width * (4 / 16)), y: self.y - (Player.height / 2) - (Block.height * (2 / 16)), type: "smoke"))
    }
    
    func handleStopClimbAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShootingAnimation == true {
            
            if self.power == "regular" || self.power == "beam" {
                self.view.image = Player.climbShootRightImage
            } else {
                self.view.image = Player.climbThrowRightImage
            }
            
            if direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else {
            
            self.view.image = Player.climbImage
            
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func handleClimbAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        self.view.animationImages = Player.climbImages as! [UIImage]
        
        self.view.animationDuration = Player.animationCycleTime * 0.75
        self.view.startAnimating()
        
        self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    
    func handleJumpAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShootingAnimation == true {
            
            if self.power == "regular" || self.power == "beam" {
                self.view.image = Player.jumpShootRightImage
            } else {
                self.view.image = Player.jumpThrowRightImage
            }
            
        } else {
            
            self.view.image = Player.jumpRightImage
        }
    }
    
    func handleRunAnimation() {
        
        self.view.stopAnimating()
        
        if self.isShootingAnimation == true {
            
            if self.power == "regular" || self.power == "beam" {
                self.view.animationImages = Player.runShootRightImages as! [UIImage]
            } else {
                self.view.animationImages = Player.runThrowRightImages as! [UIImage]
            }
            
            self.view.animationDuration = Player.animationCycleTime
            self.view.startAnimating()
            
        } else {
            
            self.view.animationImages = Player.runRightImages as! [UIImage]
            
            self.view.animationDuration = Player.animationCycleTime
            self.view.startAnimating()
        }
    }
    
    func handleStandAnimation() {
        
        self.view.stopAnimating()
        
        canMoveLeft = true
        canMoveRight = true
        
        if self.isShootingAnimation == true {
            
            if self.power == "regular" || self.power == "beam" {
                self.view.image = Player.standShootRightImage
            } else {
                self.view.image = Player.standThrowRightImage
            }
            
        } else {
            
            self.view.image = Player.standRightImage
        }
    }
    
    func handlePowerup(type: String) {
        
        if type == "largeHealth" {
            
            playSound(name: "health")

            self.health += 3
            
        } else if type == "smallHealth" {
            
            playSound(name: "health")

            self.health += 1
            
        } else if type == "largeEnergy" {
            
            playSound(name: "energy")

            if self.energyPos >= 0 {
                self.energies[self.energyPos] += 3
            }
            
        } else if type == "smallEnergy" {
            
            playSound(name: "energy")

            if self.energyPos >= 0 {
                self.energies[self.energyPos] += 1
            }
            
        }  else if type == "extraLife" {
            
            lives += 1
        }
        
        if self.health > Player.maxHealth {
            self.health = Player.maxHealth
        }
        
        if self.energyPos >= 0 {
            
            if self.energies[self.energyPos] > Player.maxEnergy {
                
                self.energies[self.energyPos] = Player.maxEnergy
            }
        }
        
        self.healthBar.setEnergy(energy: self.health)
        
        if self.energyPos >= 0 {
            self.energyBar.setEnergy(energy: self.energies[self.energyPos])
        }
    }
    
    func didHitPowerup() -> Int {
        
        for i in 0 ..< powerups.count {
            
            if powerups[i].x + (powerups[i].width / 2) >= self.x - (Player.width / 2) && powerups[i].x - (powerups[i].width / 2) <= self.x + (Player.width / 2) && powerups[i].y + (powerups[i].height / 2) >= self.y - (Player.height / 2) && powerups[i].y - (powerups[i].height / 2) <= self.y + (Player.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func didHitLadder() -> Block? {
        
        for block in selectedBlocks {
            
            if block.isLadder == true || block.isTopLadder == true {
                
                if block.x + (Block.width / 2) >= self.x && block.x - (Block.width / 2) <= self.x && block.y + (Block.height / 2) >= self.y - (Player.height / 2) && block.y - (Block.height / 2) <= self.y + (Player.height / 2) {
                    return block
                }
                
            }
        }
        
        return nil
    }
    
    func numberOfLaddersTouching() -> Int {
        
        var count: Int = 0
        
        for block in selectedBlocks {
            
            if block.isLadder == true || block.isTopLadder == true {
                
                if block.x + (Block.width / 2) >= self.x && block.x - (Block.width / 2) <= self.x && block.y + (Block.height / 2) >= self.y - (Player.height / 2) && block.y - (Block.height / 2) <= self.y + (Player.height / 2) {
                    
                    count += 1
                }
                
            }
        }
        
        return count
    }
    
    func isTouchingTopLadder() -> Block? {
        
        for block in selectedBlocks {
            
            if block.isTopLadder == true {
                
                if block.x + (Block.width / 2) >= self.x && block.x - (Block.width / 2) <= self.x && block.y + (Block.height / 2) >= self.y - (Player.height / 2) && block.y - (Block.height / 2) <= self.y + (Player.height / 2) {
                    return block
                }
                
            }
        }
        
        return nil
    }
    
    func didHitSelectedPowerup() -> Int {
        
        for i in 0 ..< selectedPowerups.count {
            
            if selectedPowerups[i].x + (selectedPowerups[i].width / 2) >= self.x - (Player.width / 2) && selectedPowerups[i].x - (selectedPowerups[i].width / 2) <= self.x + (Player.width / 2) && selectedPowerups[i].y + (selectedPowerups[i].height / 2) >= self.y - (Player.height / 2) && selectedPowerups[i].y - (selectedPowerups[i].height / 2) <= self.y + (Player.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func didHitSelectedEnemy() -> Int {
        
        for i in 0 ..< selectedEnemies.count {
            
            if selectedEnemies[i].isHidden == false {
                
                if selectedEnemies[i].x + (selectedEnemies[i].hitBox.frame.size.width / 2) >= self.x - (Player.width / 2) && selectedEnemies[i].x - (selectedEnemies[i].hitBox.frame.size.width / 2) <= self.x + (Player.width / 2) && selectedEnemies[i].y + (selectedEnemies[i].hitBox.frame.size.height / 2) >= self.y - (Player.height / 2) && selectedEnemies[i].y - (selectedEnemies[i].hitBox.frame.size.height / 2) <= self.y + (Player.height / 2) {
                    return i
                }
            }
            
        }
        
        return -1
    }
    
    func didHitEnemy() -> Int {
        
        for i in 0 ..< currentStage!.specialEnemies.count {
            
            if currentStage!.specialEnemies[i].isHidden == false {
                
                if currentStage!.specialEnemies[i].x + (currentStage!.specialEnemies[i].hitBox.frame.size.width / 2) >= self.x - (Player.width / 2) && currentStage!.specialEnemies[i].x - (currentStage!.specialEnemies[i].hitBox.frame.size.width / 2) <= self.x + (Player.width / 2) && currentStage!.specialEnemies[i].y + (currentStage!.specialEnemies[i].hitBox.frame.size.height / 2) >= self.y - (Player.height / 2) && currentStage!.specialEnemies[i].y - (currentStage!.specialEnemies[i].hitBox.frame.size.height / 2) <= self.y + (Player.height / 2) {
                    return i
                }
            }
            
        }
        
        return -1
    }
    
    func didHitEnemyBullet() -> Int {
        
        for i in 0 ..< enemyBullets.count {
            
            if enemyBullets[i].x + (enemyBullets[i].width / 2) >= self.x - (Player.width / 2) && enemyBullets[i].x - (enemyBullets[i].width / 2) <= self.x + (Player.width / 2) && enemyBullets[i].y + (enemyBullets[i].height / 2) >= self.y - (Player.height / 2) && enemyBullets[i].y - (enemyBullets[i].height / 2) <= self.y + (Player.height / 2) {
                return i
            }
        }
        
        return -1
    }
    
    func didHitOwnBullet() -> Int {
        
        for i in 0 ..< bullets.count {
            
            if bullets[i].type == "cutter" &&  bullets[i].didReachGoal == true {
                
                if bullets[i].x + (bullets[i].width / 2) >= self.x - (Player.width / 2) && bullets[i].x - (bullets[i].width / 2) <= self.x + (bullets[i].width / 2) && bullets[i].y + (bullets[i].height / 2) >= self.y - (Player.height / 2) && bullets[i].y - (bullets[i].height / 2) <= self.y + (Player.height / 2) {
                    return i
                }
                
            }
        }
        
        return -1
    }
    
    func stopJump() {
        
        self.isAtPeak = true
        self.isFalling = true
        
        self.isJumping = false
        self.isRising = false
        
        self.ySpeed = 0
    }
    
    func handleHit(damage: Int, enemyDirection: String) {
        
        if self.isClimbing == true {
            
            self.ySpeed = 0
            
            self.isClimbing = false
            self.isFalling = true
        }
        
        self.isHit = true
        
        self.health -= damage
        
        if self.health <= 0 {
            
            self.health = 0
            
            self.isDead = true
        }
        
        self.healthBar.setEnergy(energy: self.health)
        
        self.endHitTimer.invalidate()
        self.hitAnimationTimer.invalidate()
        
        self.endHitTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Player.hitTime), target: self, selector: #selector(endHit), userInfo: nil, repeats: false)
        self.hitAnimationTimer = Timer.scheduledTimer(timeInterval: Player.animationCycleTime * 0.075, target: self, selector: #selector(handleHitAnimation), userInfo: nil, repeats: true)
        
        self.handleKnockBack(enemyDirection: enemyDirection)
    }
    
    func isGameOver() -> Bool {
        
        return self.isDead
    }
    
    func handleKnockBack(enemyDirection: String) {
        
        self.isJumping = true
        self.isRising = true
        
        self.ySpeed = -Player.maxFallSpeed * 0.125
        
        self.isKnockedBack = true
        
        self.isMoving = true
        
        if enemyDirection == "right" {
            
            direction = "right"
            
            self.isMovingRight = true
            
            self.isMovingLeft = false
            
        } else if enemyDirection == "left" {
            
            direction = "left"
            
            self.isMovingLeft = true
            
            self.isMovingRight = false
        }
        
        self.endKnockBackTimer.invalidate()
        
        self.endKnockBackTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Player.knockBackTime), target: self, selector: #selector(endKnockBack), userInfo: nil, repeats: false)
    }
    
    @objc func endKnockBack() {
        
        canMoveLeft = true
        canMoveRight = true
        
        canBeKnockedBack = true
        
        self.isKnockedBack = false
        
        self.isMoving = false
        
        self.isMovingLeft = false
        self.isMovingRight = false
        
        if direction == "left" {
            
            direction = "right"
            
        } else if direction == "right" {
            
            direction = "left"
        }
    }
    
    @objc func endHit() {
        
        self.hitAnimationTimer.invalidate()
        
        self.view.isHidden = false
        
        self.isHit = false
    }
    
    @objc func handleHitAnimation() {
        
        if self.isKnockedBack == true {
            
            if self.view.isHidden == true {
                
                playSound(name: "hit")
            }
        }
        
        self.view.isHidden = !self.view.isHidden
        
        if self.hitAnimationTimer.timeInterval != TimeInterval(Player.animationCycleTime * 0.075) {
            
            self.hitAnimationTimer.invalidate()
            
            self.hitAnimationTimer = Timer.scheduledTimer(timeInterval: Player.animationCycleTime * 0.075, target: self, selector: #selector(handleHitAnimation), userInfo: nil, repeats: true)
        }
    }
    
    func cycleWeapon(isNext: Bool) {
        
        bullets.removeAll()
        
        if isNext == true {
            
            if self.energyPos < energyCosts.count - 1 {
                
                var shouldRepeat: Bool = true
                
                repeat {
                    
                    self.energyPos += 1
                    
                    if self.energyPos >= energyCosts.count {
                        
                        self.energyPos = -1
                    }
                    
                    shouldRepeat = true
                    
                    if self.energyPos == -1 {
                        
                        shouldRepeat = false
                        
                    } else if completedLevels[self.energyPos] == true {
                        
                        shouldRepeat = false
                    }
                    
                } while (shouldRepeat)
                
                if self.energyPos >= 0 {
                    
                    self.power = self.powers[self.energyPos]
                    
                    self.energyBar.updateImages(power: self.power)
                    self.energyBar.setEnergy(energy: self.energies[self.energyPos])
                    
                } else {
                    
                    self.energyPos = -1
                    
                    self.power = "regular"
                    
                    self.energyBar.updateImages(power: self.power)
                }
                
            } else {
                
                self.energyPos = -1
                
                self.power = "regular"
                
                self.energyBar.updateImages(power: self.power)
            }

        } else {
            
            if self.energyPos > 0 {
                
                var shouldRepeat: Bool = true
                
                repeat {
                    
                    self.energyPos -= 1
                    
                    if self.energyPos < 0 {
                        
                        self.energyPos = -1
                    }
                    
                    shouldRepeat = true
                    
                    if self.energyPos == -1 {
                        
                        shouldRepeat = false
                        
                    } else if completedLevels[self.energyPos] == true {
                        
                        shouldRepeat = false
                    }
                    
                } while (shouldRepeat)
                
                if self.energyPos >= 0 {
                    
                    self.power = self.powers[self.energyPos]
                    
                    self.energyBar.updateImages(power: self.power)
                    self.energyBar.setEnergy(energy: self.energies[self.energyPos])
                    
                } else {
                    
                    self.energyPos = -1
                    
                    self.power = "regular"
                    
                    self.energyBar.updateImages(power: self.power)
                }
                
            } else if self.energyPos >= 0 {
                
                self.energyPos = -1
                
                self.power = "regular"
                
                self.energyBar.updateImages(power: self.power)
                
            } else {
                
                self.energyPos = self.powers.count
                
                var shouldRepeat: Bool = true
                
                repeat {
                    
                    self.energyPos -= 1
                    
                    if self.energyPos < 0 {
                        
                        self.energyPos = -1
                    }
                    
                    shouldRepeat = true
                    
                    if self.energyPos == -1 {
                        
                        shouldRepeat = false
                        
                    } else if completedLevels[self.energyPos] == true {
                        
                        shouldRepeat = false
                    }
                    
                } while (shouldRepeat)
                
                if self.energyPos >= 0 {
                    
                    self.power = self.powers[self.energyPos]
                    
                    self.energyBar.updateImages(power: self.power)
                    self.energyBar.setEnergy(energy: self.energies[self.energyPos])
                    
                } else {
                    
                    self.energyPos = -1
                    
                    self.power = "regular"
                    
                    self.energyBar.updateImages(power: self.power)
                }
                
            }
        }
        
    }
    
    func handlePause() {
        
        self.timerFireTimes["endShootAnimationTimer"] = getTimerFireTime(timer: self.endShootAnimationTimer)
        self.timerFireTimes["endHitTimer"] = getTimerFireTime(timer: self.endHitTimer)
        self.timerFireTimes["hitAnimationTimer"] = getTimerFireTime(timer: self.hitAnimationTimer)
        self.timerFireTimes["endKnockBackTimer"] = getTimerFireTime(timer: self.endKnockBackTimer)
        
        self.endTimers()
    }
    
    func endTimers() {
        
        self.endShootAnimationTimer.invalidate()
        self.endHitTimer.invalidate()
        self.hitAnimationTimer.invalidate()
        self.endKnockBackTimer.invalidate()
    }
    
    func handleResume() {
        
        if let fireTime = self.timerFireTimes["endShootAnimationTimer"] {
            
            if fireTime >= 0 {
                
                self.endShootAnimationTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(stopShootAnimation), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["endHitTimer"] {
            
            if fireTime >= 0 {
                
                self.endHitTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(endHit), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["hitAnimationTimer"] {
            
            if fireTime >= 0 {
                
                self.hitAnimationTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(handleHitAnimation), userInfo: nil, repeats: true)
            }
        }
        
        if let fireTime = self.timerFireTimes["endKnockBackTimer"] {
            
            if fireTime >= 0 {
                
                self.endKnockBackTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(endKnockBack), userInfo: nil, repeats: false)
            }
        }
        
    }
}
