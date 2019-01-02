//
//  EnemyBullet.swift
//  downbeat
//
//  Created by Collin Howard on 11/21/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class EnemyBullet {
    
    // CONSTANTS
    
    static let color: UIColor = UIColor.clear
//    static let color: UIColor = UIColor.red
    
    static let smallRegularImage = UIImage(named: "smallRegularEnemyBullet")
    
//    static let mediumRegularImage = UIImage(named: "mediumRegularEnemyBullet")
    static let mediumRegularImage = UIImage(named: "mediumRegularEnemyBullet2")

//    static let dropHeadImage = UIImage(named: "dropHeadEnemyBullet")
    static let dropHeadImage = UIImage(named: "dropHeadEnemyBulletOther")

    static let smallOrangeImage = UIImage(named: "smallOrangeEnemyBullet")
    
//    static let smallBlueImage = UIImage(named: "smallBlueEnemyBullet")
    
    static let smallBlueImages = [UIImage(named: "smallBlueEnemyBullet1"), UIImage(named: "smallBlueEnemyBullet2"), UIImage(named: "smallBlueEnemyBullet3")]
    
//    static let axeLeftImages = [UIImage(named: "axeEnemyBulletUp"), UIImage(named: "axeEnemyBulletLeft"), UIImage(named: "axeEnemyBulletDown"), UIImage(named: "axeEnemyBulletRight")]
    static let axeRightImages = [UIImage(named: "axeEnemyBullet1"), UIImage(named: "axeEnemyBullet2"), UIImage(named: "axeEnemyBullet3"), UIImage(named: "axeEnemyBullet4")]

    static let regularRightImage = UIImage(named: "regularEnemyBulletRight")

    static let specialImages = [UIImage(named: "specialEnemyBullet1"), UIImage(named: "specialEnemyBullet2"), UIImage(named: "specialEnemyBullet3"), UIImage(named: "specialEnemyBullet4")]

    static let cutterRightImages = [UIImage(named: "cutterBulletUp"), UIImage(named: "cutterBulletRight"), UIImage(named: "cutterBulletDown"), UIImage(named: "cutterBulletLeft")]
    
    static let bladeImages = [UIImage(named: "bladeBullet1"), UIImage(named: "bladeBullet2")]
   
    static let bubbleRightImages = [UIImage(named: "bubbleBulletRight1"), UIImage(named: "bubbleBulletRight2"), UIImage(named: "bubbleBulletRight3"), UIImage(named: "bubbleBulletRight4"), UIImage(named: "bubbleBulletRight5"), UIImage(named: "bubbleBulletRight6"), UIImage(named: "bubbleBulletRight7"), UIImage(named: "bubbleBulletRight8")]
    
    static let bombImage = UIImage(named: "bombBullet")

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var type: String = ""
    
    var width: CGFloat = 0
    var height: CGFloat = 0

    var damage: Int = 0
    
    var xSpeedChange: CGFloat = 0
    var ySpeedChange: CGFloat = 0
    
    var maxFallSpeed: CGFloat = 0
    var minMoveSpeed: CGFloat = 0

    var isJumping: Bool = false
    var isFalling: Bool = false
    var isRising: Bool = false
    
    var removeTimeInterval: CGFloat = 0
    
    var removeTimer = Timer()

    var shouldRemove: Bool = false
    
    var direction: String = ""
    
    var xGoal: CGFloat = 0

    var moveSpeed: CGFloat = 0

    var didReachGoal: Bool = false
    
    var timerFireTimes = [String : CGFloat]()

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, targetX: CGFloat, targetY: CGFloat, speed: CGFloat, type: String) {
        
        var newXSpeed: CGFloat = 0
        var newYSpeed: CGFloat = 0
        
        let xDist = targetX
        var yDist = targetY
        
        if yDist == 0 {
            yDist = 0.0001
        }
        
        let ratio = xDist / yDist
        let newDist = speed
        
        var holder = (ratio * ratio) + 1
        
        if holder == 0 {
            holder = 0.0001
        }
        
        var newY = sqrt((newDist * newDist) / holder)
        var newX = ratio * newY
        
        if yDist < 0 {
            newY = -newY
        }
        
        if xDist < 0 {
            newX = -newX
        }
        
        if (yDist > 0 && xDist < 0) || (yDist < 0 && xDist > 0) {
            newX = -newX
        }
        
        newXSpeed = newX
        newYSpeed = newY
        
        setup(x: x, y: y, xSpeed: newXSpeed, ySpeed: newYSpeed, type: type)
    }
    
    init(x: CGFloat, y: CGFloat, xSpeed: CGFloat, ySpeed: CGFloat, type: String) {
        
        setup(x: x, y: y, xSpeed: xSpeed, ySpeed: ySpeed, type: type)
    }
    
    init(x: CGFloat, y: CGFloat, direction: String, type: String) {
        
        self.direction = direction
        
        setup(x: x, y: y, xSpeed: 0, ySpeed: 0, type: type)
    }
    
    init(x: CGFloat, y: CGFloat, target: String, speed: CGFloat, type: String) {
        
        var newXSpeed: CGFloat = 0
        var newYSpeed: CGFloat = 0
        
        if target == "player" {
            
            let xDist = x - player.x
            var yDist = y - player.y
            
            if yDist == 0 {
                yDist = 0.0001
            }
            
            let ratio = xDist / yDist
            let newDist = speed

            var holder = (ratio * ratio) + 1
            
            if holder == 0 {
                holder = 0.0001
            }
            
            var newY = sqrt((newDist * newDist) / holder)
            var newX = ratio * newY
            
            if yDist < 0 {
                newY = -newY
            }
            
            if xDist < 0 {
                newX = -newX
            }
            
            if (yDist > 0 && xDist < 0) || (yDist < 0 && xDist > 0) {
                newX = -newX
            }
            
            newXSpeed = -newX
            newYSpeed = -newY
        }
        
        setup(x: x, y: y, xSpeed: newXSpeed, ySpeed: newYSpeed, type: type)
    }
    
    func setup(x: CGFloat, y: CGFloat, xSpeed: CGFloat, ySpeed: CGFloat, type: String) {
        
        self.type = type
        
        self.view.stopAnimating()
        
        if self.type == "smallRegular" {
           
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.smallRegularImage
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "mediumRegular" {
            
            self.width = Block.width * (8 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.mediumRegularImage
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "dropHead" {
            
//            self.width = Block.width * (14 / 16)
//            self.height = Block.height
            self.width = Block.width
            self.height = self.width
            
            self.damage = 3
            
            self.view.image = EnemyBullet.dropHeadImage
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "smallOrange" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.smallOrangeImage
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "smallBlue" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
//            self.view.image = EnemyBullet.smallBlueImage
            
            self.view.animationImages = EnemyBullet.smallBlueImages as! [UIImage]
            
//            self.view.animationDuration = 0.85 * 0.5 * (3 / 4)
            self.view.animationDuration = 0.85 * 0.5 * 0.5125

            self.view.startAnimating()
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "axe" {
            
//            self.width = Block.width * (12 / 16)
//            self.height = self.width
            self.width = Block.width * (11 / 16)
            self.height = self.width
            
            self.damage = 3
            
            self.xSpeedChange = 0.0075

            if xSpeed >= 0 {
                self.xSpeedChange = -self.xSpeedChange
            }

//            self.ySpeedChange = -0.085
            self.ySpeedChange = -0.065

//            self.maxFallSpeed = 3
            self.maxFallSpeed = 2

            self.minMoveSpeed = 0

            self.view.animationImages = EnemyBullet.axeRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.5
//            self.view.animationDuration = 0.85 * 0.375
            
            self.view.startAnimating()
            
            if xSpeed >= 0 {

                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)

            } else {

                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        } else if self.type == "regular" {
            
            self.width = Block.width * (8 / 16)
            self.height = Block.height * (6 / 16)
            
            self.damage = 1
            
            self.view.image = EnemyBullet.regularRightImage
            
            if xSpeed >= 0 {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            } else {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)
            
        } else if self.type == "bomb" {
            
            self.width = Block.width
            self.height = self.width
            
            self.damage = 3
            
            self.view.image = EnemyBullet.bombImage

            self.ySpeedChange = 0.135
            self.maxFallSpeed = 4
//            self.ySpeedChange = 0.1
//            self.maxFallSpeed = 4
            
            //            self.removeTimeInterval = 1
            self.removeTimeInterval = 0

//            self.jump()
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)
            
        } else if self.type == "blade" {

            self.width = Block.width * (16 / 16)
            self.height = self.width
            
            self.moveSpeed = 2
            
            self.damage = 2
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
                
            } else if self.direction == "upLeft" {
                
                self.xSpeed = -self.moveSpeed
                self.ySpeed = -self.moveSpeed
                
            } else if self.direction == "upRight" {
                
                self.xSpeed = self.moveSpeed
                self.ySpeed = -self.moveSpeed
                
            } else if self.direction == "downLeft" {
                
                self.xSpeed = -self.moveSpeed
                self.ySpeed = self.moveSpeed
                
            } else if self.direction == "downRight" {
                
                self.xSpeed = self.moveSpeed
                self.ySpeed = self.moveSpeed
            }
            
            self.view.animationImages = Bullet.bladeImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.215
            
            self.view.startAnimating()
            
        } else if self.type == "bubble" {
            
            self.width = Block.width
            self.height = self.width
            
            //            self.moveSpeed = 0.875
            self.moveSpeed = 1.75
            
            self.damage = 2
            
            self.ySpeedChange = 0.15
            self.maxFallSpeed = 4
            
            self.removeTimeInterval = 2
//            self.removeTimeInterval = 3
            
            self.isFalling = true
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
            self.view.animationImages = Bullet.bubbleRightImages as! [UIImage]
            
            //            self.view.animationDuration = 0.85 * 0.6875
            self.view.animationDuration = 0.85 * 0.6875 * 1
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
            
        } else if self.type == "cutter" {

            self.width = Block.width * (7 / 16)
            self.height = self.width
            
            self.moveSpeed = 3
            
            self.damage = 1
            
            if self.direction == "left" {
                
                self.xGoal = x - (Block.width * 4)
                
            } else if self.direction == "right" {
                
                self.xGoal = x + (Block.width * 4)
            }
            
            self.xSpeed = self.moveSpeed
            self.ySpeed = self.moveSpeed * 0.2
            
            self.view.animationImages = Bullet.cutterRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.6875
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "special" {
            
            self.width = Block.width
            self.height = self.width
            
            self.damage = 3

            self.view.animationImages = EnemyBullet.specialImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.5

            self.view.startAnimating()
            
            self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)
        }
        
        self.setXY(x: x, y: y)
//        self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        self.view.frame.origin.x = self.x - (self.width / 2)
        self.view.frame.origin.y = self.y - (self.height / 2)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = EnemyBullet.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
//        if self.type == "axe" {
//
//            if self.xSpeed >= 0 {
//
//                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
//
//            } else {
//
//                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
//            }
//
//        } else {
//
//            if self.xSpeed <= 0 {
//
//                if self.ySpeed <= 0 {
//
//                    self.view.transform = CGAffineTransform(scaleX: -1, y: -1)
//
//                } else {
//
//                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
//                }
//
//            } else {
//
//                if self.ySpeed <= 0 {
//
//                    self.view.transform = CGAffineTransform(scaleX: 1, y: -1)
//
//                } else {
//
//                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
//                }
//            }
//
//        }
        
        if self.type == "bomb" {
            self.jump()
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - (self.width / 2)
        self.view.frame.origin.y = self.y - (self.height / 2)
    }
    
    func setXYSpeed(xSpeed: CGFloat, ySpeed: CGFloat) {
        
        self.xSpeed = xSpeed
        self.ySpeed = ySpeed
    }
    
    func isInBounds() -> Bool {
        
        if self.type == "axe" {
            
            if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
                return true
            }
            
        } else {
            
            if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) && self.y - (self.height / 2) <= screenSize.height && self.y + (self.height / 2) >= 0 {
                return true
            }
        }
        
        return false
    }
    
    func move() {
        
        if self.type == "axe" {
            
//            setXYSpeed(xSpeed: self.xSpeed - self.xSpeedChange, ySpeed: self.ySpeed - self.ySpeedChange)
            setXYSpeed(xSpeed: self.xSpeed, ySpeed: self.ySpeed - self.ySpeedChange)

//            if self.ySpeed >= self.maxFallSpeed {
//
//                setXYSpeed(xSpeed: self.xSpeed, ySpeed: self.maxFallSpeed)
//            }
//
//            if abs(self.xSpeed) <= abs(self.minMoveSpeed) {
//
//                var newSpeed = self.minMoveSpeed
//
//                if xSpeed < 0 {
//                    newSpeed = -newSpeed
//                }
//
//                setXYSpeed(xSpeed: newSpeed, ySpeed: self.ySpeed)
//            }
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
            
        } else if self.type == "bomb" {
            
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
            
            let moveSpeed: CGFloat = abs(self.xSpeed)
            
            //            if self.xSpeed != 0 {
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        //                        if self.direction == "right" {
                        
                        if self.x + (self.width / 2) + moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - moveSpeed, y: self.y)
                        }
                        
                        //                        } else if self.direction == "left" {
                        
                        if self.x - (self.width / 2) - moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                            
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
                                
                                self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                                
                                setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                            }
                            
                        } else if block.isLadder == false {
                            
                            if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                                
                                self.isJumping = false
                                self.isFalling = false
                                
                                self.xSpeed = 0
                                self.ySpeed = 0
                                
                                self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                                
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
                                
                                self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                                
                                setXY(x: self.x, y: block.y + (Block.height / 2) + (self.height / 2))
                            }
                        }
                        
                    }
                    
                }
            }
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)

        } else if self.type == "blade" {
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
            
        } else if self.type == "bubble" {
            
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
            
            if self.xSpeed <= 0 {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)

        } else if self.type == "cutter" {
            
            if self.direction == "left" {
                
                if self.x <= self.xGoal {
                    
                    if self.didReachGoal == false {
                        
                        self.didReachGoal = true
                        
                        self.view.animationDuration = 0.85 * 0.5
                        
                        self.view.startAnimating()
                    }
                }
                
            } else if self.direction == "right" {
                
                if self.x >= self.xGoal {
                    
                    if self.didReachGoal == false {
                        
                        self.didReachGoal = true
                        
                        self.view.animationDuration = 0.85 * 0.5
                        
                        self.view.startAnimating()
                    }
                }
                
            }
            
            if self.didReachGoal == false {
                
                if self.direction == "left" {
                    
                    if self.x <= self.xGoal + (Block.width * 2) {
                        
                        setXY(x: self.x - self.xSpeed, y: self.y + self.ySpeed)
                        
                    } else {
                        
                        setXY(x: self.x - self.xSpeed, y: self.y - self.ySpeed)
                    }
                    
                } else if self.direction == "right" {
                    
                    if self.x >= self.xGoal - (Block.width * 2) {
                        
                        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
                        
                    } else {
                        
                        setXY(x: self.x + self.xSpeed, y: self.y - self.ySpeed)
                    }
                }
                
            } else {
                
                if self.x < selectedEnemies[0].x {
                    
                    setXY(x: self.x + (self.xSpeed * 1.375), y: self.y)
                    
                } else if self.x > selectedEnemies[0].x {
                    
                    setXY(x: self.x - (self.xSpeed * 1.375), y: self.y)
                    
                }
                
                if self.y < selectedEnemies[0].y {
                    
                    setXY(x: self.x, y: self.y + (self.ySpeed * 1.375))
                    
                } else if self.y > selectedEnemies[0].y {
                    
                    setXY(x: self.x, y: self.y - (self.ySpeed * 1.375))
                }
            }
            
        } else {
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
        }
    }
    
    func jump() {
        
        self.isJumping = true
        self.isRising = true

        self.ySpeed = -self.maxFallSpeed
    }
    
    @objc func makeRemovable() {
        self.shouldRemove = true
    }
    
    func handlePause() {
        
        self.timerFireTimes["removeTimer"] = getTimerFireTime(timer: self.removeTimer)
        
        self.removeTimer.invalidate()
    }
    
    func handleResume() {
        
        if let fireTime = self.timerFireTimes["removeTimer"] {
            
            if fireTime >= 0 {
                
                self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
            }
        }
        
    }
    
}
