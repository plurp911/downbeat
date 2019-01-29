//
//  Explosion.swift
//  downbeat
//
//  Created by Collin Howard on 11/20/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Explosion {
    
    // CONSTANTS
    
    //    static let height: CGFloat = Block.height
    //    static let width: CGFloat = Explosion.height
    
    static let color: UIColor = UIColor.clear
    //    static let color: UIColor = UIColor.red
    
    static let explosionImages = [UIImage(named: "explosion1"), UIImage(named: "explosion2"), UIImage(named: "explosion3"), UIImage(named: "explosion4")]
    
    static let popImages = [UIImage(named: "pop1"), UIImage(named: "pop2"), UIImage(named: "pop3"), UIImage(named: "pop4")]
    
    static let breakImages = [UIImage(named: "break1"), UIImage(named: "break2"), UIImage(named: "break3"), UIImage(named: "break4")]
    
    static let smokeImages = [UIImage(named: "smoke1"), UIImage(named: "smoke2"), UIImage(named: "smoke3")]
    
    static let deathImages = [UIImage(named: "death1"), UIImage(named: "death2"), UIImage(named: "death3"), UIImage(named: "death4")]
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var moveSpeed: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    var type: String = ""
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, type: String) {
        
        self.x = x
        self.y = y
        
        self.type = type
        
        self.moveSpeed = 0
        
        self.xSpeed = 0
        self.ySpeed = 0
        
        self.view.backgroundColor = Explosion.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()
        
        if type == "explosion" {
            
            self.height = Block.height
            self.width = self.height
            
            self.view.animationImages = Explosion.explosionImages as! [UIImage]
            
            self.view.animationDuration = 0.135
            
        } else if type == "pop" {
            
            self.height = Block.height
            self.width = self.height
            
            self.view.animationImages = Explosion.popImages as! [UIImage]
            
            self.view.animationDuration = 0.135
            
        } else if type == "break" {
            
            self.height = Block.height
            self.width = self.height
            
            self.view.animationImages = Explosion.breakImages as! [UIImage]
            
            self.view.animationDuration = 0.135
            
        } else if type == "smoke" {
            
            self.height = Block.height * (8 / 16)
            self.width = self.height
            
            self.view.animationImages = Explosion.smokeImages as! [UIImage]
            
            self.view.animationDuration = TimeInterval(Player.knockBackTime)
        }
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.animationRepeatCount = 1
        
        self.view.startAnimating()
        
        self.updateSpeeds()
    }
    
    init(x: CGFloat, y: CGFloat, xSpeedMultiplier: Int, ySpeedMultiplier: Int, type: String) {
        
        self.x = x
        self.y = y
        
//        self.type = type
        self.type = "death"
        
        self.view.backgroundColor = Explosion.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()
        
//        if type == "death" {
        
        //            self.moveSpeed = 1.25
        self.moveSpeed = 1
        
        if xSpeedMultiplier != 0 && ySpeedMultiplier != 0 {
            
            self.xSpeed = self.moveSpeed * ((CGFloat)(xSpeedMultiplier)) * CGFloat((2.squareRoot() / 2))
            self.ySpeed = self.moveSpeed * ((CGFloat)(ySpeedMultiplier)) * CGFloat((2.squareRoot() / 2))
            
        } else {
            
            self.xSpeed = self.moveSpeed * ((CGFloat)(xSpeedMultiplier))
            self.ySpeed = self.moveSpeed * ((CGFloat)(ySpeedMultiplier))
        }
        
        self.height = Block.height
        self.width = self.height
        
        if type == "death" {
            
            self.view.animationImages = Explosion.deathImages as! [UIImage]

        } else {
            
            self.view.animationImages = [UIImage(named: "\(type)Death1"), UIImage(named: "\(type)Death2"), UIImage(named: "\(type)Death3"), UIImage(named: "\(type)Death4")] as! [UIImage]
        }
        
        self.view.animationDuration = 0.135
//        }
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        // self.view.animationRepeatCount = -1
        
        self.view.startAnimating()
        
        self.updateSpeeds()
    }
    
    func updateSpeeds() {
        
        self.moveSpeed = newVal(oldVal: self.moveSpeed)
        self.xSpeed = newVal(oldVal: self.xSpeed)
        self.ySpeed = newVal(oldVal: self.ySpeed)
    }
    
    func setX(x: CGFloat) {
        
        self.x = x
        
        self.view.frame.origin.x = self.x - self.width / 2
    }
    
    func move() {
        
        self.x += self.xSpeed
        self.y += self.ySpeed
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
}
