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
    
    static let smallRegularEnemyBulletImage = UIImage(named: "smallRegularEnemyBullet")

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    var type: String = ""
    
    var width: CGFloat = 0
    var height: CGFloat = 0

    var damage: Int = 0

    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, xSpeed: CGFloat, ySpeed: CGFloat, type: String) {
        
        self.type = type
        
        self.view.stopAnimating()
        
        if self.type == "smallRegular" {
           
            self.width = Block.width * (6 / 16)
            self.height = self.width
            
            self.damage = 1
            
            self.view.image = EnemyBullet.smallRegularEnemyBulletImage
        }
        
        self.setXY(x: x, y: y)
        self.setXYSpeed(xSpeed: xSpeed, ySpeed: ySpeed)

        self.view.frame.origin.x = self.x - (self.width / 2)
        self.view.frame.origin.y = self.y - (self.height / 2)
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = EnemyBullet.color
        
//        self.view.layer.cornerRadius = self.width / 2
        
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
        
        setXY(x: self.x + self.xSpeed, y: self.y + self.ySpeed)
    }
}