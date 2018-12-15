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

let chanceOfPowerup: CGFloat = 0.25

// COLORS

let backgroundColor = UIColor.black

let mainButtonColor = UIColor.gray.withAlphaComponent(0.35)
let mainButtonOtherColor = UIColor.lightGray.withAlphaComponent(0.7)
let mainButtonTextColor = UIColor.white

//let gameViewColor = UIColor(red: 32 / 255, green: 56 / 255, blue: 236 / 255, alpha: 1)
//let gameViewColor = UIColor(red: 101 / 255, green: 208 / 255, blue: 223 / 255, alpha: 1)
//let gameViewColor = UIColor(red: 95 / 255, green: 63 / 255, blue: 20 / 255, alpha: 1)
//let gameViewColor = UIColor(red: 75 / 255, green: 125 / 255, blue: 223 / 255, alpha: 1)
//let gameViewColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
let gameViewColor = UIColor(red: 75 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)

// VARIABLES

var levels = [Level]()

var bullets = [Bullet]()
var explosions = [Explosion]()
var powerups = [Powerup]()
var enemyBullets = [EnemyBullet]()
var deflectedBullets = [DeflectedBullet]()

var selectedBlocks = [Block]()
var selectedBackgrounds = [Background]()
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

var currentStageXPos: Int = -1
var currentStageYPos: Int = -1

var isTransitioningRight: Bool = false
var isTransitioningUp: Bool = false
var isTransitioningDown: Bool = false

var lives: Int = 3

// OBJECTS

var currentLevel: Level?

var currentStage: Stage?
var nextStage: Stage?

var player = Player()

var joystick = Joystick()

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

        if type == "bullets" {
            
            bullets[newToRemove[newI]].useEnergyTimer.invalidate()
            
            bullets = tryToRemove(array: bullets, value: newToRemove[newI]) as! [Bullet]
            
        } else if type == "deflectedBullets" {
            
            deflectedBullets = tryToRemove(array: deflectedBullets, value: newToRemove[newI]) as! [DeflectedBullet]

        } else if type == "powerups" {
            
            powerups = tryToRemove(array: powerups, value: newToRemove[newI]) as! [Powerup]

        } else if type == "explosions" {
            
            explosions = tryToRemove(array: explosions, value: newToRemove[newI]) as! [Explosion]

        } else if type == "enemies" {
            
            currentStage!.enemies[newToRemove[newI]].endTimers()
            
            currentStage!.enemies = tryToRemove(array: currentStage!.enemies, value: newToRemove[newI]) as! [Enemy]

        } else if type == "enemyBullets" {
            
            enemyBullets = tryToRemove(array: enemyBullets, value: newToRemove[newI]) as! [EnemyBullet]

        } else if type == "selectedBlocks" {
            
            selectedBlocks = tryToRemove(array: selectedBlocks, value: newToRemove[newI]) as! [Block]

        } else if type == "selectedBackgrounds" {
            
            selectedBackgrounds = tryToRemove(array: selectedBackgrounds, value: newToRemove[newI]) as! [Background]
            
        } else if type == "selectedEnemies" {
            
            selectedEnemies[newToRemove[newI]].isUsed = true

            selectedEnemies[newToRemove[newI]].endTimers()
            
            selectedEnemies = tryToRemove(array: selectedEnemies, value: newToRemove[newI]) as! [Enemy]

        } else if type == "selectedEnemySpawners" {
            
            selectedEnemySpawners[newToRemove[newI]].stopSpawning()
            
            selectedEnemySpawners = tryToRemove(array: selectedEnemySpawners, value: newToRemove[newI]) as! [EnemySpawner]
            
        } else if type == "selectedPowerups" {
            
            selectedPowerups[newToRemove[newI]].isUsed = true
            
            selectedPowerups = tryToRemove(array: selectedPowerups, value: newToRemove[newI]) as! [Powerup]
        }
    }
    
}

public func distance(x1: CGFloat, y1: CGFloat, x2: CGFloat, y2: CGFloat) -> CGFloat {
    let xDist = x1 - x2
    let yDist = y1 - y2
    return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
}

public func moveDirection(direction: String) {
    
    if direction == "up" {
        
        isUpPressed = true
        isDownPressed = false
        isLeftPressed = false
        isRightPressed = false
        
    } else if direction == "down" {
        
        isUpPressed = false
        isDownPressed = true
        isLeftPressed = false
        isRightPressed = false
        
    } else if direction == "left" {
        
        isUpPressed = false
        isDownPressed = false
        isLeftPressed = true
        isRightPressed = false
        
    } else if direction == "right" {
        
        isUpPressed = false
        isDownPressed = false
        isLeftPressed = false
        isRightPressed = true
        
    } else if direction == "none" {
        
        isUpPressed = false
        isDownPressed = false
        isLeftPressed = false
        isRightPressed = false
    }
}

// PUBLIC EXTENSIONS

extension String {
    
    func capitalizingFirstLetter() -> String {
//        return prefix(1).uppercased() + self.lowercased().dropFirst()
        return prefix(1).uppercased() + self.dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
