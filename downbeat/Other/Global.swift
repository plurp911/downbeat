//
//  Global.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit
//import Darwin
//import Foundation
import AudioToolbox
import AVFoundation

// CONSTANTS

let screenSize = UIScreen.main.bounds

var numberOfVerticalBricks: Int = 15

let maxBullets: Int = 3

let screenRatio: CGFloat = 16 / 15

let chanceOfPowerup: CGFloat = 0.25

// COLORS

let backgroundColor = UIColor(red: 20 / 255, green: 20 / 255, blue: 20 / 255, alpha: 1)

let mainButtonColor = UIColor.gray.withAlphaComponent(0.35)
let mainButtonOtherColor = UIColor.lightGray.withAlphaComponent(0.7)
let mainButtonTextColor = UIColor.white

let pausedButtonColor = UIColor(red: 25 / 255, green: 175 / 255, blue: 28 / 255, alpha: 1)
let pausedButtonOtherColor = UIColor(red: 25 / 255, green: 128 / 255, blue: 28 / 255, alpha: 1)

let purchaseButtonColor = UIColor(red: 25 / 255, green: 175 / 255, blue: 28 / 255, alpha: 1)
let purchaseButtonOtherColor = UIColor(red: 25 / 255, green: 128 / 255, blue: 28 / 255, alpha: 1)

let settingsButtonColor = UIColor(red: 25 / 255, green: 175 / 255, blue: 28 / 255, alpha: 1)
let settingsButtonOtherColor = UIColor(red: 25 / 255, green: 128 / 255, blue: 28 / 255, alpha: 1)

let stageSelectViewColor = UIColor(red: 25 / 255, green: 128 / 255, blue: 28 / 255, alpha: 1)

let titleViewColor = UIColor(red: 14 / 255, green: 74 / 255, blue: 20 / 255, alpha: 1)

// VARIABLES

var players = [AVAudioPlayer?]()

var musicPlayer: AVAudioPlayer?

var isMusicMuted: Bool = false
var isSoundMuted: Bool = false

//var didPurchaseFullGame: Bool = false
var didPurchaseFullGame: Bool = true

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

var isLeftPressed: Bool = false
var isRightPressed: Bool = false
var isUpPressed: Bool = false
var isDownPressed: Bool = false

var isPaused: Bool = false
var isLoading: Bool = false

var currentStageXPos: Int = -1
var currentStageYPos: Int = -1

var isTransitioningRight: Bool = false
var isTransitioningUp: Bool = false
var isTransitioningDown: Bool = false

var lives: Int = 3

var gameViewColor: UIColor = UIColor.clear

var tileSet: String = ""

var time: CGFloat = 0

var completedLevels: [Bool] = [false, false, false, false, false, false, false, false]
//var completedLevels: [Bool] = [true, true, false, false, false, true, false, true]

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

public func tryToRemovePlayer(array: [AVAudioPlayer?], value: Int) -> [AVAudioPlayer?] {
    
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
            
        } else if type == "players" {
            
            players[newToRemove[newI]]?.stop()
            
            players = tryToRemovePlayer(array: players, value: newToRemove[newI]) as! [AVAudioPlayer?]
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

public func isMatch(object: AnyObject, objectArray: [AnyObject]) -> Bool {
    
    for otherObject in objectArray {
        
        if object === otherObject {
            
            return true
        }
    }
    
    return false
}

public func getTimerFireTime(timer: Timer) -> CGFloat {
    
    if timer.isValid == true {
        
        let currentDateMilliseconds = (NSDate().timeIntervalSince1970 * 1000.0).rounded()
        let TimerDateMilliseconds = (timer.fireDate.timeIntervalSince1970 * 1000.0).rounded()
        
        return CGFloat(TimerDateMilliseconds - currentDateMilliseconds) / 1000.0
    }
    
    return -1
}

public func newVal(oldVal: CGFloat) -> CGFloat {
    
    let ratio: CGFloat = oldVal / ((CGFloat)(375))
    
    let newVal: CGFloat = ratio * screenSize.height
    
    return newVal
}

public func playSound(name: String) {
    
    if isSoundMuted == false {
        
        let url = Bundle.main.url(forResource: name, withExtension: "wav")!
        
        do {
            
            var playersToRemove = [Int]()
            
            playersToRemove.removeAll()
            
            for i in 0 ..< players.count {
                
                players[i] = try AVAudioPlayer(contentsOf: url)
                guard let audioPlayer = players[i] else { return }
                
                if audioPlayer.isPlaying == false {
                    
                    playersToRemove.append(i)
                }
            }
            
            removeObjects(type: "players", toRemove: playersToRemove)
            
            if name != "scooper" && name != "electricity" && name != "foot" {
                
                if players.count >= 3 {
                    
                    repeat {
                        
                        players[0]?.stop()
                        players.remove(at: 0)
                        
                    } while players.count >= 3
                }
                
            }
            
            let nextPlayer: AVAudioPlayer?
            
            nextPlayer = try AVAudioPlayer(contentsOf: url)
            guard let newPlayer = nextPlayer else { return }
            
            var volume: Float = 0
            
            if name == "explosion" {
                volume = 1.0
            } else if name == "land" {
                volume = 1.0
            } else if name == "menu" {
                volume = 1.0
            } else if name == "shoot" {
                volume = 1.0
            } else if name == "shoot2" {
                volume = 1.0
            } else if name == "hit" {
                volume = 1.0
            } else if name == "hit2" {
                volume = 1.0
            } else if name == "death" {
                volume = 1.0
            } else if name == "death2" {
                volume = 1.0
            } else if name == "health" {
                volume = 1.0
            } else if name == "energy" {
                volume = 1.0
            } else if name == "deflect" {
                volume = 1.0
            } else if name == "throw" {
                volume = 1.0
            } else if name == "throw2" {
                volume = 1.0
            } else if name == "jumper" {
                volume = 1.0
            } else if name == "miner" {
                volume = 1.0
            } else if name == "scooper" {
                volume = 1.0
            } else if name == "electricity" {
                volume = 1.0
            } else if name == "drop" {
                volume = 1.0
            } else if name == "spawn" {
                volume = 1.0
            } else if name == "spread" {
                volume = 1.0
            } else if name == "foot" {
                volume = 1.0
            } else if name == "eye" {
                volume = 1.0
            } else {
                print("PLAY SOUND ERROR")
            }
            
            if isLoading == false && isTransitioningUp == false && isTransitioningDown == false && isTransitioningRight == false {
                
                if players.count < 3 {
                    
                    newPlayer.volume = volume
                    
                    newPlayer.prepareToPlay()
                    newPlayer.play()
                    
                    players.append(newPlayer)
                }
            }
            
        } catch let error as NSError {
            print(error.description)
        }
        
    }
}

// PUBLIC EXTENSIONS

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
