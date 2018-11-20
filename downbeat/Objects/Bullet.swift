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
    
    static let damage: CGFloat = 10

    static let radius: CGFloat = Block.width * (6 / 16) * (1 / 2)
    //    static let radius: CGFloat = Block.width * (7 / 16) * (1 / 2)
//    static let radius: CGFloat = Block.width * (8 / 16) * (1 / 2)

    static let moveSpeed: CGFloat = 3
    
    static let color: UIColor = UIColor.clear
//    static let color: UIColor = UIColor.red

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var xSpeed: CGFloat = 0
    
    var view: UIImageView = UIImageView()

    init(x: CGFloat, y: CGFloat, direction: String) {
        
        if direction == "left" {
            xSpeed = -Bullet.moveSpeed
        } else if direction == "right" {
            xSpeed = Bullet.moveSpeed
        }

        self.setXY(x: x, y: y)

        self.view.frame.origin.x = self.x - Bullet.radius
        self.view.frame.origin.y = self.y - Bullet.radius
        
        self.view.frame.size.width = Bullet.radius * 2
        self.view.frame.size.height = Bullet.radius * 2
        
        self.view.backgroundColor = Bullet.color
        
        self.view.layer.cornerRadius = Bullet.radius
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "bulletRight")
        
        if direction == "left" {
            self.view.transform = CGAffineTransform(scaleX: -1, y: 1)
        } else if direction == "right" {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - Bullet.radius
        self.view.frame.origin.y = self.y - Bullet.radius
    }
    
    //    func didHitGoal() -> Bool {
    //
    ////        if distance(x1: goal.x, y1: goal.y, x2: player.x, y2: player.y) <= Player.radius + (Goal.width / 2) {
    ////            return true
    ////        }
    //
    //        return false
    //    }
    
    func isInBounds() -> Bool {
        
        if self.x + Bullet.radius >= 0 && self.x - Bullet.radius <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }

    func move() {
        
        setXY(x: self.x + self.xSpeed, y: self.y)
    }
}
