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
var selectedEnemySpawners = [EnemySpawner]()

var canMoveLeft: Bool = true
var canMoveRight: Bool = true

var canBeKnockedBack: Bool = true

var canClimb: Bool = true

//var canJump: Bool = true
//var canShoot: Bool = true

var isLeftPressed: Bool = false
var isRightPressed: Bool = false
var isUpPressed: Bool = false
var isDownPressed: Bool = false

var isPaused: Bool = false

// OBJECTS

var currentStage = Stage(fileName: "1-1")

var player = Player()

// FUNCTIONS

public func removeDuplicateInts(values: [Int]) -> [Int] {
    
    // Convert array into a set to get unique values.
    let uniques = Set<Int>(values)
    
    // Convert set back into an Array of Ints.
    let result = Array<Int>(uniques)
    
    return result
}

public func tryToRemove(array: [AnyObject], value: Int) -> [AnyObject] {
    
    var newArray = array
    
    if value >= 0 && value < array.count {
        
        newArray.remove(at: value)
    }
    
    return newArray
}

public func removeObjects(type: String, toRemove: [Int]) {
    
    var newToRemove = removeDuplicateInts(values: toRemove)

    newToRemove = newToRemove.sorted(by: { $0 < $1 })
    
    for i in 0 ..< newToRemove.count {
        
        let newI = newToRemove.count - i - 1
//        let newI = i

        if type == "bullets" {
            
//            bullets.remove(at: newToRemove[newI])

            bullets = tryToRemove(array: bullets, value: newToRemove[newI]) as! [Bullet]
            
        } else if type == "deflectedBullets" {
            
//            deflectedBullets.remove(at: newToRemove[newI])
            
            deflectedBullets = tryToRemove(array: deflectedBullets, value: newToRemove[newI]) as! [DeflectedBullet]

        } else if type == "powerups" {
            
//            powerups.remove(at: newToRemove[newI])
            
            powerups = tryToRemove(array: powerups, value: newToRemove[newI]) as! [Powerup]

        } else if type == "stagePowerups" {
            
//            currentStage.powerups.remove(at: newToRemove[newI])
            
            currentStage.powerups = tryToRemove(array: currentStage.powerups, value: newToRemove[newI]) as! [Powerup]

        } else if type == "explosions" {
            
//            explosions.remove(at: newToRemove[newI])
            
            explosions = tryToRemove(array: explosions, value: newToRemove[newI]) as! [Explosion]

        } else if type == "enemies" {
            
            currentStage.enemies[newToRemove[newI]].endTimers()
//            currentStage.enemies.remove(at: newToRemove[newI])
            
            currentStage.enemies = tryToRemove(array: currentStage.enemies, value: newToRemove[newI]) as! [Enemy]

        } else if type == "enemyBullets" {
            
//            enemyBullets.remove(at: newToRemove[newI])
            
            enemyBullets = tryToRemove(array: enemyBullets, value: newToRemove[newI]) as! [EnemyBullet]

        } else if type == "selectedBlocks" {
            
//            selectedBlocks.remove(at: newToRemove[newI])
            
            selectedBlocks = tryToRemove(array: selectedBlocks, value: newToRemove[newI]) as! [Block]

        } else if type == "selectedEnemies" {
            
            selectedEnemies[newToRemove[newI]].endTimers()
//            selectedEnemies.remove(at: newToRemove[newI])
            
            selectedEnemies = tryToRemove(array: selectedEnemies, value: newToRemove[newI]) as! [Enemy]

        } else if type == "selectedEnemySpawners" {
            
            selectedEnemySpawners[newToRemove[newI]].stopSpawning()
//            selectedEnemySpawners.remove(at: newToRemove[newI])
            
            selectedEnemySpawners = tryToRemove(array: selectedEnemySpawners, value: newToRemove[newI]) as! [EnemySpawner]
        }
    }
    
}
