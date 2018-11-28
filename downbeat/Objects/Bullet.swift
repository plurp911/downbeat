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

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, direction: String, type: String) {
        
        self.type = type
        
        if self.type == "regular" {
            
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.moveSpeed = 4.5
            
            self.damage = 1
            
            if direction == "left" {
                
                self.xSpeed = -self.moveSpeed
                
            } else if direction == "right" {
                
                self.xSpeed = self.moveSpeed
            }
        }

        self.setXY(x: x, y: y)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = Bullet.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "bulletRight")
        
        if self.type == "regular" {
            
            if direction == "left" {
                
                self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
                
            } else if direction == "right" {
                
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
        
        if self.type == "regular" {

            setXY(x: self.x + self.xSpeed, y: self.y)
        }
    }
    
}

