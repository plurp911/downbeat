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
    
    static let cutterImagesRight = [UIImage(named: "cutterBulletUp"), UIImage(named: "cutterBulletRight"), UIImage(named: "cutterBulletDown"), UIImage(named: "cutterBulletLeft")]

    static let regularImage = UIImage(named: "regularBulletRight")

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
    
//    var xDist: CGFloat = 0
    var xGoal: CGFloat = 0
    
    var didReachGoal: Bool = false

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, direction: String, type: String) {
        
        self.direction = direction

        self.type = type
        
        if self.type == "regular" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.moveSpeed = 4.5
            
            self.damage = 1
            
            if self.direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
            
        } else if self.type == "cutter" {
            
            self.width = Block.width * (10 / 16)
            self.height = self.width
            
//            self.moveSpeed = 2.5
            self.moveSpeed = 2

            self.damage = 3
            
//            self.xDist = Block.width * 4
            
            if self.direction == "left" {
                
                self.xGoal = x - (Block.width * 4)
                
//                self.xSpeed = -self.moveSpeed
                
            } else if self.direction == "right" {
                
                self.xGoal = x + (Block.width * 4)

//                self.xSpeed = self.moveSpeed
            }
            
            self.xSpeed = self.moveSpeed
            self.ySpeed = self.moveSpeed * 0.2
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
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
                self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
        } else if self.type == "cutter" {
            
            self.view.animationImages = Bullet.cutterImagesRight as! [UIImage]
            
//            self.view.animationDuration = 0.85 * (4 / 6)
            self.view.animationDuration = 0.85 * 0.6875

            self.view.startAnimating()
            
            if self.direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if self.direction == "right" {
                
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

    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) && self.y + (self.height / 2) >= 0 && self.y - (self.height / 2) <= screenSize.height {
            return true
        }
        
        return false
    }
    
    func move() {
        
//        print()
//        print("X")
//        print(self.x)
//        print("X GOAL")
//        print(self.xGoal)
//        print("DID REACH GOAL")
//        print(self.didReachGoal)
//        print()

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
            
        }
    }
    
}
