//
//  Bullet.swift
//  downbeat
//
//  Created by Collin Howard on 11/19/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Bullet {
    
    // CONSTANTS
    
    static let color: UIColor = UIColor.clear
    //    static let color: UIColor = UIColor.red
    
    static let regularImage = UIImage(named: "regularBulletRight")
    
    static let cutterRightImages = [UIImage(named: "cutterBulletUp"), UIImage(named: "cutterBulletRight"), UIImage(named: "cutterBulletDown"), UIImage(named: "cutterBulletLeft")]
    
    static let bladeImages = [UIImage(named: "bladeBullet1"), UIImage(named: "bladeBullet2")]
    
    static let beamRightImages = [UIImage(named: "beamBulletRight1"), UIImage(named: "beamBulletRight2")]
    
    //    static let magnetLeftImage = UIImage(named: "magnetBulletLeft")
    static let magnetLeftImages = [UIImage(named: "magnetBulletLeft1"), UIImage(named: "magnetBulletLeft2")]
    
//    static let shieldImages = [UIImage(named: "shieldBullet1"), UIImage(named: "shieldBullet2"), UIImage(named: "shieldBullet3")]
    static let shieldRightImages = [UIImage(named: "shieldBulletRight1"), UIImage(named: "shieldBulletRight2"), UIImage(named: "shieldBulletRight3"), UIImage(named: "shieldBulletRight4")]

    static let tornadoRightImages = [UIImage(named: "tornadoBulletRight1"), UIImage(named: "tornadoBulletRight2"), UIImage(named: "tornadoBulletRight3")]
    
    //    static let bubbleImages = [UIImage(named: "bubbleBullet1"), UIImage(named: "bubbleBullet2")]
    static let bubbleRightImages = [UIImage(named: "bubbleBulletRight1"), UIImage(named: "bubbleBulletRight2"), UIImage(named: "bubbleBulletRight3"), UIImage(named: "bubbleBulletRight4"), UIImage(named: "bubbleBulletRight5"), UIImage(named: "bubbleBulletRight6"), UIImage(named: "bubbleBulletRight7"), UIImage(named: "bubbleBulletRight8")]
    
    static let bombImage = UIImage(named: "bombBullet")
    
    // VARIABLES
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var moveSpeed: CGFloat = 0
    
    var damage: Int = 0
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var type: String = ""
    
    var direction: String = ""
    
    var xGoal: CGFloat = 0
    
    var didReachGoal: Bool = false
    
    var shouldRemove: Bool = false
    
    var useEnergyTimeInterval: CGFloat = 0
    
    var ySpeedChange: CGFloat = 0
    
    var maxFallSpeed: CGFloat = 0
    
    var isRising: Bool = false
    var isFalling: Bool = false
    
    var isJumping: Bool = false
    
    var removeTimer = Timer()
    
    var useEnergyTimer = Timer()
    
    var removeTimeInterval: CGFloat = 0
    
    var enemiesHit: [AnyObject] = []
    
    var timerFireTimes = [String : CGFloat]()
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, moveSpeed: CGFloat, direction: String, type: String) {
        
        self.moveSpeed = moveSpeed
        
        setup(x: x, y: y, direction: direction, type: type)
    }
    
    init(x: CGFloat, y: CGFloat, direction: String, type: String) {
        
        setup(x: x, y: y, direction: direction, type: type)
    }
    
    func setup(x: CGFloat, y: CGFloat, direction: String, type: String) {
        
        self.direction = direction
        
        self.type = type
        
        if self.type == "regular" {
            
            self.width = Block.width * (8 / 16)
            self.height = Block.height * (6 / 16)
            
            self.moveSpeed = 4.5
            
            self.damage = 1
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
        } else if self.type == "cutter" {
            
            //            self.width = Block.width * (9 / 16)
            //            self.height = self.width
            
            self.width = Block.width * (7 / 16)
            self.height = self.width
            
            //            self.moveSpeed = 2
            //
            //            self.damage = 3
            
            self.moveSpeed = 3
            
            self.damage = 1
            
            if self.direction == "left" {
                
                self.xGoal = x - (Block.width * 4)
                
            } else if self.direction == "right" {
                
                self.xGoal = x + (Block.width * 4)
            }
            
            self.xSpeed = self.moveSpeed
            self.ySpeed = self.moveSpeed * 0.2
            
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
            
        } else if self.type == "beam" {
            
            self.width = Block.width
            self.height = Block.height * (6 / 16)
            
            self.removeTimeInterval = 2
            
        } else if self.type == "magnet" {
            
            //            self.width = Block.width
            //            self.height = Block.height * (12 / 16)
            
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 3
            
            self.damage = 1
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
        } else if self.type == "shield" {
            
            self.width = Block.width * (48 / 16)
            self.height = self.width
            
            self.moveSpeed = 3
            
            self.damage = 1
            
            self.useEnergyTimeInterval = 0.75
            
            self.useEnergyTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.useEnergyTimeInterval), target: self, selector: #selector(useEnergy), userInfo: nil, repeats: true)
            
        } else if self.type == "tornado" {
            
            //            self.width = Block.width * (15 / 16)
            //            self.height = Block.height
            
            self.width = Block.width
            self.height = self.width
            
            self.damage = 1
            
            self.ySpeedChange = 0.03
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
        } else if self.type == "bubble" {
            
            self.width = Block.width
            self.height = self.width
            
            //            self.moveSpeed = 0.875
            self.moveSpeed = 1.75
            
            self.damage = 2
            
            self.ySpeedChange = 0.15
            self.maxFallSpeed = 4
            
            //            self.removeTimeInterval = 2
            self.removeTimeInterval = 3
            
            self.isFalling = true
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
        } else if self.type == "bomb" {
            
            //            self.width = Block.width * (14 / 16)
            //            self.height = self.width
            self.width = Block.width
            self.height = self.width
            
            self.moveSpeed = 1.75
            
            self.damage = 3
            
            self.ySpeedChange = 0.135
            self.maxFallSpeed = 4
            
            //            self.removeTimeInterval = 1
            self.removeTimeInterval = 0
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
            self.jump()
        }
        
        self.setXY(x: x, y: y)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = Bullet.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()
        
        if self.type == "regular" {
            
            self.view.image = Bullet.regularImage
            
            //            if self.direction == "left" {
            //
            //                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            //
            //            } else if self.direction == "right" {
            //
            //                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            //            }
            
        } else if self.type == "cutter" {
            
            self.view.animationImages = Bullet.cutterRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.6875
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "blade" {
            
            self.view.animationImages = Bullet.bladeImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.215
            
            self.view.startAnimating()
            
        } else if self.type == "beam" {
            
            self.view.animationImages = Bullet.beamRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.215
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.setXY(x: self.x - (self.width / 2), y: self.y)
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.setXY(x: self.x + (self.width / 2), y: self.y)
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
            
        } else if self.type == "magnet" {
            
            //            self.view.image = Bullet.magnetLeftImage
            
            self.view.animationImages = Bullet.magnetLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.215
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "shield" {
            
            self.view.animationImages = Bullet.shieldRightImages as! [UIImage]
            
//            self.view.animationDuration = 0.85 * 0.6875
            self.view.animationDuration = 0.85 * 0.6875 * (4 / 3) * 0.5

            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "tornado" {
            
            self.view.animationImages = Bullet.tornadoRightImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.6875 * 0.5
            
            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "bubble" {
            
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
            
        } else if self.type == "bomb" {
            
            self.view.image = Bullet.bombImage
        }
        
        self.updateSpeeds()
    }
    
    func updateSpeeds() {
        
        self.moveSpeed = newVal(oldVal: self.moveSpeed)
//        self.ySpeedChange = newVal(oldVal: self.ySpeedChange)
        self.maxFallSpeed = newVal(oldVal: self.maxFallSpeed)
        self.xSpeed = newVal(oldVal: self.xSpeed)
        self.ySpeed = newVal(oldVal: self.ySpeed)
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - (self.width / 2)
        self.view.frame.origin.y = self.y - (self.height / 2)
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) && self.y + (self.height / 2) >= 0 && self.y - (self.height / 2) <= screenSize.height {
            return true
        }
        
        return false
    }
    
    func canHitEnemy(enemy: Enemy) -> Bool {
        
        return !isMatch(object: enemy, objectArray: self.enemiesHit)
    }
    
    func addHitEnemy(enemy: Enemy) {
        self.enemiesHit.append(enemy)
    }
    
    func move() {
        
        if self.type == "regular" {
            
            setXY(x: self.x + self.xSpeed, y: self.y)
            
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
                
                if self.x < player.x {
                    
                    setXY(x: self.x + (self.xSpeed * 1.375), y: self.y)
                    
                } else if self.x > player.x {
                    
                    setXY(x: self.x - (self.xSpeed * 1.375), y: self.y)
                    
                }
                
                if self.y < player.y {
                    
                    setXY(x: self.x, y: self.y + (self.ySpeed * 1.375))
                    
                } else if self.y > player.y {
                    
                    setXY(x: self.x, y: self.y - (self.ySpeed * 1.375))
                }
            }
            
        } else if self.type == "blade" {
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
            
        } else if self.type == "beam" {
            
        } else if self.type == "magnet" {
            
            if self.didReachGoal == false {
                
                for enemy in selectedEnemies {
                    
                    if abs(enemy.x - self.x) <= abs(self.xSpeed) + abs(enemy.xSpeed) {
                        
                        self.didReachGoal = true
                        
                        self.xSpeed = 0
                        
                        if enemy.y < self.y {
                            
                            self.ySpeed = -self.moveSpeed
                            
                        } else {
                            
                            self.ySpeed = self.moveSpeed
                        }
                    }
                    
                }
            }
            
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
            
            setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
            
        } else if self.type == "shield" {
            
            self.ySpeed = 0
            
            if self.didReachGoal == true {
                
                self.xSpeed = self.moveSpeed
                
                if self.direction == "left" {
                    
                    self.xSpeed = -self.xSpeed
                    
                    self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                    
                } else if self.direction == "right" {
                    
                    self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                
                setXY(x: self.x + self.xSpeed, y: self.y)
                
            } else {
                
                self.xSpeed = 0
                
                setXY(x: player.x, y: player.y)
            }
            
        } else if self.type == "tornado" {
            
            self.ySpeed -= self.ySpeedChange
            
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
            
            //            if self.xSpeed != 0 {
            
            for block in selectedBlocks {
                
                if block.isHidden == false {
                    
                    if block.isLadder == false && block.isTopLadder == false {
                        
                        //                        if self.direction == "right" {
                        
                        if self.x + (self.width / 2) + self.moveSpeed < block.x + (Block.width / 2) && self.x + (self.width / 2) + self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
                            self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.removeTimeInterval), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
                            
                            setXY(x: block.x - (Block.width / 2) - (self.width / 2) - self.moveSpeed, y: self.y)
                        }
                        
                        //                        } else if self.direction == "left" {
                        
                        if self.x - (self.width / 2) - self.moveSpeed < block.x + (Block.width / 2) && self.x - (self.width / 2) - self.moveSpeed > block.x - (Block.width / 2) && ((self.y + (self.height / 2) <= block.y + (Block.height / 2) && self.y + (self.height / 2) > block.y - (Block.height / 2)) || (self.y - (self.height / 2) < block.y + (Block.height / 2) && self.y - (self.height / 2) >= block.y - (Block.height / 2))) {
                            
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
        }
    }
    
    @objc func useEnergy() {
        
        if player.energyPos >= 0 {
            
            if player.energies[player.energyPos] >= player.energyCosts[player.energyPos] {
                
                player.energies[player.energyPos] -= player.energyCosts[player.energyPos]
                
                player.energyBar.setEnergy(energy: player.energies[player.energyPos])
                
            } else {
                
                bullets.removeAll()
                
                self.useEnergyTimer.invalidate()
            }
        }
        
        if self.useEnergyTimer.timeInterval != TimeInterval(self.useEnergyTimeInterval) {
            
            self.useEnergyTimer.invalidate()
            
            self.useEnergyTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.useEnergyTimeInterval), target: self, selector: #selector(useEnergy), userInfo: nil, repeats: true)
        }
    }
    
    func handlePause() {
        
        self.timerFireTimes["removeTimer"] = getTimerFireTime(timer: self.removeTimer)
        self.timerFireTimes["useEnergyTimer"] = getTimerFireTime(timer: self.useEnergyTimer)
        
        self.removeTimer.invalidate()
        self.useEnergyTimer.invalidate()
    }
    
    func handleResume() {
        
        if let fireTime = self.timerFireTimes["removeTimer"] {
            
            if fireTime >= 0 {
                
                self.removeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(makeRemovable), userInfo: nil, repeats: false)
            }
        }
        
        if let fireTime = self.timerFireTimes["useEnergyTimer"] {
            
            if fireTime >= 0 {
                
                //          self.useEnergyTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.useEnergyTimeInterval), target: self, selector: #selector(useEnergy), userInfo: nil, repeats: true)
                self.useEnergyTimer = Timer.scheduledTimer(timeInterval: TimeInterval(fireTime), target: self, selector: #selector(useEnergy), userInfo: nil, repeats: true)
                
                //            shouldRepeat
            }
        }
        
    }
    
    func jump() {
        
        self.isJumping = true
        self.isRising = true
        
        //        if self.direction == "right" {
        //
        //            self.xSpeed = self.moveSpeed
        //
        //        } else if self.direction == "left" {
        //
        //            self.xSpeed = -self.moveSpeed
        //        }
        
        self.ySpeed = -self.maxFallSpeed
    }
    
    @objc func makeRemovable() {
        self.shouldRemove = true
    }
}
