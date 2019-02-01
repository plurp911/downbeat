//
//  Background.swift
//  downbeat
//
//  Created by Admin on 12/10/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Background {
    
    // CONSTANTS
    
    static let height: CGFloat = Block.height
    static let width: CGFloat = Background.height
    
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var xPos: Int = 0
    var yPos: Int = 0
    
    var type: String = ""
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var view: UIImageView = UIImageView()

    init(xPos: Int, yPos: Int, type: String, tileSet: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        self.x = (((CGFloat)(self.xPos)) * Background.width) + (Background.width / 2)
        self.y = (((CGFloat)(self.yPos)) * Background.height) + (Background.height / 2)
        
        self.view.frame.origin.x = self.x - Background.width / 2
        self.view.frame.origin.y = self.y - Background.height / 2
        
        self.view.frame.size.width = Background.width
        self.view.frame.size.height = Background.height
        
        self.view.backgroundColor = Background.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
            
        self.view.image = UIImage(named: "\(tileSet)Background\(self.type.capitalizingFirstLetter())")
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - Background.width / 2
        self.view.frame.origin.y = self.y - Background.height / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (Background.width / 2) >= 0 && self.x - (Background.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
}
