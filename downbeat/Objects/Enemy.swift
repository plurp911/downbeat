//
//  Enemy.swift
//  downbeat
//
//  Created by Collin Howard on 11/19/18.
//  Copyright ? 2018 Collin Howard. All rights reserved.
//

import UIKit

class Enemy {
    
    // CONSTANTS
    
    static let maxBossHealth: Int = 32
    
    static let color: UIColor = UIColor.clear
    //        static let color: UIColor = UIColor.green
    
    static let hitBoxColor: UIColor = UIColor.red.withAlphaComponent(0.5)
    
    //    static let followerImages = [UIImage(named: "followerEnemy1"), UIImage(named: "followerEnemy2"), UIImage(named: "followerEnemy3"), UIImage(named: "followerEnemy4"), UIImage(named: "followerEnemy5"), UIImage(named: "followerEnemy6")]
    //    static let followerImages = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6")]
    static let followerImages = [UIImage(named: "followerEnemy1"), UIImage(named: "followerEnemy2")]
    
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
    
    static let footLeftImage = UIImage(named: "footEnemyLeft1")
    static let footLeftImages = [UIImage(named: "footEnemyLeft1"), UIImage(named: "footEnemyLeft2"), UIImage(named: "footEnemyLeft3"), UIImage(named: "footEnemyLeft4"), UIImage(named: "footEnemyLeft5"), UIImage(named: "footEnemyLeft6")]
    
    static let snakeLeftImages = [UIImage(named: "snakeEnemyLeft1"), UIImage(named: "snakeEnemyLeft2"), UIImage(named: "snakeEnemyLeft3"), UIImage(named: "snakeEnemyLeft4")]
    //    static let snakeShootLeftImages = [UIImage(named: "snakeEnemyShootLeft1"), UIImage(named: "snakeEnemyShootLeft2")]
    static let snakeShootLeftImage = UIImage(named: "snakeEnemyShootLeft")
    
    static let shellShootRightImage = UIImage(named: "shellEnemyRightShoot")
    static let shellSignalRightImage = UIImage(named: "shellEnemyRightSignal")
    static let shellClosedRightImage = UIImage(named: "shellEnemyRightClosed")
    static let shellSignalRightImages = [shellSignalRightImage]
    
    //    static let dropImages = [UIImage(named: "dropEnemy1"), UIImage(named: "dropEnemy2")]
    //    static let dropEmptyImages = [UIImage(named: "dropEnemyEmpty1"), UIImage(named: "dropEnemyEmpty2")]
    //    static let dropDropImage = UIImage(named: "dropEnemyDrop")
    static let dropImages = [UIImage(named: "dropEnemy1Other"), UIImage(named: "dropEnemy2Other")]
    static let dropEmptyImages = [UIImage(named: "dropEnemyEmpty1Other"), UIImage(named: "dropEnemyEmpty2Other")]
    static let dropDropImage = UIImage(named: "dropEnemyDropOther")
    
    //    static let sprinklerImages = [UIImage(named: "sprinklerEnemy1"), UIImage(named: "sprinklerEnemy2"), UIImage(named: "sprinklerEnemy3")]
    static let sprinklerImages = [UIImage(named: "sprinklerEnemy1"), UIImage(named: "sprinklerEnemy2"), UIImage(named: "sprinklerEnemy3"), UIImage(named: "sprinklerEnemy4")]
    static let sprinklerDownImage = UIImage(named: "sprinklerEnemyDown")
    
    static let turretLeftOpenImages = [UIImage(named: "turretEnemyLeft1"), UIImage(named: "turretEnemyLeft2")]
    static let turretLeftCloseImages = [UIImage(named: "turretEnemyLeft2"), UIImage(named: "turretEnemyLeft1")]
    static let turretLeftClosedImage = UIImage(named: "turretEnemyClosedLeft")
    static let turretLeftOpenImage = UIImage(named: "turretEnemyOpenLeft")
    
    // static let jumperLeft1Image = UIImage(named: "jumperEnemyLeft1")
    // static let jumperLeft2Image = UIImage(named: "jumperEnemyLeft2")
    //    static let jumperLeftJumpImage = UIImage(named: "jumperLeftJump")
    // static let jumperJumpLeftImages = [UIImage(named: "jumperEnemyJumpLeft1"), UIImage(named: "jumperEnemyJumpLeft2"), UIImage(named: "jumperEnemyJumpLeft3")]
    
    // static let jumperLeftImage = UIImage(named: "jumperEnemyLeft")
    // static let jumperJumpLeftImages = [UIImage(named: "jumperEnemyJumpLeft1"), UIImage(named: "jumperEnemyJumpLeft2"), UIImage(named: "jumperEnemyJumpLeft3"), UIImage(named: "jumperEnemyJumpLeft4")]
    
    static let jumperImages = [UIImage(named: "jumperEnemy1"), UIImage(named: "jumperEnemy2")]
    
    static let minerThrowLeftImage = UIImage(named: "minerEnemyThrowLeft")
    static let minerSignalLeftImage = UIImage(named: "minerEnemySignalLeft")
    static let minerShieldLeftImage = UIImage(named: "minerEnemyShieldLeft")
    
    static let electricityImages = [UIImage(named: "electricityEnemyRight1"), UIImage(named: "electricityEnemyRight2")]
    
    static let topMakerShootRightImage = UIImage(named: "topMakerEnemyShootRight")
    static let topMakerRightImages = [UIImage(named: "topMakerEnemyRight1"), UIImage(named: "topMakerEnemyRight2")]
    
    static let eggMakerShootLeftImage = UIImage(named: "eggMakerEnemyShootLeft")
    static let eggMakerLeftImages = [UIImage(named: "eggMakerEnemyLeft1"), UIImage(named: "eggMakerEnemyLeft2")]
    
    //    static let topImages = [UIImage(named: "topEnemy1"), UIImage(named: "topEnemy2"), UIImage(named: "topEnemy3")]
    static let topImages = [UIImage(named: "topEnemy1"), UIImage(named: "topEnemy2"), UIImage(named: "topEnemy3"), UIImage(named: "topEnemy4"), UIImage(named: "topEnemy5"), UIImage(named: "topEnemy6"), UIImage(named: "topEnemy7"), UIImage(named: "topEnemy8")]
    
    static let eggLeftImages = [UIImage(named: "eggEnemyLeft1"), UIImage(named: "eggEnemyLeft2"), UIImage(named: "eggEnemyLeft3"), UIImage(named: "eggEnemyLeft2")]
    
    static let shooterShootRightImage = UIImage(named: "shooterEnemyShootRight")
    static let shooterShieldRightImage = UIImage(named: "shooterEnemyShieldRight")
    
    // static let scooperLeftImages = [UIImage(named: "scooperEnemyLeft1"), UIImage(named: "scooperEnemyLeft2")]
    static let scooperLeftImages = [UIImage(named: "scooperEnemyLeft1"), UIImage(named: "scooperEnemyLeft2"), UIImage(named: "scooperEnemyLeft3"), UIImage(named: "scooperEnemyLeft4")]
    
    static let brickBossStandLeftImage = UIImage(named: "brickBossStandLeft")
    static let brickBossThrowLeftImage = UIImage(named: "brickBossThrowLeft")
    //    static let brickBossSignalThrowLeft1Image = UIImage(named: "brickBossSignalThrowLeft1")
    //    static let brickBossSignalThrowLeft2Image = UIImage(named: "brickBossSignalThrowLeft2")
    static let brickBossJumpLeftImage = UIImage(named: "brickBossJumpLeft")
    static let brickBossSignalJumpLeftImage = UIImage(named: "brickBossSignalJumpLeft")
    
    static let fireBossStandLeftImage = UIImage(named: "fireBossStandLeft")
    static let fireBossThrowLeftImage = UIImage(named: "fireBossThrowLeft")
    static let fireBossJumpLeftImage = UIImage(named: "fireBossJumpLeft")
    static let fireBossSignalJumpLeftImage = UIImage(named: "fireBossSignalJumpLeft")
    static let fireBossRunLeftImages = [UIImage(named: "fireBossRunLeft1"), UIImage(named: "fireBossRunLeft2"), UIImage(named: "fireBossRunLeft3"), UIImage(named: "fireBossRunLeft2")]
    
    static let metalBossStandLeftImage = UIImage(named: "metalBossStandLeft")
    static let metalBossThrowLeftImage = UIImage(named: "metalBossThrowLeft")
    static let metalBossJumpLeftImage = UIImage(named: "metalBossJumpLeft")
    static let metalBossSignalJumpLeftImage = UIImage(named: "metalBossSignalJumpLeft")
    
    static let iceBossStandLeftImage = UIImage(named: "iceBossStandLeft")
    static let iceBossThrowLeftImage = UIImage(named: "iceBossThrowLeft")
    static let iceBossJumpLeftImage = UIImage(named: "iceBossJumpLeft")
    static let iceBossSignalJumpLeftImage = UIImage(named: "iceBossSignalJumpLeft")
    
    static let skyBossStandLeftImage = UIImage(named: "skyBossStandLeft")
    static let skyBossThrowLeftImage = UIImage(named: "skyBossThrowLeft")
    static let skyBossJumpLeftImage = UIImage(named: "skyBossJumpLeft")
    static let skyBossSignalJumpLeftImage = UIImage(named: "skyBossSignalJumpLeft")
    static let skyBossRunLeftImages = [UIImage(named: "skyBossRunLeft1"), UIImage(named: "skyBossRunLeft2")]
    
    static let snowBossStandLeftImage = UIImage(named: "snowBossStandLeft")
    static let snowBossJumpLeftImage = UIImage(named: "snowBossJumpLeft")
    static let snowBossSignalJumpLeftImage = UIImage(named: "snowBossSignalJumpLeft")
    
    static let waterBossStandLeftImage = UIImage(named: "waterBossStandLeft")
    static let waterBossThrowLeftImage = UIImage(named: "waterBossThrowLeft")
    static let waterBossJumpLeftImage = UIImage(named: "waterBossJumpLeft")
    static let waterBossSignalJumpLeftImage = UIImage(named: "waterBossSignalJumpLeft")
    static let waterBossRunLeftImages = [UIImage(named: "waterBossRunLeft1"), UIImage(named: "waterBossRunLeft2")]
    
    static let sandBossStandLeftImage = UIImage(named: "sandBossStandLeft")
    static let sandBossThrowLeftImage = UIImage(named: "sandBossThrowLeft")
    static let sandBossSignalJumpLeftImage = UIImage(named: "sandBossSignalJumpLeft")
    static let sandBossRunLeftImages = [UIImage(named: "sandBossRunLeft1"), UIImage(named: "sandBossRunLeft2"), UIImage(named: "sandBossRunLeft3"), UIImage(named: "sandBossRunLeft2")]
    
    static let chemicalBossStandLeftImage = UIImage(named: "brickBossStandLeft")
    static let chemicalBossThrowLeftImage = UIImage(named: "brickBossThrowLeft")
    static let chemicalBossJumpLeftImage = UIImage(named: "brickBossJumpLeft")
    static let chemicalBossSignalJumpLeftImage = UIImage(named: "brickBossSignalJumpLeft")
    
    static let chemicalBossSignalImage = UIImage(named: "chemicalBossSignal")
    static let chemicalBossThrowImage = UIImage(named: "chemicalBossThrow")
    static let chemicalBossImages = [UIImage(named: "chemicalBoss1"), UIImage(named: "chemicalBoss2"), UIImage(named: "chemicalBoss3")]
    
    static let checkMargin: CGFloat = Block.width * (1 / 16)
    
    static let hitTimeInterval: CGFloat = 0.05
    
    //    static let bossStartTimeInterval: CGFloat = 1
    //    static let bossStartTimeInterval: CGFloat = 0.25
    static let bossStartTimeInterval: CGFloat = 0.5
    
    static var bulletsToRemove = [Int]()
    
    static var bossHealthBar: EnergyBar = EnergyBar(type: "bossHealth")
    
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
    
    var isSignalling: Bool = false
    
    var isMoving: Bool = false
    
    var isHit: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false
    
    var shouldShoot: Bool = false
    //    var shouldRun: Bool = false
    var shouldRun: Bool = true
    
