//
//  Powerup.swift
//  downbeat
//
//  Created by Collin Howard on 11/20/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Powerup {
    
    // CONSTANTS
    
    static let maxFallSpeed: CGFloat = 2
    
    static let ySpeedChange: CGFloat = 0.2
    
    static let color: UIColor = UIColor.clear
    //    static let color: UIColor = UIColor.red
    
    static let largeHealthImages = [UIImage(named: "largeHealthPowerup1"), UIImage(named: "largeHealthPowerup2")]
    static let smallHealthImages = [UIImage(named: "smallHealthPowerup1"), UIImage(named: "smallHealthPowerup2")]

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var type: String = ""
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    var ySpeed: CGFloat = 0
    
    var isRising: Bool = false
    var isFalling: Bool = false
    
    var isJumping: Bool = false
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, type: String) {
        
        self.x = x
        self.y = y
        
        self.type = type
        
        if self.type == "largeHealth" {
            
            self.width = Block.width
            self.height = self.width
            
        } else if self.type == "smallHealth" {
            
            self.width = Block.width * 0.5
            self.height = self.width
        }
        
        self.setXY(x: self.x, y: self.y)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = Powerup.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()

        if self.type == "largeHealth" {
            
            self.view.animationImages = Powerup.largeHealthImages as! [UIImage]
            
            self.view.animationRepeatCount = 20
            
            self.view.animationDuration = 0.3
            self.view.startAnimating()
            
        } else if self.type == "smallHealth" {
            
            self.view.animationImages = Powerup.smallHealthImages as! [UIImage]
            
            self.view.animationRepeatCount = 20
            
            self.view.animationDuration = 0.3
            self.view.startAnimating()
        }
        
        self.jump()
    }
    
    func move() {
        
        if self.isJumping == true || self.isFalling == true {
            
            self.setXY(x: self.x, y: self.y + ySpeed)
            
            self.ySpeed += Powerup.ySpeedChange
            
            if self.ySpeed > 0 {
                
                self.isFalling = true
                
                self.isRising = false
                
                if self.ySpeed > Powerup.maxFallSpeed {
                    self.ySpeed = Powerup.maxFallSpeed
                }
                
            } else if ySpeed < 0 {
                
                self.isRising = true
                
                self.isFalling = false
            }
        }
        
        if self.isFalling == true {
            
            for block in currentStage.blocks {
                
                if self.y + (self.height / 2) + self.ySpeed < block.y + (Block.height / 2) && self.y + (self.height / 2) + self.ySpeed > block.y - (Block.height / 2) && ((self.x + (self.width / 2) <= block.x + (Block.width / 2) && self.x + (self.width / 2) > block.x - (Block.width / 2)) || (self.x - (self.width / 2) < block.x + (Block.width / 2) && self.x - (self.width / 2) >= block.x - (Block.width / 2))) {
                    
                    self.isJumping = false
                    self.isFalling = false
                    
                    self.ySpeed = 0
                    
                    setXY(x: self.x, y: block.y - (Block.height / 2) - (self.height / 2))
                }
            }
            
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y

        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
    }
    
    func jump() {
        
        self.isJumping = true
        self.isRising = true
        
        self.ySpeed = -Powerup.maxFallSpeed
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) && self.y - (self.height / 2) <= screenSize.height {
            return true
        }
        
        return false
    }
}
