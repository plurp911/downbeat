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
    
    static let width: CGFloat = 50
    static let height: CGFloat = Block.height
        
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0

    var color: UIColor = UIColor.gray
    
    var view: UIView = UIView()
    
    init() {
        
        self.view.frame.origin.x = self.x - Block.width / 2
        self.view.frame.origin.y = self.y - Block.height / 2
        
        self.view.frame.size.width = Block.width
        self.view.frame.size.height = Block.height
        
        self.view.backgroundColor = self.color
    }
    
    func setX(x: CGFloat) {
        
        self.x = x
        
        self.view.frame.origin.x = self.x - Block.width / 2
    }
    
    func didHitGoal() -> Bool {
        
        //        if distance(x1: goal.x, y1: goal.y, x2: player.x, y2: player.y) <= Player.radius + (Goal.width / 2) {
        //            return true
        //        }
        
        return false
    }
    
//        func reset(stage: Stage) {
//
//            self.setXY(x: stage.playerStartX, y: stage.playerStartY)
//
//        }
    
    func move(direction: String) {
        
        if direction == "left" {
            
            setX(x: self.x + Player.maxMoveSpeed)
            
        } else {
            
            setX(x: self.x + Player.maxMoveSpeed)
        }
    }
    
}
