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
    
    static let innerRadius: CGFloat = 30
    static let outerRadius: CGFloat = 85
    
    static var innerImageRadius: CGFloat = Block.width * (20 / 16)
    static var outerImageRadius: CGFloat = Block.width * (55 / 16)

    static let innerColor: UIColor = UIColor.white.withAlphaComponent(0.5)
    static let outerColor: UIColor = UIColor.white.withAlphaComponent(0.2)

    static let moveDist: CGFloat = Joystick.innerRadius * 0.125
    
    // VARIABLES
    
    var innerX: CGFloat = 0
    var innerY: CGFloat = 0
    
    var outerX: CGFloat = 0
    var outerY: CGFloat = 0
    
    var innerView: UIView = UIView()
    var outerView: UIView = UIView()
    
    var innerImageView: UIImageView = UIImageView()
    var outerImageView: UIImageView = UIImageView()

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
        
        self.innerImageView.frame.size.width = Joystick.innerImageRadius * 2
        self.innerImageView.frame.size.height = Joystick.innerImageRadius * 2
        
        self.innerImageView.backgroundColor = UIColor.clear
        self.innerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.innerImageView.contentMode = .scaleAspectFill
        self.innerImageView.layer.magnificationFilter = CALayerContentsFilter.nearest
        self.innerImageView.image = UIImage(named: "innerJoystick")
        self.innerImageView.alpha = 0.5
        
        self.outerImageView.frame.size.width = Joystick.outerImageRadius * 2
        self.outerImageView.frame.size.height = Joystick.outerImageRadius * 2
        
        self.outerImageView.backgroundColor = UIColor.clear
        self.outerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.outerImageView.contentMode = .scaleAspectFill
        self.outerImageView.layer.magnificationFilter = CALayerContentsFilter.nearest
        self.outerImageView.image = UIImage(named: "outerJoystick")
        self.outerImageView.alpha = 0.5
    }
    
    func setInnterXY(x: CGFloat, y: CGFloat) {
        
        if distance(x1: x, y1: y, x2: self.outerX, y2: self.outerY) > Joystick.outerRadius - (Joystick.innerRadius / 2) {
            
            let xDist = x - self.outerX
            var yDist = y - self.outerY
            
            if yDist == 0 {
                yDist = 0.0001
            }
            
            let ratio = xDist / yDist
            let newDist = Joystick.outerRadius - (Joystick.innerRadius / 2)
            
            var holder = (ratio * ratio) + 1
            
            if holder == 0 {
                holder = 0.0001
            }
            
            var newY = sqrt((newDist * newDist) / holder)
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
        
        Joystick.innerImageRadius = Block.width * (20 / 16)
        
        self.innerImageView.frame.size.width = Joystick.innerImageRadius * 2
        self.innerImageView.frame.size.height = Joystick.innerImageRadius * 2
        
        self.innerImageView.frame.origin.x = self.innerX - Joystick.innerImageRadius
        self.innerImageView.frame.origin.y = self.innerY - Joystick.innerImageRadius
    }
    
    func setOuterXY(x: CGFloat, y: CGFloat) {
        
        self.outerX = x
        self.outerY = y
        
        self.outerView.frame.origin.x = self.outerX - Joystick.outerRadius
        self.outerView.frame.origin.y = self.outerY - Joystick.outerRadius
        
        Joystick.outerImageRadius = Block.width * (55 / 16)
        
        self.outerImageView.frame.size.width = Joystick.outerImageRadius * 2
        self.outerImageView.frame.size.height = Joystick.outerImageRadius * 2

        self.outerImageView.frame.origin.x = self.outerX - Joystick.outerImageRadius
        self.outerImageView.frame.origin.y = self.outerY - Joystick.outerImageRadius
    }
    
    func resetInnerXY() {
        self.setInnterXY(x: self.outerX, y: self.outerY)
    }
    
    func hideViews() {
        
        innerView.isHidden = true
        outerView.isHidden = true
        
        innerImageView.isHidden = true
        outerImageView.isHidden = true
    }
    
    func showViews() {
        
        innerView.isHidden = false
        outerView.isHidden = false
        
        innerImageView.isHidden = false
        outerImageView.isHidden = false
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
