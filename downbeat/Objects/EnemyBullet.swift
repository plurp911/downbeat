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
    
    static let mediumRegularImage = UIImage(named: "mediumRegularEnemyBullet")
    
    static let dropHeadImage = UIImage(named: "dropHeadEnemyBullet")

    static let smallOrangeImage = UIImage(named: "smallOrangeEnemyBullet")
    static let smallBlueImage = UIImage(named: "smallBlueEnemyBullet")
    
    static let axeLeftImages = [UIImage(named: "axeEnemyBulletUp"), UIImage(named: "axeEnemyBulletLeft"), UIImage(named: "axeEnemyBulletDown"), UIImage(named: "axeEnemyBulletRight")]

    static let regularRightImage = UIImage(named: "regularEnemyBulletRight")

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
            
        } else if self.type == "mediumRegular" {
            
            self.width = Block.width * (8 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.mediumRegularImage
            
        } else if self.type == "dropHead" {
            
            self.width = Block.width * (14 / 16)
            self.height = Block.height
            
            self.damage = 3
            
            self.view.image = EnemyBullet.dropHeadImage
            
        } else if self.type == "smallOrange" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.smallOrangeImage
            
        } else if self.type == "smallBlue" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.smallBlueImage
            
        } else if self.type == "axe" {
            
            self.width = Block.width * (12 / 16)
            self.height = self.width
            
            self.damage = 3
            
            self.xSpeedChange = 0.0075

            if self.xSpeed >= 0 {
                self.xSpeedChange = -self.xSpeedChange
            }

            self.ySpeedChange = -0.085

            self.maxFallSpeed = 3
            self.minMoveSpeed = 0

            self.view.animationImages = EnemyBullet.axeLeftImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.5
//            self.view.animationDuration = 0.85 * 0.375
            self.view.startAnimating()
            
            if self.xSpeed >= 0 {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "regular" {
            
            self.width = Block.width * (8 / 16)
            self.height = Block.height * (6 / 16)
            
            self.damage = 1
            
            self.view.image = EnemyBullet.regularRightImage
        }
        
        self.setXY(x: x, y: y)
        self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        self.view.frame.origin.x = self.x - (self.width / 2)
        self.view.frame.origin.y = self.y - (self.height / 2)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = EnemyBullet.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.xSpeed <= 0 {

            if self.ySpeed <= 0 {

                self.view.transform = CGAffineTransform(scaleX: -1, y: -1)

            } else {

                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
            }

        } else {

            if self.ySpeed <= 0 {

                self.view.transform = CGAffineTransform(scaleX: 1, y: -1)

            } else {

                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
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
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) && self.y - (self.height / 2) <= screenSize.height && self.y + (self.height / 2) >= 0 {
            return true
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
        }
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
}
