//
//  Stage.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Stage {
    
    // VARIABLES
    
    var blocks = [Block]()
    var enemies = [Enemy]()

    var playerStartX: CGFloat = 0
    var playerStartY: CGFloat = 0
    
    var x: CGFloat = 0
    
    var numberOfHorizontalBlocks: Int = 0

    init() {
        
    }
    
    func setPlayerStartXY(startX: CGFloat, startY: CGFloat) {
        
        self.playerStartX = startX
        self.playerStartY = startY
    }
    
    func didHitGoal() -> Bool {
        
        //        if distance(x1: goal.x, y1: goal.y, x2: player.x, y2: player.y) <= Player.radius + (Goal.width / 2) {
        //            return true
        //        }
        
        return false
    }
    
    func moveBlocks() {
        
        for i in 0 ..< blocks.count {
            
            self.blocks[i].setX(x: self.x + (((CGFloat)(self.blocks[i].xPos)) * Block.width) + (Block.width / 2))
        }
    }
    
    func moveEnemies() {
        
        for i in 0 ..< enemies.count {
            
            if self.enemies[i].isInBounds() == false {
                
                self.enemies[i].setXY(x: self.x + (((CGFloat)(self.enemies[i].xPos)) * Block.width) + (Block.width / 2), y: self.enemies[i].y)
            }
        }
        
    }
    
    func reset() {
        
        self.x = 0

        self.moveBlocks()
    }
    
    func move(direction: String) {
        
        if direction == "left" {
            
            if player.isKnockedBack == true {
                self.x += Player.knockBackMoveSpeed
            } else {
                self.x += Player.maxMoveSpeed
            }
            
//            if self.x >= ((CGFloat)(numberOfHorizontalBlocks)) * Block.width {
//                self.x = ((CGFloat)(numberOfHorizontalBlocks)) * Block.width
//            }
            
        } else if direction == "right" {
            
            if player.isKnockedBack == true {
                self.x -= Player.knockBackMoveSpeed
            } else {
                self.x -= Player.maxMoveSpeed
            }
            
//            if self.x <= 0 {
//                self.x = 0
//            }
            
        }
    }
    
}
