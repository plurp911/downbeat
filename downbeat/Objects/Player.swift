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
    
    static let maxHealth: CGFloat = 100
    
    static let width: CGFloat = Block.width * 0.78
    static let height: CGFloat = Block.height * 1.6
    
    static let maxFallSpeed: CGFloat = 3.5
    
    static let maxMoveSpeed: CGFloat = 1
    
    static let ySpeedChange: CGFloat = 0.095

//    static let color: UIColor = UIColor.lightGray
    static let color: UIColor = UIColor.clear

    static let hitBoxColor: UIColor = UIColor.red.withAlphaComponent(0.5)

    static let runRightImages = [Player.scale(image: UIImage(named: "playerRunRight1")!), Player.scale(image: UIImage(named: "playerRunRight2")!), Player.scale(image: UIImage(named: "playerRunRight3")!), Player.scale(image: UIImage(named: "playerRunRight2")!)]
    
    static let jumpRightImage = Player.scale(image: UIImage(named: "playerJumpRight")!)
    
    static let xShift: CGFloat = Block.width * 0.105
    static let yShift: CGFloat = Block.height * 0.4

    // VARIABLES

    var x: CGFloat = 0
    var y: CGFloat = 0
    
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

    var health: CGFloat = 0
    
    var direction: String = "right"
    
    var view: UIImageView = UIImageView()
    var hitBox: UIView = UIView()

    init() {
        
        self.health = Player.maxHealth
        
        setXY(x: self.x, y: self.y)
    
        self.view.frame.size.width = Player.width
        self.view.frame.size.height = Player.height
        
        self.view.backgroundColor = Player.color

//        self.view.contentMode = .scaleAspectFill
        self.view.contentMode = .bottom
        
//        self.view.clipsToBounds = true
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.hitBox.backgroundColor = Player.hitBoxColor
        
        self.hitBox.frame.size.width = Player.width
        self.hitBox.frame.size.height = Player.height
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        if self.direction == "left" {
            self.view.frame.origin.x = self.x - Player.width / 2 + Player.xShift
        } else if self.direction == "right" {
            self.view.frame.origin.x = self.x - Player.width / 2 - Player.xShift
        }
        
        self.view.frame.origin.y = self.y - Player.height / 2 + Player.yShift
        
        self.hitBox.frame.origin.x = self.x - Player.width / 2
        self.hitBox.frame.origin.y = self.y - Player.height / 2
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

        self.setXY(x: currentStage.playerStartX, y: currentStage.playerStartY)

        self.isFalling = true
        
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
        
        self.health = Player.maxHealth
        
        self.direction = "right"
    }
    
    func move(direction: String) {
        
        self.direction = direction
        
        if self.direction == "left" {
            
            xSpeed = -Player.maxMoveSpeed
            
            setXY(x: self.x + self.xSpeed, y: self.y)
            
        } else if self.direction == "right" {
            
            xSpeed = Player.maxMoveSpeed
            
            setXY(x: self.x + self.xSpeed, y: self.y)
        }
    }
    
    func move() {
        
        self.xSpeed = 0
        
        if self.ySpeed != 0 {
            self.updateAnimation()
        }

        if self.isJumping == true || self.isFalling == true {
            
            setXY(x: self.x, y: self.y + ySpeed)
            
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
        
        if self.isMoving == true {

            var isEmpty: Bool = true
            
            for block in currentStage.blocks {
                
                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                    
                    isEmpty = false
                }
            }
            
            if isEmpty == true {
                
                self.isFalling = true
            }
        }
        
        if self.isFalling == true {
            
            for block in currentStage.blocks {
                
                if self.y + (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                    
                    self.isJumping = false
                    self.isFalling = false
                    
                    self.ySpeed = 0
                    
                    setXY(x: self.x, y: block.y - (Block.height / 2) - (Player.height / 2))
                }
            }
            
        }
        
        if self.isRising == true {
            
            for block in currentStage.blocks {
                
//                if self.y - (Player.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {
                if self.y - (Player.height / 2) + self.ySpeed <= block.y + (Block.height / 2) && self.y - (Player.height / 2) + self.ySpeed >= block.y - (Block.height / 2) && ((self.x + (Player.width / 2) <= block.x + (Block.width / 2) && self.x + (Player.width / 2) > block.x - (Block.width / 2)) || (self.x - (Player.width / 2) < block.x + (Block.width / 2) && self.x - (Player.width / 2) >= block.x - (Block.width / 2))) {

                    self.isFalling = true

                    self.isJumping = false
                    self.isRising = false

                    self.ySpeed = 0

                    setXY(x: self.x, y: block.y + (Block.height / 2) + (Player.height / 2))
                }
            }
            
        }
        
        if isMoving == true {
            
            self.canMove = true
            
            for block in currentStage.blocks {
                
                if self.isMovingRight == true {
                    
                    if self.x + (Player.width / 2) + Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x + (Player.width / 2) + Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                        
                        self.canMove = false
                        
                        setXY(x: block.x - (Block.width / 2) - (Player.width / 2) - Player.maxMoveSpeed, y: self.y)
                    }
                    
                } else if self.isMovingLeft == true {
                    
                    if self.x - (Player.width / 2) - Player.maxMoveSpeed < block.x + (Block.width / 2) && self.x - (Player.width / 2) - Player.maxMoveSpeed > block.x - (Block.width / 2) && ((self.y + (Player.height / 2) <= block.y + (Block.height / 2) && self.y + (Player.height / 2) > block.y - (Block.height / 2)) || (self.y - (Player.height / 2) < block.y + (Block.height / 2) && self.y - (Player.height / 2) >= block.y - (Block.height / 2))) {
                        
                        self.canMove = false

                        setXY(x: block.x + (Block.width / 2) + (Player.width / 2), y: self.y)
                    }
                }
                
            }
        }
        
    }
    
    func jump() {
        
        self.isJumping = true
        self.isRising = true
        
        self.ySpeed = -Player.maxFallSpeed
    }
    
    func shoot() {
        
        self.isShooting = true
        
        if self.direction == "left" {
            
            bullets.append(Bullet(x: self.x - (Player.width / 2), y: self.y, direction: self.direction))

        } else if self.direction == "right" {
            
            bullets.append(Bullet(x: self.x + (Player.width / 2), y: self.y, direction: self.direction))
        }
        
        self.isShooting = false
    }
    
    func updateAnimation() {
        
        self.view.stopAnimating()
        
        if ySpeed != 0 {
            
            if direction == "left" {
                
                self.view.image = Player.jumpRightImage
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
                self.view.image = Player.jumpRightImage

                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if isMoving == true {
            
            if isMovingLeft == true {
                
                self.view.animationImages = Player.runRightImages as! [UIImage]
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)

                self.view.animationDuration = 0.55
                self.view.startAnimating()
                
            } else if isMovingRight == true {
                
                self.view.animationImages = Player.runRightImages as! [UIImage]

                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)

                self.view.animationDuration = 0.55
                self.view.startAnimating()
            }
        }
        
//        self.view.animationDuration = 0.55
//        self.view.startAnimating()
    }
    
    static func scale(image: UIImage) -> UIImage {
        return scaleUIImageToSize(image: image, size: CGSize(width: Block.width * 2, height: Block.height * 2))
    }
}
