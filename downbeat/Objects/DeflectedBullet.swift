//
//  DeflectedBullet.swift
//  downbeat
//
//  Created by Collin Howard on 11/22/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class DeflectedBullet {
    
    // CONSTANTS
    
    static let radius: CGFloat = Block.width * (6 / 16) * (1 / 2)
    static let moveSpeed: CGFloat = 8
    
    static let color: UIColor = UIColor.clear
    //    static let color: UIColor = UIColor.red
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, direction: String) {
        
        if direction == "left" {
            xSpeed = -DeflectedBullet.moveSpeed
        } else if direction == "right" {
            xSpeed = DeflectedBullet.moveSpeed
        }
        
        self.ySpeed = -DeflectedBullet.moveSpeed
        
        self.setXY(x: x, y: y)
        
        self.view.frame.origin.x = self.x - DeflectedBullet.radius
        self.view.frame.origin.y = self.y - DeflectedBullet.radius
        
        self.view.frame.size.width = DeflectedBullet.radius * 2
        self.view.frame.size.height = DeflectedBullet.radius * 2
        
        self.view.backgroundColor = DeflectedBullet.color
        
        self.view.layer.cornerRadius = DeflectedBullet.radius
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "regularBulletRight")
        
        if direction == "left" {
            self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
        } else if direction == "right" {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - DeflectedBullet.radius
        self.view.frame.origin.y = self.y - DeflectedBullet.radius
    }
    
    func isInBounds() -> Bool {
        
        if self.x + DeflectedBullet.radius >= 0 && self.x - DeflectedBullet.radius <= screenSize.height * (screenRatio) && self.y + DeflectedBullet.radius >= 0 && self.y - DeflectedBullet.radius <= screenSize.height {
            return true
        }
        
        return false
    }
    
    func move() {
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
}