    var health: Int = 0
    
    var direction: String = ""
    var startDirection: String = ""
    
    var type: String = ""
    
    var shootTimer = Timer()
    var endShootTimer = Timer()
    
    var signalTimer = Timer()
    
    var endStunTimer = Timer()
    
    var endHitTimer = Timer()
    
    var jumpTimer = Timer()
    
    var timerFireTimes = [String : CGFloat]()
    
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
    
    var jumpCount: Int = 0
    
    var canRun: Bool = false
    
    var isHidden: Bool = false
    
    var hitBoxXOffset: CGFloat = 0
    var hitBoxYOffset: CGFloat = 0
    
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
    
    init(x: CGFloat, y: CGFloat, type: String, direction: String) {
        
        self.direction = direction
        
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
            
            //            self.width = Block.width * (26 / 16)
            //            self.height = Block.height * (23 / 16)
            
            self.width = Block.width * (16 / 16)
            self.height = Block.height * (32 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "shell" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.width = Block.width * (24 / 16)
            self.height = Block.height * (20 / 16)
            
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
            
            //            self.xGoal = Block.width * 5
            self.xGoal = Block.width * 6
            
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
            
            // self.width = Block.width * (24 / 16)
            // self.height = Block.height * (12 / 16)
            
            self.width = Block.width * (16 / 16)
            self.height = Block.height * (16 / 16)
            
            self.moveSpeed = 1
            
        } else if self.type == "brickBoss" {
            
            self.maxHealth = 30
            
            //            self.damage = 3
            self.damage = 5
            
            //            self.ySpeedChange = 0.135
            //            self.maxFallSpeed = 5
            
            self.ySpeedChange = 0.12
            self.maxFallSpeed = 5.5
            
            //            self.width = Block.width * (31 / 16)
            //            self.height = Block.height * (32 / 16)
            self.width = Block.width * (29 / 16)
            self.height = Block.height * (28 / 16)
            
            self.moveSpeed = 1.25
            
        } else if self.type == "chemicalBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            // self.ySpeedChange = 0.12
            // self.maxFallSpeed = 5.5
            
            self.width = Block.width * (48 / 16)
            self.height = Block.height * (32 / 16)
            
            self.moveSpeed = 1.5
            
        } else if self.type == "fireBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            self.ySpeedChange = 0.1
            self.maxFallSpeed = 6
            
            self.width = Block.width * (30 / 16)
            self.height = Block.height * (24 / 16)
            
