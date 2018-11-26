//
//  Global.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

// CONSTANTS

let screenSize = UIScreen.main.bounds

var numberOfVerticalBricks: Int = 15

let maxBullets: Int = 3

//let screenRatio: CGFloat = 16 / 9
//let screenRatio: CGFloat = 4 / 3
let screenRatio: CGFloat = 16 / 15
//let screenRatio: CGFloat = 1

// COLORS

let backgroundColor = UIColor.black

let mainButtonColor = UIColor.gray.withAlphaComponent(0.35)
let mainButtonOtherColor = UIColor.lightGray.withAlphaComponent(0.7)
let mainButtonTextColor = UIColor.white

let gameViewColor = UIColor(red: 32 / 255, green: 56 / 255, blue: 236 / 255, alpha: 1)

// VARIABLES

var stages = [Stage]()

var bullets = [Bullet]()
var explosions = [Explosion]()
var powerups = [Powerup]()
var enemyBullets = [EnemyBullet]()
var deflectedBullets = [DeflectedBullet]()

var selectedBlocks = [Block]()
var selectedEnemies = [Enemy]()
var selectedPowerups = [Powerup]()

var canMoveLeft: Bool = true
var canMoveRight: Bool = true

var canBeKnockedBack: Bool = true

//var canJump: Bool = true
//var canShoot: Bool = true

var isLeftPressed: Bool = false
var isRightPressed: Bool = false
var isUpPressed: Bool = false
var isDownPressed: Bool = false

var isPaused: Bool = false

// OBJECTS

var currentStage = Stage()

var player = Player()

// FUNCTIONS

public func removeObjects(type: String, toRemove: [Int]) {
    
    var newToRemove = toRemove.sorted(by: { $0 < $1 })
    
    for i in 0 ..< newToRemove.count {
        
        let newI = newToRemove.count - i - 1
//        let newI = i

        if type == "bullets" {
            
            bullets.remove(at: newToRemove[newI])
            
        } else if type == "deflectedBullets" {
            
            deflectedBullets.remove(at: newToRemove[newI])
            
        } else if type == "powerups" {
            
            powerups.remove(at: newToRemove[newI])
            
        } else if type == "stagePowerups" {
            
            currentStage.powerups.remove(at: newToRemove[newI])
            
        } else if type == "explosions" {
            
            explosions.remove(at: newToRemove[newI])
            
        } else if type == "enemies" {
            
            currentStage.enemies[newToRemove[newI]].endTimers()
            currentStage.enemies.remove(at: newToRemove[newI])
            
        } else if type == "enemyBullets" {
            
            enemyBullets.remove(at: newToRemove[newI])
            
        } else if type == "selectedBlocks" {
            
            selectedBlocks.remove(at: newToRemove[newI])
            
        } else if type == "selectedEnemies" {
            
            selectedEnemies.remove(at: newToRemove[newI])
        }
    }
    
}
