//
//  Joystick.swift
//  downbeat
//
//  Created by Collin Howard on 11/27/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Joystick {
    
    // CONSTANTS
    
    static let innerRadius: CGFloat = 25
    static let outerRadius: CGFloat = 70
    
    static let innerColor: UIColor = UIColor.white.withAlphaComponent(0.5)
    static let outerColor: UIColor = UIColor.white.withAlphaComponent(0.2)

    static let moveDist: CGFloat = Joystick.innerRadius
    
    // VARIABLES
    
    var innerX: CGFloat = 0
    var innerY: CGFloat = 0
    
    var outerX: CGFloat = 0
    var outerY: CGFloat = 0
    
    var innerView: UIView = UIView()
    var outerView: UIView = UIView()

    init() {
        
        self.hideViews()
        
        self.innerView.frame.size.width = Joystick.innerRadius * 2
        self.innerView.frame.size.height = Joystick.innerRadius * 2
        
        self.outerView.frame.size.width = Joystick.outerRadius * 2
        self.outerView.frame.size.height = Joystick.outerRadius * 2
        
        self.innerView.backgroundColor = Joystick.innerColor
        self.outerView.backgroundColor = Joystick.outerColor
        
        self.innerView.layer.cornerRadius = Joystick.innerRadius
        self.outerView.layer.cornerRadius = Joystick.outerRadius
    }
    
    func setInnterXY(x: CGFloat, y: CGFloat) {
        
        if distance(x1: x, y1: y, x2: self.outerX, y2: self.outerY) > Joystick.outerRadius - (Joystick.innerRadius / 2) {
            
            let xDist = x - self.outerX
            let yDist = y - self.outerY
            
            let ratio = xDist / yDist
            let newDist = Joystick.outerRadius - (Joystick.innerRadius / 2)
            
            var newY = sqrt((newDist * newDist) / ((ratio * ratio) + 1))
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
            
            self.innerX = self.outerX + newX
            self.innerY = self.outerY + newY
            
        } else {
            
            self.innerX = x
            self.innerY = y
        }
        
        self.handleDirection()
        
        self.innerView.frame.origin.x = self.innerX - Joystick.innerRadius
        self.innerView.frame.origin.y = self.innerY - Joystick.innerRadius
    }
    
    func setOuterXY(x: CGFloat, y: CGFloat) {
        
        self.outerX = x
        self.outerY = y
        
        self.outerView.frame.origin.x = self.outerX - Joystick.outerRadius
        self.outerView.frame.origin.y = self.outerY - Joystick.outerRadius
    }
    
    func resetInnerXY() {
        self.setInnterXY(x: self.outerX, y: self.outerY)
    }
    
    func hideViews() {
        innerView.isHidden = true
        outerView.isHidden = true
    }
    
    func showViews() {
        innerView.isHidden = false
        outerView.isHidden = false
    }
    
    func handleDirection() {
        
        let xDist = self.innerX - self.outerX
        let yDist = self.innerY - self.outerY

        if abs(yDist) > abs(xDist) {
            
            if abs(yDist) > Joystick.moveDist {
                
                if yDist > 0 {
                    
                    moveDirection(direction: "down")
                    
                } else {
                    
                    moveDirection(direction: "up")
                }
                
            } else {
                
                moveDirection(direction: "none")
            }
            
        } else {
            
            if abs(xDist) > Joystick.moveDist {
                
                if xDist > 0 {
                    
                    moveDirection(direction: "right")

                } else {
                    
                    moveDirection(direction: "left")
                }
                
            } else {
                
                moveDirection(direction: "none")
            }
        }
        
    }
    
    func isInOuterRadius(x: CGFloat, y: CGFloat) -> Bool {
        
        if distance(x1: x, y1: y, x2: self.outerX, y2: self.outerY) <= Joystick.outerRadius {
            return true
        }
        
        return false
    }
}
