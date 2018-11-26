//
//  Block.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Block {
    
    // CONSTANTS
    
    static let height: CGFloat = screenSize.height / ((CGFloat)(numberOfVerticalBricks))
    static let width: CGFloat = Block.height
    
//    static let color: UIColor = UIColor.gray
    static let color: UIColor = UIColor.clear

    // VARIABLES
    
    var xPos: Int = 0
    var yPos: Int = 0
    
    var type: String = ""

    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var isLadder: Bool = false
    var isTopLadder: Bool = false

    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        if self.type == "ladder" {
            
            self.isLadder = true
            
        } else if self.type == "topLadder" {
            
            self.isTopLadder = true
        }
        
        self.x = (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2)
        self.y = (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2)

        self.view.frame.origin.x = self.x - Block.width / 2
        self.view.frame.origin.y = self.y - Block.height / 2
        
        self.view.frame.size.width = Block.width
        self.view.frame.size.height = Block.height
        
        self.view.backgroundColor = Block.color
        
        self.view.contentMode = .scaleAspectFill

        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: self.type)
    }
    
    func setX(x: CGFloat) {
        
        self.x = x
        
        self.view.frame.origin.x = self.x - Block.width / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (Block.width / 2) >= 0 && self.x - (Block.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
}
