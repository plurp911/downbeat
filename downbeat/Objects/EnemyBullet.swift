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
    
//    static let color: UIColor = UIColor.clear
    static let color: UIColor = UIColor.red
    
    static let smallEnemyBulletImage = UIImage(named: "enemyBullet")

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var type: String = ""
    
    var radius: CGFloat = 0

    var damage: Int = 0

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, xSpeed: CGFloat, ySpeed: CGFloat, type: String) {
        
        self.setXY(x: x, y: y)
        self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)
        
        self.type = type
        
        if self.type == "smallEnemyBullet" {
           
            self.radius = Block.width * (6 / 16) * (1 / 2)
            
            self.damage = 5
            
            self.view.image = EnemyBullet.smallEnemyBulletImage
        }

        self.view.frame.origin.x = self.x - self.radius
        self.view.frame.origin.y = self.y - self.radius
        
        self.view.frame.size.width = self.radius * 2
        self.view.frame.size.height = self.radius * 2
        
        self.view.backgroundColor = EnemyBullet.color
        
        self.view.layer.cornerRadius = self.radius
        
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
        
        self.view.frame.origin.x = self.x - self.radius
        self.view.frame.origin.y = self.y - self.radius
    }
    
    func setXYSpeed(xSpeed: CGFloat, ySpeed: CGFloat) {
        
        self.xSpeed = xSpeed
        self.ySpeed = ySpeed
    }
    
    func isInBounds() -> Bool {
        
        if self.x + self.radius >= 0 && self.x - self.radius <= screenSize.height * (screenRatio) && self.y - self.radius <= screenSize.height && self.y + self.radius >= 0 {
            return true
        }
        
        return false
    }
    
    func move() {
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
}
