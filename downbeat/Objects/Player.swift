//
//  Player.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Player {
    
    // CONSTANTS
    
    static let maxHealth: CGFloat = 100
    
    static let width: CGFloat = 50
    static let height: CGFloat = 50
    
    static let maxFallSpeed: CGFloat = 5
    
    static let maxMoveSpeed: CGFloat = 5

    // VARIABLES

    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var isFalling: Bool = false
    var isJumping: Bool = false
    var isMoving: Bool = false
    var isHit: Bool = false
    
    var isMovingLeft: Bool = false
    var isMovingRight: Bool = false

    var health: CGFloat = 0

    var color: UIColor = UIColor.white

    var view: UIView = UIView()

    init() {
        
        self.health = Player.maxHealth
        
        self.view.frame.origin.x = self.x - Player.width / 2
        self.view.frame.origin.y = self.y - Player.height / 2
        
        self.view.frame.size.width = Player.width
        self.view.frame.size.height = Player.height
        
        self.view.backgroundColor = self.color
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - Player.width / 2
        self.view.frame.origin.y = self.y - Player.height / 2
    }
    
    func didHitGoal() -> Bool {
        
//        if distance(x1: goal.x, y1: goal.y, x2: player.x, y2: player.y) <= Player.radius + (Goal.width / 2) {
//            return true
//        }
        
        return false
    }
    
//    func reset(stage: Stage) {
//
//        self.setXY(x: stage.playerStartX, y: stage.playerStartY)
//
//    }
    
    func move() {
        
        
        
    }
    
    func jump() {
        
        
        
    }
    
    func shoot() {
        
        
        
    }
}