            self.moveSpeed = 1.25
            
        } else if self.type == "metalBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            //            self.ySpeedChange = 0.12
            //            self.maxFallSpeed = 5.5
            self.ySpeedChange = 0.1
            self.maxFallSpeed = 6
            
            //            self.width = Block.width * (31 / 16)
            //            self.height = Block.height * (32 / 16)
            
            self.width = Block.width * (37 / 16)
            self.height = Block.height * (35 / 16)
            
            //            self.moveSpeed = 1.25
            self.moveSpeed = 2.3125
            
        } else if self.type == "iceBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            self.ySpeedChange = 0.07
            self.maxFallSpeed = 5
            
            self.width = Block.width * (31 / 16)
            self.height = Block.height * (37 / 16)
            
            self.moveSpeed = 0.625
            
        } else if self.type == "skyBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            //            self.ySpeedChange = 0.3
            //            self.maxFallSpeed = 7
            
            self.ySpeedChange = 0.1
            self.maxFallSpeed = 4.5
            
            self.width = Block.width * (28 / 16)
            self.height = Block.height * (27 / 16)
            
            self.moveSpeed = 1.75
            
        } else if self.type == "snowBoss" {
            
            self.maxHealth = 30
            
            //            self.damage = 3
            self.damage = 5
            
            //            self.ySpeedChange = 0.12
            //            self.maxFallSpeed = 5.5
            
            self.ySpeedChange = 0.35
            self.maxFallSpeed = 6.125
            
            self.width = Block.width * (32 / 16)
            self.height = Block.height * (29 / 16)
            
            self.moveSpeed = 1.5
            
        } else if self.type == "waterBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            //            self.ySpeedChange = 0.12
            //            self.maxFallSpeed = 5.5
            
            self.ySpeedChange = 0.125
            self.maxFallSpeed = 6
            
            self.width = Block.width * (32 / 16)
            self.height = Block.height * (31 / 16)
            
            //            self.moveSpeed = 1.25
            self.moveSpeed = 2.25
            
        } else if self.type == "sandBoss" {
            
            self.maxHealth = 30
            
            self.damage = 5
            
            //            self.ySpeedChange = 0.125
            //            self.maxFallSpeed = 6
            
            self.width = Block.width * (34 / 16)
            self.height = Block.height * (30 / 16)
            
            
            //            self.moveSpeed = 1.25
            //            self.moveSpeed = 1
            self.moveSpeed = 1.15
            
        } else if self.type == "miner" {
            
            self.maxHealth = 3
            
            self.damage = 5
            
            self.width = Block.width * (31 / 16)
            self.height = Block.height * (24 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "electricity" {
            
            self.maxHealth = 1
            
            self.damage = 5
            
            self.width = Block.width * (64 / 16)
            self.height = Block.height * (14 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "topMaker" {
            
            self.maxHealth = 5
            
            self.damage = 5
            
            self.width = Block.width * (32 / 16)
            self.height = self.width
            
            self.moveSpeed = 0
            
        } else if self.type == "eggMaker" {
            
            self.maxHealth = 5
            
            self.damage = 5
            
            self.width = Block.width * (32 / 16)
            self.height = Block.height * (40 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "top" {
            
            self.maxHealth = 1
            
            self.damage = 3
            
            self.ySpeedChange = 0.15
            self.maxFallSpeed = 4
            
            self.isFalling = true
            
            //            self.width = Block.width * (15 / 16)
            //            self.height = Block.height
            self.width = Block.width
            self.height = Block.height * (15 / 16)
            
            self.moveSpeed = 0.875
            
        } else if self.type == "egg" {
            
            self.maxHealth = 1
            
            self.damage = 1
            
            self.ySpeedChange = 0.5
            self.maxFallSpeed = 5
            
            self.isFalling = true
            
            self.width = Block.width
            self.height = Block.height * (14 / 16)
            
            self.moveSpeed = 0.375
            
        } else if self.type == "shooter" {
            
            self.maxHealth = 3
            
            self.damage = 3
            
            self.width = Block.width * (22 / 16)
            self.height = Block.height * (24 / 16)
            
            self.moveSpeed = 0
            
        } else if self.type == "scooper" {
            
            self.maxHealth = 5
            
            self.damage = 3
            
            self.ySpeedChange = 0.3
            
            self.maxFallSpeed = 4
            
            //self.width = Block.width * (40 / 16)
            //self.height = Block.height * (64 / 16)
            
            self.width = Block.width * (24 / 16)
            self.height = Block.height * (26 / 16)
            
            self.moveSpeed = 0.375
            
            //            self.xGoal = Block.width * 4
            //            self.xGoal = Block.width * 6
            
            self.xGoal = Block.width * 2
        }
        
        self.hitBox.backgroundColor = Enemy.hitBoxColor
        
        if self.type == "snowBoss" {
            
            self.hitBoxXOffset = Block.width * (0 / 16)
            self.hitBoxYOffset = Block.height * (0 / 16)
            
            self.hitBox.frame.size.width = Block.width * (14 / 16)
            self.hitBox.frame.size.height = Block.height * (29 / 16)
            
        } else if self.type == "waterBoss" {
            
            self.hitBoxXOffset = Block.width * (0 / 16)
            self.hitBoxYOffset = Block.height * (2.5 / 16)
            
            self.hitBox.frame.size.width = Block.width * (24 / 16)
            self.hitBox.frame.size.height = Block.height * (26 / 16)
            
        } else if self.type == "skyBoss" {
            
            self.hitBoxXOffset = Block.width * (1 / 16)
            self.hitBoxYOffset = Block.height * (2.5 / 16)
            
            self.hitBox.frame.size.width = Block.width * (22 / 16)
            self.hitBox.frame.size.height = Block.height * (23 / 16)
            
        } else if self.type == "iceBoss" {
            
            self.hitBoxXOffset = Block.width * (3.5 / 16)
            self.hitBoxYOffset = Block.height * (3 / 16)
            
            self.hitBox.frame.size.width = Block.width * (24 / 16)
            self.hitBox.frame.size.height = Block.height * (31 / 16)
            
        } else if self.type == "brickBoss" {
            
            self.hitBoxXOffset = Block.width * (0 / 16)
            self.hitBoxYOffset = Block.height * (2 / 16)
            
            self.hitBox.frame.size.width = Block.width * (25 / 16)
            self.hitBox.frame.size.height = Block.height * (24 / 16)
            
        } else if self.type == "chemicalBoss" {
            
            self.hitBoxXOffset = Block.width * (0 / 16)
            self.hitBoxYOffset = Block.height * (0 / 16)
            
            self.hitBox.frame.size.width = Block.width * (48 / 16)
            self.hitBox.frame.size.height = Block.height * (32 / 16)
            
        } else if self.type == "fireBoss" {
            
            //            self.hitBoxXOffset = Block.width * (1 / 16)
            self.hitBoxXOffset = -Block.width * (1 / 16)
            self.hitBoxYOffset = Block.height * (0.5 / 16)
            
            //            self.hitBox.frame.size.width = Block.width * (22 / 16)
            self.hitBox.frame.size.width = Block.width * (18 / 16)
            self.hitBox.frame.size.height = Block.height * (23 / 16)
            
        } else if self.type == "sandBoss" {
            
            self.hitBoxXOffset = Block.width * (2 / 16)
            self.hitBoxYOffset = Block.height * (1 / 16)
            
            self.hitBox.frame.size.width = Block.width * (16 / 16)
            self.hitBox.frame.size.height = Block.height * (30 / 16)
            
        } else if self.type == "metalBoss" {
            
            self.hitBoxXOffset = Block.width * (3 / 16)
            self.hitBoxYOffset = Block.height * (4.5 / 16)
            
            self.hitBox.frame.size.width = Block.width * (29 / 16)
            self.hitBox.frame.size.height = Block.height * (26 / 16)
            
        } else {
            
            self.hitBoxXOffset = 0
            self.hitBoxYOffset = 0
            
            self.hitBox.frame.size.width = self.width
            self.hitBox.frame.size.height = self.height
        }
        
        if self.type == "jumper" {
            
            /*
             self.xShift = -Block.width * (1 / 16)
             self.yShift = -Block.height * (14 / 16)
             
             self.view.frame.size.width = Block.width * (26 / 16)
             self.view.frame.size.height = Block.height * (26 / 16)
             */
            
            self.view.frame.size.width = self.width
            self.view.frame.size.height = self.height
            
        } else if self.type == "miner" {
            
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
            
            //            self.view.animationDuration = 0.85
            self.view.animationDuration = 0.85 * (1 / 3)
            
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
            //            self.view.animationImages = Enemy.footLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            //            self.view.animationDuration = 0.85 * 0.15 * 3
            
            self.view.startAnimating()
            
        } else if self.type == "eye" {
            
            self.isStunned = true
            
            self.stunTimeInterval = 2
            
            self.view.image = Enemy.eyeClosedImage
            
        } else if self.type == "snake" {
            
            if self.isResetting == false {
                
                if direction == "up" {
                    
                    setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
                    
                } else if direction == "down" {
                    
                    setXY(x: self.x, y: self.y - (Block.height / 2) + (self.height / 2))
                }
            }
            
            self.shootTimeInterval = 1.75
            self.signalTimeInterval = 0.3
            
            self.totalShootTimeInterval = 0.3
            
            // self.view.image = Enemy.snakeLeft1Image
            
            self.view.animationImages = Enemy.snakeLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
            if self.direction == "up" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "down" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: -1)
            }
            
        } else if self.type == "shell" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 1.75
            self.signalTimeInterval = 0.3
            
            self.totalShootTimeInterval = 0.3
            
            self.view.image = Enemy.shellClosedRightImage
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
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
            
            // self.view.image = Enemy.jumperLeft1Image
            // self.view.image = Enemy.jumperLeftImage
            
            self.view.animationImages = Enemy.jumperImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
            self.direction = "left"
            
        } else if self.type == "brickBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.jumpTimeInterval = 1
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            //            self.betweenShotsTimeInterval = 0.1
            
            self.view.image = Enemy.brickBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "chemicalBoss" {
            
            // if self.isResetting == false {
            //     setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            // }
            
            self.jumpTimeInterval = 1
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            //            self.betweenShotsTimeInterval = 0.1
            
            
            self.view.animationImages = Enemy.chemicalBossImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
            self.direction = "left"
            
        } else if self.type == "fireBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            //            self.jumpTimeInterval = 1
            self.jumpTimeInterval = 0
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            self.view.image = Enemy.fireBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "metalBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.jumpTimeInterval = 1
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            self.view.image = Enemy.metalBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "iceBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            //            self.jumpTimeInterval = 1
            self.jumpTimeInterval = 0.125
            
            //            self.signalTimeInterval = 0.25
            self.signalTimeInterval = 0.125
            
            //            self.totalShootTimeInterval = 0.25
            self.totalShootTimeInterval = 0.125
            
            self.view.image = Enemy.iceBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "snowBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            //            self.jumpTimeInterval = 1
            
            //            self.signalTimeInterval = 0.25
            
            self.jumpTimeInterval = 0.125
            
            self.signalTimeInterval = 0.125
            
            //            self.totalShootTimeInterval = 0.25
            
            //            self.betweenShotsTimeInterval = 0.1
            
            self.view.image = Enemy.snowBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "waterBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            //            self.jumpTimeInterval = 1
            self.jumpTimeInterval = 0.125
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            //            self.betweenShotsTimeInterval = 0.1
            
            self.view.image = Enemy.waterBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "sandBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            self.view.image = Enemy.sandBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "chemicalBoss" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.jumpTimeInterval = 1
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            //            self.betweenShotsTimeInterval = 0.1
            
            self.view.image = Enemy.chemicalBossStandLeftImage
            
            self.direction = "left"
            
        } else if self.type == "miner" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 2.25
            
            self.signalTimeInterval = 0.25
            
            self.totalShootTimeInterval = 0.25
            
            self.view.image = Enemy.minerShieldLeftImage
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "electricity" {
            
            if self.isResetting == false {
                
                print("1")
                
                if self.direction == "right" {
                    
                    setXY(x: self.x - (Block.width / 2) + (self.width / 2), y: self.y)
                    
                } else if self.direction == "left" {
                    
                    setXY(x: self.x + (Block.width / 2) - (self.width / 2), y: self.y)
                }
            }
            
            //            self.shootTimeInterval = 3
            self.shootTimeInterval = 2
            
            self.totalShootTimeInterval = 1.5
            
            self.isHidden = true
            
            self.view.isHidden = true
            
            self.view.animationImages = Enemy.electricityImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if self.type == "topMaker" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 2
            
            self.totalShootTimeInterval = 0.3
            
            self.view.animationImages = Enemy.topMakerRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.225
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if self.type == "eggMaker" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 1.5
            
            self.totalShootTimeInterval = 0.25
            
            self.view.animationImages = Enemy.eggMakerLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.225
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "top" {
            
            self.view.animationImages = Enemy.topImages as! [UIImage]
            
            //            self.view.animationDuration = 0.85 * (1 / 3)
            
            //            self.view.animationDuration = 0.615
            self.view.animationDuration = 0.475
            
            self.view.startAnimating()
            
        } else if self.type == "egg" {
            
            self.view.animationImages = Enemy.eggLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.5
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "shooter" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.shootTimeInterval = 1.75
            
            self.totalShootTimeInterval = 0.5
            
            //            self.betweenShotsTimeInterval = 0.1
            //            self.betweenShotsTimeInterval = 0.0625
            self.betweenShotsTimeInterval = 0.07125
            
            self.view.image = Enemy.shooterShieldRightImage
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if self.type == "scooper" {
            
            if self.isResetting == false {
                setXY(x: self.x, y: self.y + (Block.height / 2) - (self.height / 2))
            }
            
            self.view.animationImages = Enemy.scooperLeftImages as! [UIImage]
            
            //           self.view.animationDuration = 0.85 * 0.45
            self.view.animationDuration = 0.85 * 0.45 * 2
            
            self.view.startAnimating()
            
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
            
            //            if self.direction == "right" {
            //
            //                self.view.frame.origin.x = self.x - self.width / 2 + (Block.width * (5 / 16))
            //                self.view.frame.origin.y = self.y - self.height / 2
            //
            //            } else if self.direction == "left" {
            //
            //                self.view.frame.origin.x = self.x - self.width / 2 - (Block.width * (5 / 16))
            //                self.view.frame.origin.y = self.y - self.height / 2
            //            }
            
            self.view.frame.origin.x = self.x - self.width / 2 + self.xShift
            self.view.frame.origin.y = self.y - self.height / 2 + self.yShift
            
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
        
        //        self.hitBox.frame.origin.x = self.x - self.width / 2
        //        self.hitBox.frame.origin.y = self.y - self.height / 2
        
        if self.direction == "left" {
            
            self.hitBox.frame.origin.x = self.x - (self.hitBox.frame.size.width / 2) + self.hitBoxXOffset
            self.hitBox.frame.origin.y = self.y - (self.hitBox.frame.size.height / 2) + self.hitBoxYOffset
            
        } else {
            
            self.hitBox.frame.origin.x = self.x - (self.hitBox.frame.size.width / 2) - self.hitBoxXOffset
            self.hitBox.frame.origin.y = self.y - (self.hitBox.frame.size.height / 2) + self.hitBoxYOffset
        }
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
        
        self.jumpCount = 0
        
        self.canRun = false
        
        self.isHidden = false
        
        self.hitBoxXOffset = 0
        self.hitBoxYOffset = 0
        
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
                
                self.view.image = Enemy.foot1Image
                //                self.view.image = Enemy.footLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
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
            
            /*
             if self.isShooting == true {
             
             self.view.image = Enemy.snakeLeftShootImage
             
             } else if self.isSignalling == true {
             
             self.view.image = Enemy.snakeLeft2Image
             
             } else {
             
             self.view.image = Enemy.snakeLeft1Image
             }
             */
            
            if self.isShooting == true {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.snakeShootLeftImage
                
            } else {
                
                if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.snakeLeftImages as! [UIImage]
                    
                    self.view.animationDuration = 0.85 * (1 / 3)
                    self.view.startAnimating()
                }
            }
            
            if self.direction == "up" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "down" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: -1)
            }
            
        } else if type == "shell" {
            
            if self.view.isAnimating == false {
                
                self.view.stopAnimating()
                
                if self.isShooting == true {
                    
                    self.view.image = Enemy.shellShootRightImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.image = Enemy.shellSignalRightImage
                    
                } else {
                    
                    self.view.image = Enemy.shellClosedRightImage
                }
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if type == "drop" {
            
            if self.didReachGoal1 == true && self.didReachGoal2 == false {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.dropDropImage
            }
            
        } else if type == "sprinkler" {
            
            if self.isShooting == true {
                
                if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.sprinklerImages as! [UIImage]
                    
                    //                self.view.animationDuration = 0.85 * (1 / 3)
                    self.view.animationDuration = 0.85 * (1 / 3) * (4 / 3)
                    self.view.startAnimating()
                }
                
            } else {
                
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
            
            /*
             
             if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
             
             if self.view.isAnimating == false {
             
             self.view.stopAnimating()
             
             self.view.animationImages = Enemy.jumperJumpLeftImages as! [UIImage]
             
             // self.view.animationDuration = 0.85 * (1 / 3)
             self.view.animationDuration = 0.85 * (1 / 3) * (4 / 3)
             
             self.view.startAnimating()
             }
             
             //                self.view.image = Enemy.jumperLeftJumpImage
             
             } else if self.isSignalling == true {
             
             self.view.stopAnimating()
             
             // self.view.image = Enemy.jumperLeft2Image
             self.view.image = Enemy.jumperLeftImage
             
             } else {
             
             self.view.stopAnimating()
             
             // self.view.image = Enemy.jumperLeft1Image
             self.view.image = Enemy.jumperLeftImage
             }
             
             if self.direction == "right" {
             
             self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
             
             } else if self.direction == "left" {
             
             self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
             }
             
             */
            
        } else if type == "brickBoss" {
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
                self.view.image = Enemy.brickBossJumpLeftImage
                
            } else if self.isShooting == true {
                
                self.view.image = Enemy.brickBossThrowLeftImage
                
            } else if self.isSignalling == true {
                
                //                if self.shouldShoot == true {
                //
                //                    self.view.image = Enemy.brickBossSignalJumpLeftImage
                //
                //                } else {
                //
                ////                    self.view.image = Enemy.brickBossSignalThrowLeft1Image
                //                    self.view.image = Enemy.brickBossSignalThrowLeft2Image
                //                }
                
                self.view.image = Enemy.brickBossSignalJumpLeftImage
                
            } else {
                
                self.view.image = Enemy.brickBossStandLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "chemicalBoss" {
            
            if self.isShooting == true {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.chemicalBossThrowImage
                
            } else if self.isSignalling == true {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.chemicalBossSignalImage
                
            } else {
                
                if self.view.isAnimating == true {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.chemicalBossImages as! [UIImage]
                    
                    self.view.animationDuration = 0.85 * (1 / 3)
                    self.view.startAnimating()
                }
            }
            
            /*
             if self.direction == "right" {
             
             self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
             
             } else if self.direction == "left" {
             
             self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
             }
             */
            
        } else if type == "fireBoss" {
            
            if self.xSpeed == 0 {
                
                self.view.stopAnimating()
                
                if self.isShooting == true {
                    
                    self.view.image = Enemy.fireBossThrowLeftImage
                    
                } else if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                    
                    self.view.image = Enemy.fireBossJumpLeftImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.image = Enemy.fireBossSignalJumpLeftImage
                    
                } else {
                    
                    self.view.image = Enemy.fireBossStandLeftImage
                }
                
            } else {
                
                if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.fireBossRunLeftImages as! [UIImage]
                    
                    //                    self.view.animationDuration = 0.55
                    self.view.animationDuration = 0.5
                    
                    self.view.startAnimating()
                }
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "metalBoss" {
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
                self.view.image = Enemy.metalBossJumpLeftImage
                
            } else if self.isShooting == true {
                
                self.view.image = Enemy.metalBossThrowLeftImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.metalBossSignalJumpLeftImage
                
            } else {
                
                self.view.image = Enemy.metalBossStandLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "iceBoss" {
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
                self.view.image = Enemy.iceBossJumpLeftImage
                
            } else if self.isShooting == true {
                
                self.view.image = Enemy.iceBossThrowLeftImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.iceBossSignalJumpLeftImage
                
            } else {
                
                self.view.image = Enemy.iceBossStandLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "skyBoss" {
            
            if self.xSpeed == 0 {
                
                self.view.stopAnimating()
                
                if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                    
                    self.view.image = Enemy.skyBossJumpLeftImage
                    
                } else if self.isShooting == true {
                    
                    self.view.image = Enemy.skyBossThrowLeftImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.image = Enemy.skyBossSignalJumpLeftImage
                    
                } else {
                    
                    self.view.image = Enemy.skyBossStandLeftImage
                }
                
            } else {
                
                if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.skyBossRunLeftImages as! [UIImage]
                    
                    //                    self.view.animationDuration = 0.55
                    self.view.animationDuration = 0.5 * 0.5
                    
                    self.view.startAnimating()
                }
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "snowBoss" {
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
                self.view.image = Enemy.snowBossJumpLeftImage
                
            } else if self.isShooting == true {
                
                //                self.view.image = Enemy.snowBossThrowLeftImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.snowBossSignalJumpLeftImage
                
            } else {
                
                self.view.image = Enemy.snowBossStandLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "waterBoss" {
            
            if self.shouldRun == false {
                
                self.view.stopAnimating()
                
                if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                    
                    self.view.image = Enemy.waterBossJumpLeftImage
                    
                } else if self.isShooting == true {
                    
                    //                    self.view.image = Enemy.waterBossThrowLeftImage
                    self.view.image = Enemy.waterBossSignalJumpLeftImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.image = Enemy.waterBossSignalJumpLeftImage
                    
                } else {
                    
                    self.view.image = Enemy.waterBossStandLeftImage
                }
                
            } else {
                
                if self.canRun == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.image = Enemy.waterBossStandLeftImage
                    
                } else if self.isShooting == true {
                    
                    self.view.stopAnimating()
                    
                    //                    self.view.image = Enemy.waterBossThrowLeftImage
                    self.view.image = Enemy.waterBossSignalJumpLeftImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.stopAnimating()
                    
                    self.view.image = Enemy.waterBossSignalJumpLeftImage
                    
                } else if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.waterBossRunLeftImages as! [UIImage]
                    
                    //                    self.view.animationDuration = 0.55
                    self.view.animationDuration = 0.5 * 0.5
                    
                    self.view.startAnimating()
                }
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "up" {
                
                //                self.view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
                
                if self.x >= (screenSize.height * screenRatio) / 2 {
                    
                    //                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                    self.view.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2)).scaledBy(x: 1, y: -1)
                    
                } else {
                    
                    //                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.view.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2)).scaledBy(x: 1, y: 1)
                }
                
            } else if self.direction == "down" {
                
                //                self.view.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
                
                if self.x >= (screenSize.height * screenRatio) / 2 {
                    
                    //                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                    self.view.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2)).scaledBy(x: -1, y: -1)
                    
                } else {
                    
                    //                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.view.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2)).scaledBy(x: -1, y: 1)
                }
            }
            
            /*
             if self.ySpeed < 0 {
             
             self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
             self.view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
             
             } else if self.ySpeed > 0 {
             
             self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
             self.view.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
             
             } else if self.xSpeed < 0 {
             
             self.view.transform = CGAffineTransform(rotationAngle: CGFloat(0))
             self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
             
             } else if self.xSpeed > 0 {
             
             self.view.transform = CGAffineTransform(rotationAngle: CGFloat(0))
             self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
             }
             */
            
        } else if type == "sandBoss" {
            
            if xSpeed == 0 {
                
                self.view.stopAnimating()
                
                if self.isShooting == true {
                    
                    self.view.image = Enemy.sandBossThrowLeftImage
                    
                } else if self.isSignalling == true {
                    
                    self.view.image = Enemy.sandBossSignalJumpLeftImage
                    
                } else {
                    
                    self.view.image = Enemy.sandBossStandLeftImage
                }
                
            } else {
                
                if self.view.isAnimating == false {
                    
                    self.view.stopAnimating()
                    
                    self.view.animationImages = Enemy.sandBossRunLeftImages as! [UIImage]
                    
                    self.view.animationDuration = 0.55
                    //                    self.view.animationDuration = 0.5
                    
                    self.view.startAnimating()
                }
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "miner" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.minerThrowLeftImage
                
            } else if self.isSignalling == true {
                
                self.view.image = Enemy.minerSignalLeftImage
                
            } else {
                
                self.view.image = Enemy.minerShieldLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "electricity" {
            
            self.isHidden = !self.isShooting
            self.view.isHidden = self.isHidden
            
        } else if type == "topMaker" {
            
            if self.isShooting == true {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.topMakerShootRightImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if type == "eggMaker" {
            
            if self.isShooting == true {
                
                self.view.stopAnimating()
                
                self.view.image = Enemy.eggMakerShootLeftImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "top" {
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "egg" {
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if type == "shooter" {
            
            if self.isShooting == true {
                
                self.view.image = Enemy.shooterShootRightImage
                
            } else {
                
                self.view.image = Enemy.shooterShieldRightImage
            }
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if self.type == "scooper" {
            
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
                                    
                                    if self.x + (self.width / 2) + (self.moveSpeed * 8) < block.x + (Block.width / 2) && self.x + (self.width / 2) + (self.moveSpeed * 8) + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                        
                                        self.direction = "left"
                                        
                                        setXY(x: block.x - (Block.width / 2) - (self.width / 2) - (self.moveSpeed * 8), y: self.y)
                                    }
                                }
                                
                            }
                        }
                        
                    } else if direction == "left" {
                        
                        for block in currentStage!.blocks {
                            
                            if block.type != "ladder" && block.type != "topLadder" {
                                
                                if block.isInLargeBounds() == true {
                                    
                                    if self.x - (self.width / 2) - (self.moveSpeed * 8) < block.x + (Block.width / 2) && self.x - (self.width / 2) - (self.moveSpeed * 8) > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                        
                                        self.direction = "right"
                                        
                                        setXY(x: block.x + (Block.width / 2) + (self.width / 2) + (self.moveSpeed * 8), y: self.y)
                                    }
                                }
                                
                            }
                        }
                        
                    }
                }
                
                if abs((self.y + (self.height / 2)) - (player.y + (Player.height / 2))) <= self.yRange {
                    
                    self.xSpeed = moveSpeed * 3.75
                    
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
                                
                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
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
            
            /*
             if player.x > self.x {
             
             if self.direction == "left" {
             
             setXY(x: self.x, y: self.y)
             
             self.direction = "right"
             }
             
             } else if player.x < self.x {
             
             if self.direction == "right" {
             
             setXY(x: self.x, y: self.y)
             
             self.direction = "left"
             }
             }
             */
            
        } else if self.type == "shell" {
            
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
                
            } else {
                
                //                self.endTimers()
            }
            
        } else if self.type == "turret" {
            
            //            if player.x > self.x {
            //
            //                self.direction = "right"
            //
            //            } else if player.x < self.x {
            //
            //                self.direction = "left"
            //            }
            
        } else if self.type == "jumper" {
            
            /*
             if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
             
             self.width = Block.width * (24 / 16)
             self.height = Block.height * (12 / 16)
             
             self.xShift = -Block.width * (1 / 16)
             self.yShift = 0
             
             } else {
             
             self.width = Block.width * (24 / 16)
             self.height = Block.height * (12 / 16)
             
             self.xShift = -Block.width * (1 / 16)
             self.yShift = -Block.height * (14 / 16)
             }
             */
            
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
                            
                            self.direction = "left"
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                        //                        } else if self.direction == "left" {
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.direction = "right"
                            
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
                                
//                                if player.x >= self.x {
//
//                                    self.direction = "right"
//
//                                } else {
//
//                                    self.direction = "left"
//                                }
                                
                                self.jump()
                                
                                /*
                                 
                                 if self.signalTimer.isValid == false {
                                 
                                 self.signalTimer.invalidate()
                                 
                                 self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                 }
                                 
                                 */
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.xSpeed = 0
                                self.ySpeed = 0
                                
//                                if player.x >= self.x {
//
//                                    self.direction = "right"
//
//                                } else {
//
//                                    self.direction = "left"
//                                }
                                
                                self.jump()
                                
                                /*
                                 
                                 if self.signalTimer.isValid == false {
                                 
                                 self.signalTimer.invalidate()
                                 
                                 self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                 }
                                 
                                 */
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                //                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
//            if self.isJumping == false {
//
//                if player.x >= self.x {
//
//                    self.direction = "right"
//
//                } else {
//
//                    self.direction = "left"
//                }
//
//            } else {
//
//                if self.direction == "right" {
//
//                    self.xSpeed = self.moveSpeed
//
//                } else if self.direction == "left" {
//
//                    self.xSpeed = -self.moveSpeed
//                }
//            }

            if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
                
            } else if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
            }
            
        } else if self.type == "fireBoss" {
            
            if self.canRun == true {
                
                if self.shouldRun == false {
                    
                    self.xSpeed = 0
                    
                    if self.isJumping == true || self.isFalling == true {
                        
                        self.ySpeed += self.ySpeedChange
                        
                        if self.ySpeed > 0 {
                            
                            if self.ySpeed - self.ySpeedChange <= 0 {
                                
                                self.realShoot()
                            }
                            
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
                    
                    for block in selectedBlocks {
                        
                        if block.isHidden == false {
                            
                            if block.isLadder == false && block.isTopLadder == false {
                                
                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                                }
                                
                                if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.x - (self.width / 2) - self.moveSpeed < 0 {
                        
                        setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                        
                    } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                        
                        setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
                    }
                    
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
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            self.shouldRun = true
                                        }
                                        
                                        //                                    if self.signalTimer.isValid == false {
                                        //
                                        //                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        //                                    }
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                    
                                } else if block.isLadder == false {
                                    
                                    if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isJumping = false
                                        self.isFalling = false
                                        
                                        self.xSpeed = 0
                                        self.ySpeed = 0
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            self.shouldRun = true
                                        }
                                        
                                        //                                    if self.signalTimer.isValid == false {
                                        //
                                        //                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        //                                    }
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.isRising == true {
                        
                        for block in selectedBlocks {
                            
                            if block.isHidden == false {
                                
                                if block.isLadder == false && block.isTopLadder == false {
                                    
                                    if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isFalling = true
                                        
                                        self.isJumping = false
                                        self.isRising = false
                                        
                                        self.ySpeed = 0
                                        
                                        setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    
                    /*
                     if self.isJumping == false {
                     
                     
                     if player.x >= self.x {
                     
                     self.direction = "right"
                     
                     } else {
                     
                     self.direction = "left"
                     }
                     }
                     */
                    
                } else {
                    
                    self.xSpeed = self.moveSpeed
                    
                    if direction == "left" {
                        
                        self.xSpeed = -self.xSpeed
                        
                        if self.x - self.moveSpeed <= (Block.width * 2) + (Block.width * 0.5) {
                            
                            self.xSpeed = 0
                            
                            setXY(x: (Block.width * 2) + (Block.width * 0.5) + self.moveSpeed, y: self.y)
                            
                            self.direction = "right"
                            
                            self.shouldRun = false
                            
                            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                        }
                        
                    } else if self.direction == "right" {
                        
                        if self.x + self.moveSpeed >= (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) {
                            
                            self.xSpeed = 0
                            
                            setXY(x: (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) - self.moveSpeed, y: self.y)
                            
                            self.direction = "left"
                            
                            self.shouldRun = false
                            
                            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                        }
                    }
                    
                }
            }
            
        } else if self.type == "waterBoss" {
            
            if self.canRun == true {
                
                if self.shouldRun == false {
                    
                    if self.isJumping == true || self.isFalling == true {
                        
                        self.ySpeed += self.ySpeedChange
                        
                        if self.ySpeed > 0 {
                            
                            //                        if self.ySpeed - self.ySpeedChange <= 0 {
                            //
                            //                            self.realShoot()
                            //                        }
                            
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
                    
                    for block in selectedBlocks {
                        
                        if block.isHidden == false {
                            
                            if block.isLadder == false && block.isTopLadder == false {
                                
                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                                }
                                
                                if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.x - (self.width / 2) - self.moveSpeed < 0 {
                        
                        setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                        
                    } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                        
                        setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
                    }
                    
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
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            //                                        self.jumpCount = 0
                                            
                                            self.shouldRun = true
                                        }
                                        
                                        //                                    if self.signalTimer.isValid == false {
                                        //
                                        //                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        //                                    }
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                    
                                } else if block.isLadder == false {
                                    
                                    if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isJumping = false
                                        self.isFalling = false
                                        
                                        self.xSpeed = 0
                                        self.ySpeed = 0
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            //                                        self.jumpCount = 0
                                            
                                            self.shouldRun = true
                                        }
                                        
                                        //                                    if self.signalTimer.isValid == false {
                                        //
                                        //                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        //                                    }
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.isRising == true {
                        
                        for block in selectedBlocks {
                            
                            if block.isHidden == false {
                                
                                if block.isLadder == false && block.isTopLadder == false {
                                    
                                    if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isFalling = true
                                        
                                        self.isJumping = false
                                        self.isRising = false
                                        
                                        self.ySpeed = 0
                                        
                                        setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    
                    /*
                     if self.isJumping == false {
                     
                     
                     if player.x >= self.x {
                     
                     self.direction = "right"
                     
                     } else {
                     
                     self.direction = "left"
                     }
                     }
                     */
                    
                } else {
                    
                    self.xSpeed = 0
                    self.ySpeed = 0
                    
                    if self.direction == "left" {
                        
                        self.xSpeed = -self.moveSpeed
                        
                        if self.jumpCount >= 1 {
                            
                            if self.x - (self.width / 2) - self.moveSpeed <= Block.width - (Block.width * (2 / 16)) {
                                
                                self.xSpeed = 0
                                
                                setXY(x: Block.width - (Block.width * (2 / 16)) + (self.width / 2) + self.moveSpeed, y: self.y)
                                
                                self.direction = "up"
                            }
                            
                        } else {
                            
                            if self.x + self.moveSpeed <= (screenSize.height * screenRatio) - (Block.width * 3) {
                                
                                self.xSpeed = 0
                                
                                setXY(x: (screenSize.height * screenRatio) - (Block.width * 3) - self.moveSpeed, y: self.y)
                                
                                self.shouldRun = false
                                
                                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                            }
                        }
                        
                    } else if self.direction == "right" {
                        
                        self.xSpeed = self.moveSpeed
                        
                        if self.jumpCount >= 1 {
                            
                            if self.x + (self.width / 2) + self.moveSpeed >= (screenSize.height * screenRatio) - Block.width + (Block.width * (2 / 16)) {
                                
                                self.xSpeed = 0
                                
                                setXY(x: (screenSize.height * screenRatio) - Block.width + (Block.width * (2 / 16)) - (self.width / 2) - self.moveSpeed, y: self.y)
                                
                                self.direction = "up"
                            }
                            
                        } else {
                            
                            if self.x + self.moveSpeed >= Block.width * 3 {
                                
                                self.xSpeed = 0
                                
                                setXY(x:(Block.width * 3) - self.moveSpeed, y: self.y)
                                
                                self.shouldRun = false
                                
                                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                            }
                            
                        }
                        
                    } else if self.direction == "up" {
                        
                        self.shouldShoot = true
                        
                        self.ySpeed = -self.moveSpeed
                        
                        if self.y - self.moveSpeed <= (Block.height * 3) + (Block.height * 0.5) {
                            
                            self.ySpeed = 0
                            
                            setXY(x: self.x, y: self.moveSpeed + (Block.height * 3) + (Block.height * 0.5))
                            
                            self.direction = ""
                            
                            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval * 0.75), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                        }
                        
                    } else if self.direction == "down" {
                        
                        self.shouldShoot = false
                        
                        self.ySpeed = self.moveSpeed
                        
                        if self.y + (self.height / 2) + self.moveSpeed >= screenSize.height - (Block.height * 3) {
                            
                            self.ySpeed = 0
                            
                            setXY(x: self.x, y: screenSize.height - (Block.height * 3) - (self.height / 2) - self.moveSpeed)
                            
                            if self.x >= (screenSize.height * screenRatio) / 2 {
                                
                                self.direction = "left"
                                
                            } else {
                                
                                self.direction = "right"
                            }
                            
                        }
                    }
                    
                }
            }
            
        } else if self.type == "skyBoss" {
            
            if self.canRun == true {
                
                if self.shouldRun == false {
                    
                    self.xSpeed = 0
                    
                    if self.isJumping == true || self.isFalling == true {
                        
                        self.ySpeed += self.ySpeedChange
                        
                        if self.ySpeed > 0 {
                            
                            if self.ySpeed - self.ySpeedChange <= 0 {
                                
                                if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                                    
                                    for bullet in enemyBullets {
                                        
                                        bullet.didReachGoal = true
                                    }
                                    
                                }
                            }
                            
                            //                        if self.ySpeed - self.ySpeedChange <= 0 {
                            //
                            //                            self.realShoot()
                            //                        }
                            
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
                    
                    for block in selectedBlocks {
                        
                        if block.isHidden == false {
                            
                            if block.isLadder == false && block.isTopLadder == false {
                                
                                if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                                }
                                
                                if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                                    
                                    setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.x - (self.width / 2) - self.moveSpeed < 0 {
                        
                        setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                        
                    } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                        
                        setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
                    }
                    
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
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        /*
                                         if self.signalTimer.isValid == false && self.isSignalling == false {
                                         
                                         self.shouldRun = true
                                         }
                                         
                                         */
                                        
                                        if self.jumpCount >= 3 {
                                            
                                            self.jumpCount = 0
                                            
                                            //                if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            self.shouldRun = true
                                            //                }
                                            
                                            //                                        self.realShoot()
                                            
                                        } else {
                                            
                                            if self.signalTimer.isValid == false && self.isSignalling == false {
                                                
                                                self.realShoot()
                                                
                                                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                            }
                                        }
                                        
                                        //                                    self.jump()
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                    
                                } else if block.isLadder == false {
                                    
                                    if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isJumping = false
                                        self.isFalling = false
                                        
                                        self.xSpeed = 0
                                        self.ySpeed = 0
                                        
                                        //                                    print("TEST TEST TEST")
                                        
                                        /*
                                         if self.signalTimer.isValid == false && self.isSignalling == false {
                                         
                                         self.shouldRun = true
                                         }
                                         
                                         */
                                        
                                        if self.jumpCount >= 3 {
                                            
                                            self.jumpCount = 0
                                            
                                            //                if self.signalTimer.isValid == false && self.isSignalling == false {
                                            
                                            self.shouldRun = true
                                            //                }
                                            
                                            //                                        self.realShoot()
                                            
                                        } else {
                                            
                                            if self.signalTimer.isValid == false && self.isSignalling == false {
                                                
                                                self.realShoot()
                                                
                                                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                            }
                                        }
                                        
                                        //                                    self.jump()
                                        
                                        setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                    if self.isRising == true {
                        
                        for block in selectedBlocks {
                            
                            if block.isHidden == false {
                                
                                if block.isLadder == false && block.isTopLadder == false {
                                    
                                    if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                        
                                        self.isFalling = true
                                        
                                        self.isJumping = false
                                        self.isRising = false
                                        
                                        self.ySpeed = 0
                                        
                                        setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    
                    /*
                     if self.isJumping == false {
                     
                     
                     if player.x >= self.x {
                     
                     self.direction = "right"
                     
                     } else {
                     
                     self.direction = "left"
                     }
                     }
                     */
                    
                } else {
                    
                    self.xSpeed = self.moveSpeed
                    
                    if direction == "left" {
                        
                        self.xSpeed = -self.xSpeed
                        
                        if self.x - self.moveSpeed <= (Block.width * 2) + (Block.width * 0.5) {
                            
                            self.xSpeed = 0
                            
                            setXY(x: (Block.width * 2) + (Block.width * 0.5) + self.moveSpeed, y: self.y)
                            
                            self.direction = "right"
                            
                            self.shouldRun = false
                            
                            //                        enemyBullets.removeAll()
                            //
                            //                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                        }
                        
                    } else if self.direction == "right" {
                        
                        if self.x + self.moveSpeed >= (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) {
                            
                            self.xSpeed = 0
                            
                            setXY(x: (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) - self.moveSpeed, y: self.y)
                            
                            self.direction = "left"
                            
                            self.shouldRun = false
                            
                            //                        enemyBullets.removeAll()
                            //
                            //                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                        }
                    }
                    
                }
            }
            
        } else if self.type == "sandBoss" {
            
            if self.isShooting == false && self.isSignalling == false && self.signalTimer.isValid == false && self.signalTimer.isValid == false {
                
                self.xSpeed = self.moveSpeed
                
                if direction == "left" {
                    
                    self.xSpeed = -self.xSpeed
                    
                    if self.x - self.moveSpeed <= (Block.width * 2) + (Block.width * 0.5) {
                        
                        self.xSpeed = 0
                        
                        setXY(x: (Block.width * 2) + (Block.width * 0.5) + self.moveSpeed, y: self.y)
                        
                        self.direction = "right"
                        
                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                    }
                    
                } else if self.direction == "right" {
                    
                    if self.x + self.moveSpeed >= (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) {
                        
                        self.xSpeed = 0
                        
                        setXY(x: (screenSize.height * screenRatio) - (Block.width * 2) - (Block.width * 0.5) - self.moveSpeed, y: self.y)
                        
                        self.direction = "left"
                        
                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                    }
                }
                
            } else {
                
                self.xSpeed = 0
            }
            
        } else if self.type == "metalBoss" {
            
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
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                        }
                        
                    }
                }
                
            }
            
            if self.x - (self.width / 2) - self.moveSpeed < 0 {
                
                setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                
            } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                
                setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
            }
            
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
                                
                                //                                if self.signalTimer.isValid == false && self.isSignalling == false {
                                //
                                //                                    if self.direction == "left" {
                                //
                                //                                        self.direction = "right"
                                //
                                //                                    } else if self.direction == "right" {
                                //
                                //                                        self.direction = "left"
                                //                                    }
                                //                                }
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false && self.jumpTimer.isValid == false && endShootTimer.isValid == false {
                                    
                                    if self.direction == "left" {
                                        
                                        self.direction = "right"
                                        
                                    } else if self.direction == "right" {
                                        
                                        self.direction = "left"
                                    }
                                    
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
                                
                                //                                if self.signalTimer.isValid == false && self.isSignalling == false {
                                //
                                //                                    if self.direction == "left" {
                                //
                                //                                        self.direction = "right"
                                //
                                //                                    } else if self.direction == "right" {
                                //
                                //                                        self.direction = "left"
                                //                                    }
                                //                                }
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false && self.jumpTimer.isValid == false && endShootTimer.isValid == false {
                                    
                                    if self.direction == "left" {
                                        
                                        self.direction = "right"
                                        
                                    } else if self.direction == "right" {
                                        
                                        self.direction = "left"
                                    }
                                    
                                    self.signalTimer.invalidate()
                                    
                                    self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
            /*
             if self.isJumping == false {
             
             if player.x >= self.x {
             
             self.direction = "right"
             
             } else {
             
             self.direction = "left"
             }
             }
             */
            
        } else if self.type == "iceBoss" {
            
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
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                        }
                        
                    }
                }
                
            }
            
            if self.x - (self.width / 2) - self.moveSpeed < 0 {
                
                setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                
            } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                
                setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
            }
            
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
                                
                                //                                if self.signalTimer.isValid == false && self.isSignalling == false {
                                //
                                //                                    if self.direction == "left" {
                                //
                                //                                        self.direction = "right"
                                //
                                //                                    } else if self.direction == "right" {
                                //
                                //                                        self.direction = "left"
                                //                                    }
                                //                                }
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false && self.jumpTimer.isValid == false && endShootTimer.isValid == false {
                                    
                                    if self.x >= (screenSize.height * screenRatio) - (Block.width * 3) || self.x <= (Block.width * 3) {
                                        
                                        if self.direction == "left" {
                                            
                                            self.direction = "right"
                                            
                                        } else if self.direction == "right" {
                                            
                                            self.direction = "left"
                                        }
                                        
                                        self.signalTimer.invalidate()
                                        
                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        
                                    } else {
                                        
                                        self.signalTimer.invalidate()
                                        
                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                    }
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                //                                if self.signalTimer.isValid == false && self.isSignalling == false {
                                //
                                //                                    if self.direction == "left" {
                                //
                                //                                        self.direction = "right"
                                //
                                //                                    } else if self.direction == "right" {
                                //
                                //                                        self.direction = "left"
                                //                                    }
                                //                                }
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false && self.jumpTimer.isValid == false && endShootTimer.isValid == false {
                                    
                                    if self.x >= (screenSize.height * screenRatio) - (Block.width * 3) || self.x <= (Block.width * 3) {
                                        
                                        if self.direction == "left" {
                                            
                                            self.direction = "right"
                                            
                                        } else if self.direction == "right" {
                                            
                                            self.direction = "left"
                                        }
                                        
                                        self.signalTimer.invalidate()
                                        
                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                        
                                    } else {
                                        
                                        self.signalTimer.invalidate()
                                        
                                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                    }
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
            /*
             if self.isJumping == false {
             
             if player.x >= self.x {
             
             self.direction = "right"
             
             } else {
             
             self.direction = "left"
             }
             }
             */
            
        } else if self.type == "brickBoss" {
            
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
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                        }
                        
                    }
                }
                
            }
            
            if self.x - (self.width / 2) - self.moveSpeed < 0 {
                
                setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                
            } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                
                setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
            }
            
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
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false {
                                    
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
                                
                                if self.signalTimer.isValid == false && self.shootTimer.isValid == false {
                                    
                                    self.signalTimer.invalidate()
                                    
                                    self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                                }
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
            if self.isJumping == false {
                
                if player.x >= self.x {
                    
                    self.direction = "right"
                    
                } else {
                    
                    self.direction = "left"
                }
            }
            
        } else if self.type == "chemicalBoss" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else if self.type == "snowBoss" {
            
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
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                            
                            self.direction = "left"
                        }
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2), y: self.y)
                            
                            self.direction = "right"
                        }
                        
                    }
                }
                
            }
            
            if self.x - (self.width / 2) - self.moveSpeed < 0 {
                
                setXY(x: (self.width / 2) + self.moveSpeed, y: self.y)
                
                self.direction = "right"
                
            } else if self.x + (self.width / 2) + self.moveSpeed > screenSize.height * screenRatio {
                
                setXY(x: (screenSize.height * screenRatio) - (self.width / 2) - self.moveSpeed, y: self.y)
                
                self.direction = "left"
            }
            
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
                
            }
            
            if self.isRising == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isLadder == false && block.isTopLadder == false {
                            
                            if self.y - (self.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (self.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = true
                                
                                self.isJumping = false
                                self.isRising = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
            /*
             
             if self.isJumping == false {
             
             if player.x >= self.x {
             
             self.direction = "right"
             
             } else {
             
             self.direction = "left"
             }
             }
             
             */
            
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
            
        } else if self.type == "electricity" {
            
        } else if self.type == "topMaker" {
            
        } else if self.type == "eggMaker" {
            
        } else if self.type == "top" {
            
            if self.isFalling == true {
                
                self.ySpeed += self.ySpeedChange
                
                if self.ySpeed > 0 {
                    
                    self.isFalling = true
                    
                    if self.ySpeed > self.maxFallSpeed {
                        self.ySpeed = self.maxFallSpeed
                    }
                    
                } else if ySpeed < 0 {
                    
                    self.isFalling = false
                }
            }
            
            let offset: CGFloat = Block.width * (1 / 16) * 0.1
            
            if direction == "right" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.direction = "left"
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                    }
                }
                
            } else if direction == "left" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.direction = "right"
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2) + self.moveSpeed, y: self.y)
                        }
                        
                    }
                }
                
            }
            
            self.xSpeed = moveSpeed
            
            if self.direction == "left" {
                self.xSpeed = -self.xSpeed
            }
            
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
            
            if isEmpty == true {
                
                self.isFalling = true
            }
            
            if self.isFalling == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (self.height / 2) + self.maxFallSpeed <= block.y - (Block.height / 2) + self.maxFallSpeed && self.y + (self.height / 2) + self.maxFallSpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
        } else if self.type == "egg" {
            
            if self.isFalling == true {
                
                self.ySpeed += self.ySpeedChange
                
                if self.ySpeed > 0 {
                    
                    self.isFalling = true
                    
                    if self.ySpeed > self.maxFallSpeed {
                        self.ySpeed = self.maxFallSpeed
                    }
                    
                } else if ySpeed < 0 {
                    
                    self.isFalling = false
                }
            }
            
            let offset: CGFloat = Block.width * (1 / 16) * 0.1
            
            if direction == "right" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.direction = "left"
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                    }
                }
                
            } else if direction == "left" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.direction = "right"
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2) + self.moveSpeed, y: self.y)
                        }
                        
                    }
                }
                
            }
            
            self.xSpeed = moveSpeed
            
            if self.direction == "left" {
                self.xSpeed = -self.xSpeed
            }
            
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
            
            if isEmpty == true {
                
                self.isFalling = true
            }
            
            if self.isFalling == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (self.height / 2) + self.maxFallSpeed <= block.y - (Block.height / 2) + self.maxFallSpeed && self.y + (self.height / 2) + self.maxFallSpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
            
        } else if self.type == "shooter" {
            
            //            if player.x > self.x {
            //
            //                self.direction = "right"
            //
            //            } else if player.x < self.x {
            //
            //                self.direction = "left"
            //            }
            
        } else if self.type == "scooper" {
            
            if player.x > self.x {
                
                self.direction = "right"
                
            } else if player.x < self.x {
                
                self.direction = "left"
            }
            
            if self.isFalling == true {
                
                self.ySpeed += self.ySpeedChange
                
                if self.ySpeed > 0 {
                    
                    self.isFalling = true
                    
                    if self.ySpeed > self.maxFallSpeed {
                        self.ySpeed = self.maxFallSpeed
                    }
                    
                } else if ySpeed < 0 {
                    
                    self.isFalling = false
                }
            }
            
            let offset: CGFloat = Block.width * (1 / 16) * 0.1
            
            if direction == "right" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x + (self.width / 2) + (self.moveSpeed * 2.5) < block.x + (Block.width / 2) && self.x + (self.width / 2) + (self.moveSpeed * 2.5) + offset > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - (self.moveSpeed * 2.5), y: self.y)
                        }
                        
                    }
                }
                
            } else if direction == "left" {
                
                for block in selectedBlocks {
                    
                    if block.type != "ladder" && block.type != "topLadder" {
                        
                        if self.x - (self.width / 2) - (self.moveSpeed * 2.5) < block.x + (Block.width / 2) && self.x - (self.width / 2) - (self.moveSpeed * 2.5) > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            setXY(x: block.x + (Block.width / 2) + (self.width / 2) + (self.moveSpeed * 2.5), y: self.y)
                        }
                        
                    }
                }
                
            }
            
            if abs(abs(player.x) - abs(self.x)) <= self.xGoal {
                
                if self.didReachGoal1 == false {
                    
                    self.didReachGoal1 = true
                    
                    self.view.animationImages = Enemy.scooperLeftImages as! [UIImage]
                    
                    // self.view.animationDuration = 0.85 * 0.225
                    //                    self.view.animationDuration = 0.85 * 0.225 * 2
                    
                    self.view.animationDuration = 0.85 * 0.45 * 2
                    
                    self.view.startAnimating()
                }
                
                //                self.xSpeed = self.moveSpeed * 2.5
                
                self.xSpeed = self.moveSpeed
                
            } else {
                
                if self.didReachGoal1 == true {
                    
                    self.didReachGoal1 = false
                    
                    self.view.animationImages = Enemy.scooperLeftImages as! [UIImage]
                    
                    // self.view.animationDuration = 0.85 * 0.45
                    //                    self.view.animationDuration = 0.85 * 0.45 * 2
                    
                    self.view.animationDuration = 0.85 * 0.225 * 2
                    
                    self.view.startAnimating()
                }
                
                //                self.xSpeed = self.moveSpeed
                
                //                self.xSpeed = self.moveSpeed * 4
                self.xSpeed = 0.75
            }
            
            if self.direction == "left" {
                self.xSpeed = -self.xSpeed
            }
            
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
            
            if isEmpty == true {
                
                self.isFalling = true
            }
            
            if self.isFalling == true {
                
                for block in selectedBlocks {
                    
                    if block.isHidden == false {
                        
                        if block.isTopLadder == true {
                            
                            if self.y + (self.height / 2) + self.maxFallSpeed <= block.y - (Block.height / 2) + self.maxFallSpeed && self.y + (self.height / 2) + self.maxFallSpeed >= block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isFalling = false
                                
                                self.ySpeed = 0
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                        }
                        
                    }
                }
                
            }
        }
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
        
        self.updateHitbox()
    }
    
    func updateHitbox() {
        
        if self.direction == "left" {
            
            self.hitBox.frame.origin.x = self.x - (self.hitBox.frame.size.width / 2) + self.hitBoxXOffset
            self.hitBox.frame.origin.y = self.y - (self.hitBox.frame.size.height / 2) + self.hitBoxYOffset
            
        } else {
            
            self.hitBox.frame.origin.x = self.x - (self.hitBox.frame.size.width / 2) - self.hitBoxXOffset
            self.hitBox.frame.origin.y = self.y - (self.hitBox.frame.size.height / 2) + self.hitBoxYOffset
        }
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
        
        //        self.view.animationImages = Enemy.eyeImages as! [UIImage]
        //
        //        self.view.animationRepeatCount = 1
        //
        //        self.view.animationDuration = 0.1
        //        self.view.startAnimating()
        
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
                    
                    if bullets[i].canHitEnemy(enemy: self) == true {
                        
                        if self.type == "follower" {
                            
                            return i
                            
                        } else if self.type == "hat" {
                            
                            if bullets[i].type == "regular" {
                                
                                if self.isShooting == true {
                                    
                                    return i
                                    
                                    //                                if (bullets[i].xSpeed <= 0 && self.direction == "right") || (bullets[i].xSpeed >= 0 && self.direction == "left") {
                                    //
                                    //                                    return i
                                    //
                                    //                                } else {
                                    //
                                    //                                    self.handleDeflectBullet(i: i)
                                    //                                }
                                    
                                } else {
                                    
                                    self.handleDeflectBullet(i: i)
                                }
                                
                            } else if bullets[i].type == "cutter" {
                                
                                return i
                                
                            } else if bullets[i].type == "blade" {
                                
                                return i
                                
                            } else if bullets[i].type == "magnet" {
                                
                                return i
                                
                            } else if bullets[i].type == "shield" {
                                
                                return i
                                
                            } else if bullets[i].type == "tornado" {
                                
                                return i
                                
                            } else if bullets[i].type == "bubble" {
                                
                                return i
                                
                            } else if bullets[i].type == "bomb" {
                                
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
                            
                        } else if self.type == "shell" {
                            
                            if bullets[i].type == "regular" {
                                
                                if self.isShooting == true || self.isSignalling == true || self.view.isAnimating == true {
                                    
                                    return i
                                    
                                    //                                if (bullets[i].xSpeed <= 0 && self.direction == "right") || (bullets[i].xSpeed >= 0 && self.direction == "left") {
                                    //
                                    //                                    return i
                                    //
                                    //                                } else {
                                    //
                                    //                                    self.handleDeflectBullet(i: i)
                                    //                                }
                                    
                                } else {
                                    
                                    self.handleDeflectBullet(i: i)
                                }
                                
                            } else if bullets[i].type == "cutter" {
                                
                                return i
                                
                            } else if bullets[i].type == "blade" {
                                
                                return i
                                
                            } else if bullets[i].type == "magnet" {
                                
                                return i
                                
                            } else if bullets[i].type == "shield" {
                                
                                return i
                                
                            } else if bullets[i].type == "tornado" {
                                
                                return i
                                
                            } else if bullets[i].type == "bubble" {
                                
                                return i
                                
                            } else if bullets[i].type == "bomb" {
                                
                                return i
                            }
                            
                        } else if self.type == "drop" {
                            
                            return i
                            
                        } else if self.type == "sprinkler" {
                            
                            return i
                            
                        } else if self.type == "turret" {
                            
                            return i
                            
                        } else if self.type == "jumper" {
                            
                            return i
                            
                        } else if self.type == "brickBoss" {
                            
                            return i
                            
                        } else if self.type == "fireBoss" {
                            
                            return i
                            
                        } else if self.type == "metalBoss" {
                            
                            return i
                            
                        } else if self.type == "iceBoss" {
                            
                            return i
                            
                        } else if self.type == "skyBoss" {
                            
                            return i
                            
                        } else if self.type == "snowBoss" {
                            
                            return i
                            
                        } else if self.type == "waterBoss" {
                            
                            return i
                            
                        } else if self.type == "sandBoss" {
                            
                            return i
                            
                        } else if self.type == "chemicalBoss" {
                            
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
                                
                            } else if bullets[i].type == "shield" {
                                
                                return i
                                
                            } else if bullets[i].type == "tornado" {
                                
                                return i
                                
                            } else if bullets[i].type == "bubble" {
                                
                                return i
                                
                            } else if bullets[i].type == "bomb" {
                                
                                return i
                            }
                            
                        } else if self.type == "electricity" {
                            
                        } else if self.type == "topMaker" {
                            
                            return i
                            
                        } else if self.type == "eggMaker" {
                            
                            return i
                            
                        } else if self.type == "top" {
                            
                            return i
                            
                        }  else if self.type == "egg" {
                            
                            return i
                            
                        } else if self.type == "shooter" {
                            
                            if bullets[i].type == "regular" {
                                
                                if self.isShooting == true {
                                    
                                    return i
                                    
                                } else {
                                    
                                    if (bullets[i].xSpeed >= 0 && self.direction == "right") || (bullets[i].xSpeed <= 0 && self.direction == "left") {
                                        
                                        return i
                                        
                                    } else {
                                        
                                        self.handleDeflectBullet(i: i)
                                    }
                                    
                                    //                                self.handleDeflectBullet(i: i)
                                }
                                
                            } else if bullets[i].type == "cutter" {
                                
                                return i
                                
                            } else if bullets[i].type == "blade" {
                                
                                return i
                                
                            } else if bullets[i].type == "magnet" {
                                
                                return i
                                
                            } else if bullets[i].type == "shield" {
                                
                                return i
                                
                            } else if bullets[i].type == "tornado" {
                                
                                return i
                                
                            } else if bullets[i].type == "bubble" {
                                
                                return i
                                
                            } else if bullets[i].type == "bomb" {
                                
                                return i
                            }
                            
                        } else if self.type == "scooper" {
                            
                            if bullets[i].type == "regular" {
                                
                                /*
                                 if self.isShooting == true {
                                 
                                 return i
                                 
                                 } else {
                                 
                                 let headHeight: CGFloat = Block.height * (24 / 16)
                                 let headBottomY: CGFloat = self.y - self.height / 2 + headHeight
                                 
                                 //                                if bullets[i].y <= headBottomY || (bullets[i].xSpeed >= 0 && self.direction == "right") || (bullets[i].xSpeed <= 0 && self.direction == "left") {
                                 if bullets[i].y <= headBottomY {
                                 
                                 return i
                                 
                                 } else {
                                 
                                 self.handleDeflectBullet(i: i)
                                 }
                                 
                                 //                                self.handleDeflectBullet(i: i)
                                 }
                                 */
                                
                                return i
                                
                            } else if bullets[i].type == "cutter" {
                                
                                return i
                                
                            } else if bullets[i].type == "blade" {
                                
                                return i
                                
                            } else if bullets[i].type == "magnet" {
                                
                                return i
                                
                            } else if bullets[i].type == "shield" {
                                
                                return i
                                
                            } else if bullets[i].type == "tornado" {
                                
                                return i
                                
                            } else if bullets[i].type == "bubble" {
                                
                                return i
                                
                            } else if bullets[i].type == "bomb" {
                                
                                return i
                            }
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
    
    func handleHit(bulletDamage: Int, bulletType: String) {
        
        self.isHit = true
        
        self.view.isHidden = true
        
        if self.type == "foot" {
            
            self.isStunned = true
            
            self.endStunTimer.invalidate()
            
            self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
            
        } else {
            
            var newBulletDamage = bulletDamage
            
            if self.type == "brickBoss" && (bulletType == "magnet" || bulletType == "shield") {
                
                newBulletDamage *= 2
                
            } else if self.type == "fireBoss" && (bulletType == "magnet" || bulletType == "tornado") {
                
                newBulletDamage *= 2
                
            } else if self.type == "metalBoss" && (bulletType == "shield" || bulletType == "beam") {
                
                newBulletDamage *= 2
                
            } else if self.type == "iceBoss" && (bulletType == "blade" || bulletType == "bubble") {
                
                newBulletDamage *= 2
                
            } else if self.type == "skyBoss" && (bulletType == "tornado" || bulletType == "cutter") {
                
                newBulletDamage *= 2
                
            } else if self.type == "snowBoss" && (bulletType == "blade" || bulletType == "brick") {
                
                newBulletDamage *= 2
                
            } else if self.type == "waterBoss" && (bulletType == "cutter" || bulletType == "beam") {
                
                newBulletDamage *= 2
                
            } else if self.type == "sandBoss" && (bulletType == "brick" || bulletType == "bubble") {
                
                newBulletDamage *= 2
                
            } else if self.type == "chemicalBoss" {
                
                // newBulletDamage *= 2
            }
            
            self.health -= newBulletDamage
            
            if self.type == "brickBoss" || self.type == "fireBoss" || self.type == "metalBoss" || self.type == "iceBoss" || self.type == "skyBoss" || self.type == "snowBoss" || self.type == "waterBoss" || self.type == "sandBoss" || self.type == "chemicalBoss" {
                Enemy.bossHealthBar.setEnergy(energy: self.health)
            }
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
        
        /*
         print()
         print("JUMP")
         print()
         */
        
        if self.type == "skyBoss" || self.type == "waterBoss" {
            
            self.jumpCount += 1
        }
        
        self.isSignalling = false
        
        self.isJumping = true
        self.isRising = true
        
        if self.type != "fireBoss" {
            
            if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
                
            } else if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
            }
            
        } else {
            
            self.xSpeed = 0
        }
        
        self.ySpeed = -self.maxFallSpeed
    }
    
    @objc func shoot() {
        
        if self.isShooting == false {
            
            self.isShooting = true
            
            self.isSignalling = false
            
            if self.type == "sprinkler" {
                
                //                self.view.animationImages = Enemy.sprinklerImages as! [UIImage]
                //
                //                //                self.view.animationDuration = 0.85 * (1 / 3)
                //                self.view.animationDuration = 0.85 * (1 / 3) * (4 / 3)
                //                self.view.startAnimating()
                
            } else if self.type == "turret" {
                
                self.view.animationImages = Enemy.turretLeftOpenImages as! [UIImage]
                
                self.view.animationRepeatCount = 1
                
                self.view.animationDuration = 0.15
                self.view.startAnimating()
            }
            
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
            
        } else if self.type == "brickBoss" {
            
            if self.shootTimer.isValid == false && self.jumpTimer.isValid == false {
                
                if self.shouldShoot == true {
                    
                    self.shouldShoot = false
                    
                    //                    if self.endShootTimer.isValid == false {
                    //
                    //                        self.endShootTimer.invalidate()
                    //
                    //                        self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
                    //                    }
                    
                    if self.shootTimer.isValid == false {
                        
                        self.shootTimer.invalidate()
                        
                        self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                    }
                    
                } else {
                    
                    self.shouldShoot = true
                    
                    if self.jumpTimer.isValid == false {
                        
                        self.jumpTimer.invalidate()
                        
                        self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
                    }
                }
                
            }
            
        } else if self.type == "chemicalBoss" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            /*
             
             if self.shootTimer.isValid == false {
             
             self.shootTimer.invalidate()
             
             self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
             }
             
             */
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else if self.type == "fireBoss" {
            
            if self.jumpTimer.isValid == false {
                
                self.jumpTimer.invalidate()
                
                self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "metalBoss" {
            
            if self.shootTimer.isValid == false && self.jumpTimer.isValid == false {
                
                if self.shouldShoot == true {
                    
                    self.shouldShoot = false
                    
                    if self.shootTimer.isValid == false {
                        
                        self.shootTimer.invalidate()
                        
                        self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                    }
                    
                } else {
                    
                    self.shouldShoot = true
                    
                    if self.jumpTimer.isValid == false {
                        
                        self.jumpTimer.invalidate()
                        
                        self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
                    }
                }
                
            }
            
        } else if self.type == "iceBoss" {
            
            if self.shootTimer.isValid == false && self.jumpTimer.isValid == false {
                
                if self.shouldShoot == true {
                    
                    self.shouldShoot = false
                    
                    if self.shootTimer.isValid == false {
                        
                        self.shootTimer.invalidate()
                        
                        self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                    }
                    
                } else {
                    
                    self.shouldShoot = true
                    
                    if self.jumpTimer.isValid == false {
                        
                        self.jumpTimer.invalidate()
                        
                        self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
                    }
                }
                
            }
            
        } else if self.type == "snowBoss" {
            
            if self.jumpTimer.isValid == false {
                
                if self.jumpTimer.isValid == false {
                    
                    self.jumpTimer.invalidate()
                    
                    self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
                }
            }
            
        } else if self.type == "sandBoss" {
            
            if self.shootTimer.isValid == false {
                
                self.shootTimer.invalidate()
                
                self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "skyBoss" {
            
            if self.jumpTimer.isValid == false {
                
                self.jumpTimer.invalidate()
                
                self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "waterBoss" {
            
            /*
             if self.jumpTimer.isValid == false {
             
             self.jumpTimer.invalidate()
             
             self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
             }
             */
            
            if self.shootTimer.isValid == false && self.jumpTimer.isValid == false {
                
                if self.shouldShoot == true {
                    
                    if self.shootTimer.isValid == false {
                        
                        self.shootTimer.invalidate()
                        
                        self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                    }
                    
                } else {
                    
                    self.shouldShoot = true
                    
                    if self.jumpTimer.isValid == false {
                        
                        self.jumpTimer.invalidate()
                        
                        self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.signalTimeInterval), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
                    }
                }
                
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
            
            //            let xOffset: CGFloat = Block.width * (14 / 16)
            //            let yOffset: CGFloat = Block.width * (4 / 16)
            
            // let xOffset: CGFloat = Block.width * (14 / 16)
            // let yOffset: CGFloat = Block.width * (0 / 16)
            
            let xOffset: CGFloat = Block.width * (0 / 16)
            let yOffset: CGFloat = Block.width * (7 / 16)
            
            if self.direction == "up" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, target: "player", speed: bulletSpeed, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "down" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, target: "player", speed: bulletSpeed, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "shell" {
            
            let bulletSpeed: CGFloat = 1.75
            
            //            let xOffset: CGFloat = Block.width * (14 / 16)
            let xOffset: CGFloat = Block.width * (8 / 16)
            
            //            let yOffset: CGFloat = Block.width * (1 / 16)
            let yOffset: CGFloat = -Block.width * (0 / 16)
            
            if self.direction == "left" {
                
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "mediumRegular"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "drop" {
            
            let bulletSpeed: CGFloat = 2
            
            let yOffset: CGFloat = Block.width * (0 / 16)
            
            enemyBullets.append(EnemyBullet(x: self.x, y: self.y + yOffset, xSpeed: 0, ySpeed: bulletSpeed, type: "dropHead"))
            
        } else if self.type == "sprinkler" {
            
            let bulletSpeedMax: CGFloat = 3.25
            let bulletSpeedMin: CGFloat = bulletSpeedMax / (sqrt(2))
            
            //            let yOffset: CGFloat = Block.width * (4 / 16)
            let yOffset: CGFloat = Block.width * (5 / 16)
            
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
            
            //            enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, targetX: goalX, targetY: goalY, speed: bulletSpeed, type: "smallBlue"))
            enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, targetX: goalX, targetY: goalY, speed: bulletSpeed, type: "smallTan"))
            
            if self.shootCount >= 3 {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
                self.shootCount = 0
                
            } else {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.betweenShotsTimeInterval), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
                
                self.shootCount += 1
            }
            
        } else if self.type == "miner" {
            
            let bulletXSpeed: CGFloat = 1
            
            //            let bulletYSpeed: CGFloat = -4
            let bulletYSpeed: CGFloat = -2.75
            
            let xOffset: CGFloat = -Block.width * (4 / 16)
            let yOffset: CGFloat = -Block.width * (12 / 16)
            
            if self.direction == "left" {
                
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: -bulletXSpeed, ySpeed: bulletYSpeed, type: "axe"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y + yOffset, xSpeed: bulletXSpeed, ySpeed: bulletYSpeed, type: "axe"))
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "electricity" {
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "topMaker" {
            
            let xOffset: CGFloat = -Block.width * (6 / 16)
            let yOffset: CGFloat = (self.height / 2) - (Block.height / 2) - (Block.height * (4 / 16)) + (Block.height * (3 / 16))
            
            if self.direction == "left" {
                
                selectedEnemies.append(Enemy(x: self.x + xOffset, y: self.y + yOffset, type: "top", direction: self.direction))
                
            } else if self.direction == "right" {
                
                selectedEnemies.append(Enemy(x: self.x - xOffset, y: self.y + yOffset, type: "top", direction: self.direction))
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "eggMaker" {
            
            let xOffset: CGFloat = Block.width * (14 / 16)
            let yOffset: CGFloat = (self.height / 2) - (Block.height * (7 / 16))
            
            if self.direction == "left" {
                
                selectedEnemies.append(Enemy(x: self.x - xOffset, y: self.y + yOffset, type: "egg", direction: self.direction))
                
            } else if self.direction == "right" {
                
                selectedEnemies.append(Enemy(x: self.x + xOffset, y: self.y + yOffset, type: "egg", direction: self.direction))
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "top" {
            
        } else if self.type == "egg" {
            
        } else if self.type == "shooter" {
            
            //            let bulletSpeed: CGFloat = 3
            //            let bulletSpeed: CGFloat = 2.25
            let bulletSpeed: CGFloat = 1.75
            
            let xOffset: CGFloat = Block.width * (15 / 16)
            let yOffset: CGFloat = Block.width * (0 / 16)
            
            if self.direction == "left" {
                
                //                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "regular"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "smallBlue"))
                
            } else if self.direction == "right" {
                
                //                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "regular"))
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "smallBlue"))
            }
            
            if self.shootCount >= 2 {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
                
                self.shootCount = 0
                
            } else {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.betweenShotsTimeInterval), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
                
                self.shootCount += 1
            }
            
        } else if self.type == "scooper" {
            
        } else if self.type == "brickBoss" {
            
            //            let bulletSpeed: CGFloat = 3
            //            let bulletSpeed: CGFloat = 2.25
            let bulletSpeed: CGFloat = 1.75
            
            let xOffset: CGFloat = Block.width * (16 / 16)
            let yOffset: CGFloat = Block.width * (16 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
            } else {
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "bomb"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "bomb"))
                }
            }
            
            //            if self.shootCount >= 2 {
            //
            //                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            //
            //                self.shootCount = 0
            //
            //            } else {
            //
            //                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.betweenShotsTimeInterval), target: self, selector: #selector(realShoot), userInfo: nil, repeats: false)
            //
            //                self.shootCount += 1
            //            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "chemicalBoss" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            let xOffset: CGFloat = Block.width * (24 / 16)
            let yOffset: CGFloat = Block.width * (0 / 16)
            
            if self.direction == "left" {
                
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: self.direction, type: "bubble"))
                
            } else if self.direction == "right" {
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: self.direction, type: "bubble"))
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else if self.type == "fireBoss" {
            
            let bulletSpeed: CGFloat = 1.75
            
            let xOffset: CGFloat = Block.width * (16 / 16)
            let yOffset: CGFloat = Block.width * (16 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
                //                if self.direction == "left" {
                //
                //                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: -bulletSpeed, ySpeed: 0, type: "blade"))
                //
                //                } else if self.direction == "right" {
                //
                //                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, xSpeed: bulletSpeed, ySpeed: 0, type: "blade"))
                //                }
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: "upLeft", type: "blade"))
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: "downLeft", type: "blade"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: "upRight", type: "blade"))
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: "downRight", type: "blade"))
                }
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "metalBoss" {
            
            let xOffset: CGFloat = Block.width * (21 / 16)
            let yOffset: CGFloat = Block.width * (1 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
            } else {
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: self.direction, type: "bubble"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: self.direction, type: "bubble"))
                }
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "iceBoss" {
            
            let xOffset: CGFloat = Block.width * (16 / 16)
            let yOffset: CGFloat = Block.width * (4 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
            } else {
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: self.direction, type: "cutter"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: self.direction, type: "cutter"))
                }
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "snowBoss" {
            
        } else if self.type == "sandBoss" {
            
            let xOffset: CGFloat = Block.width * (17 / 16)
            let yOffset: CGFloat = Block.width * (4 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
            } else {
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, moveSpeed: 0.6, direction: self.direction, type: "tornado"))
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, moveSpeed: 1, direction: self.direction, type: "tornado"))
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, moveSpeed: 1.4, direction: self.direction, type: "tornado"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, moveSpeed: 0.6, direction: self.direction, type: "tornado"))
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, moveSpeed: 1, direction: self.direction, type: "tornado"))
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, moveSpeed: 1.4, direction: self.direction, type: "tornado"))
                }
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "skyBoss" {
            
            let xOffset: CGFloat = Block.width * (0 / 16)
            let yOffset: CGFloat = Block.width * (0 / 16)
            
            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
                
            } else {
                
                if self.direction == "left" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: self.direction, type: "shield"))
                    
                } else if self.direction == "right" {
                    
                    enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: self.direction, type: "shield"))
                }
            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            
        } else if self.type == "waterBoss" {
            
            let xOffset: CGFloat = Block.width * (17 / 16)
            let yOffset: CGFloat = Block.width * (0 / 16)
            
            //            if self.isJumping == true || (self.ySpeed != 0 && self.isFalling == false) {
            
            if self.x >= player.x {
                
                print("LEFT")
                
                // SHOOT LEFT
                
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, direction: "left", type: "magnet"))
                
            } else {
                
                print("RIGHT")
                
                // SHOOT RIGHT
                
                enemyBullets.append(EnemyBullet(x: self.x + xOffset, y: self.y - yOffset, direction: "right", type: "magnet"))
            }
            
            //self.direction = "down"
            //            }
            
            self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.totalShootTimeInterval / 2), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
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
        
        self.isShooting = false
        
        self.shootCount = 0
        
        if self.type == "turret" {
            
            self.view.animationImages = Enemy.turretLeftCloseImages as! [UIImage]
            
            self.view.animationRepeatCount = 1
            
            self.view.animationDuration = 0.15
            self.view.startAnimating()
            
        } else if self.type == "topMaker" {
            
            self.view.animationImages = Enemy.topMakerRightImages as! [UIImage]
            
            //            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.animationDuration = 0.375
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        } else if self.type == "eggMaker" {
            
            self.view.animationImages = Enemy.eggMakerLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * (1 / 3)
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "shell" {
            
            self.view.animationImages = Enemy.shellSignalRightImages as! [UIImage]
            
            self.view.animationRepeatCount = 1
            
            self.view.animationDuration = TimeInterval(self.signalTimeInterval)
            self.view.startAnimating()
            
            if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
        }
        
        if self.type == "shooter" {
            
            var offset: CGFloat = 0
            
            if self.y < screenSize.height / 2 {
                offset = 0.5
            }
            
            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval + offset), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval + offset - self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "brickBoss" {
            
            //            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "chemicalBoss" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            //            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else if self.type == "fireBoss" {
            
            //            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "metalBoss" {
            
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "iceBoss" {
            
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "skyBoss" {
            
            //            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "snowBoss" {
            
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "waterBoss" {
            
            self.direction = "down"
            
            self.jumpCount = 0
            
            //            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else if self.type == "sandBoss" {
            
            //            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            
        } else {
            
            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval - self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
        }
    }
    
    @objc func stopStun() {
        
        self.isStunned = false
        
        if self.type == "foot" {
            
            self.view.animationImages = Enemy.footImages as! [UIImage]
            //            self.view.animationImages = Enemy.footLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.15
            //            self.view.animationDuration = 0.85 * 0.15 * 3
            
            self.view.startAnimating()
            
        } else if self.type == "eye" {
            
            //            self.view.animationImages = Enemy.eyeImages as! [UIImage]
            //
            //            self.view.animationRepeatCount = 1
            //
            //            self.view.animationDuration = 0.1
            //            self.view.startAnimating()
        }
    }
    
    @objc func startRunning() {
        self.canRun = true
    }
    
    func startTimers() {
        
        if self.type != "brickBoss" && self.type != "fireBoss" && self.type != "metalBoss" && self.type != "iceBoss" && self.type != "skyBoss" && self.type != "snowBoss" && self.type != "waterBoss" && self.type != "sandBoss" && self.type != "chemicalBoss" {
            
            if self.isSprinklerInRange() == true {
                
                if self.shootTimeInterval > 0 {
                    
                    if self.shootTimer.isValid == false && self.endShootTimer.isValid == false && self.signalTimer.isValid == false {
                        
                        self.shootTimer.invalidate()
                        
                        if self.type == "miner" {
                            
                            self.shoot()
                            
                        } else if self.type == "electricity" || self.type == "turret" || self.type == "shell" || self.type == "shooter" {
                            
                            let value: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
                            
                            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval * value), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                            
                        } else {
                            
                            self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                        }
                        
                        //                    self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
                        
                        self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval - self.signalTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
                    }
                }
                
            }
        }
        
        if self.type == "eye" {
            
            if self.endStunTimer.isValid == false {
                
                self.endStunTimer.invalidate()
                
                //                self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
                
                let value: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
                
                self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.stunTimeInterval * value), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "jumper" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "brickBoss" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
            //            if self.shootTimer.isValid == false {
            //
            //                self.shootTimer.invalidate()
            //
            //                self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            //            }
            
        } else if self.type == "chemicalBoss" {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
            //            if self.shootTimer.isValid == false {
            //
            //                self.shootTimer.invalidate()
            //
            //                self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.shootTimeInterval), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            //            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        } else if self.type == "fireBoss" {
            
            //            if self.signalTimer.isValid == false {
            //
            //                self.signalTimer.invalidate()
            //
            //                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.jumpTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            //            }
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(startRunning), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "metalBoss" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "iceBoss" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "skyBoss" {
            
            //            if self.signalTimer.isValid == false {
            //
            //                self.signalTimer.invalidate()
            //
            //                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            //            }
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(startRunning), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "snowBoss" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "waterBoss" {
            
            //            if self.signalTimer.isValid == false {
            //
            //                self.signalTimer.invalidate()
            //
            //                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            //            }
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(startRunning), userInfo: nil, repeats: false)
            }
            
        } else if self.type == "sandBoss" {
            
            if self.signalTimer.isValid == false {
                
                self.signalTimer.invalidate()
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Enemy.bossStartTimeInterval), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
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
    
    func didHitOwnBullet() -> Int {
        
        for i in 0 ..< enemyBullets.count {
            
            if enemyBullets[i].type == "cutter" &&  enemyBullets[i].didReachGoal == true {
                
                if enemyBullets[i].x + (enemyBullets[i].width / 2) >= self.x - (self.width / 2) && enemyBullets[i].x - (enemyBullets[i].width / 2) <= self.x + (enemyBullets[i].width / 2) && enemyBullets[i].y + (enemyBullets[i].height / 2) >= self.y - (self.height / 2) && enemyBullets[i].y - (enemyBullets[i].height / 2) <= self.y + (self.height / 2) {
                    return i
                }
                
            }
        }
        
        return -1
    }
    
    func handlePause() {
        
        self.timerFireTimes["shootTimer"] = getTimerFireTime(timer: self.shootTimer)
        self.timerFireTimes["endShootTimer"] = getTimerFireTime(timer: self.endShootTimer)
        self.timerFireTimes["signalTimer"] = getTimerFireTime(timer: self.signalTimer)
        self.timerFireTimes["endStunTimer"] = getTimerFireTime(timer: self.endStunTimer)
        self.timerFireTimes["endHitTimer"] = getTimerFireTime(timer: self.endHitTimer)
        self.timerFireTimes["jumpTimer"] = getTimerFireTime(timer: self.jumpTimer)
        
        self.shootTimer.invalidate()
        self.endShootTimer.invalidate()
        self.signalTimer.invalidate()
        self.endStunTimer.invalidate()
        self.endHitTimer.invalidate()
        self.jumpTimer.invalidate()
    }
    
    func handleResume() {
        
        if let fireTime = self.timerFireTimes["shootTimer"] {
            
            if fireTime >= 0 {
                
                self.shootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(shoot), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["endShootTimer"] {
            
            if fireTime >= 0 {
                
                self.endShootTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(stopShoot), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["signalTimer"] {
            
            if fireTime >= 0 {
                
                self.signalTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(signal), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["endStunTimer"] {
            
            if fireTime >= 0 {
                
                self.endStunTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(stopStun), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["endHitTimer"] {
            
            if fireTime >= 0 {
                
                self.endHitTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(stopHit), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["jumpTimer"] {
            
            if fireTime >= 0 {
                
                self.jumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(jump), userInfo: nil, repeats: false)
            }
        }
        
    }
    
}
