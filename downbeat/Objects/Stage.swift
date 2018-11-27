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
    var powerups = [Powerup]()
    var enemySpawners = [EnemySpawner]()

    var playerStartX: CGFloat = 0
    var playerStartY: CGFloat = 0
    
    var blockStartIndex: Int = 0
    var blockEndIndex: Int = 0
    
    var enemyStartIndex: Int = 0
    var enemyEndIndex: Int = 0
    
    var powerupStartIndex: Int = 0
    var powerupEndIndex: Int = 0
    
    var enemySpawnerStartIndex: Int = 0
    var enemySpawnerEndIndex: Int = 0
    
    var x: CGFloat = 0
    
    var numberOfHorizontalBlocks: Int = 0

    var counter: Int = 0
    
    init() {
        
    }
    
    func setPlayerStartXY(startX: CGFloat, startY: CGFloat) {
        
        self.playerStartX = startX
        self.playerStartY = startY
    }
    
    func moveBlocks() {
        
        for i in 0 ..< blocks.count {
            
            self.blocks[i].setX(x: self.x + (((CGFloat)(self.blocks[i].xPos)) * Block.width) + (Block.width / 2))
        }
    }
    
    func moveEnemies() {
        
//        for i in 0 ..< self.enemies.count {
//
//            if self.enemies[i].isInBounds() == false {
//
//                print(counter)
//
//                counter += 1
//
//                self.enemies[i].setXY(x: self.x + (((CGFloat)(self.enemies[i].xPos)) * Block.width) + (Block.width / 2), y: self.enemies[i].y)
//            }
//        }
        
        for enemy in self.enemies {
            
            var isMatch: Bool = false
            
            for otherEnemy in selectedEnemies {
                
                if enemy === otherEnemy {
                    
                    isMatch = true

                    break
                }
            }
            
            if isMatch == false {
                
                enemy.setXY(x: self.x + (((CGFloat)(enemy.xPos)) * Block.width) + (Block.width / 2), y: enemy.y)
            }
        }

    }
    
    func movePowerups() {
        
        for i in 0 ..< self.powerups.count {
            
//            if self.powerups[i].isInBounds() == false {
            
                self.powerups[i].setXY(x: self.x + (((CGFloat)(self.powerups[i].xPos)) * Block.width) + (Block.width / 2), y: self.powerups[i].y)
//            }
        }
        
    }
    
    func moveEnemySpawners() {
        
        for i in 0 ..< enemySpawners.count {
            
            self.enemySpawners[i].setX(x: self.x + (((CGFloat)(self.enemySpawners[i].xPos)) * EnemySpawner.width) + (EnemySpawner.width / 2))
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
    
    func moveObjects() {
        
        self.moveBlocks()
        self.movePowerups()
        self.moveEnemies()
        self.moveEnemySpawners()
    }
    
    func sortObjectArrays() {
        
        self.blocks = self.blocks.sorted(by: { $0.x < $1.x })
        self.enemies = self.enemies.sorted(by: { $0.x < $1.x })
        self.powerups = self.powerups.sorted(by: { $0.x < $1.x })
        self.enemySpawners = self.enemySpawners.sorted(by: { $0.x < $1.x })
    }
    
//    func sortSelectedArrays() {
//
//        selectedBlocks = selectedBlocks.sorted(by: { $0.x < $1.x })
//        selectedEnemies = selectedEnemies.sorted(by: { $0.x < $1.x })
//        selectedPowerups = selectedPowerups.sorted(by: { $0.x < $1.x })
//    }
    
    func setupSelectedArrays() {
        

        
        
        
        
        
        // reset all enemy and enemy spawners to have their timers all stopped...
        
        
        
        
        
        
        selectedBlocks.removeAll()
        selectedEnemies.removeAll()
        selectedPowerups.removeAll()
        selectedEnemySpawners.removeAll()

        for block in self.blocks {
            
            if block.isInBounds() == true {

                selectedBlocks.append(block)
                
            } else {
                
                break
            }
        }
        
        for enemy in self.enemies {
            
            if enemy.isInBounds() == true {
                
                selectedEnemies.append(enemy)
                
            } else {
                
                break
            }
        }
        
        for powerup in self.powerups {
            
            if powerup.isInBounds() == true {
                
                selectedPowerups.append(powerup)
                
            } else {
                
                break
            }
        }
    
        for enemySpawner in self.enemySpawners {
            
            if enemySpawner.isInBounds() == true {
                
                enemySpawner.startSpawning()
                
                selectedEnemySpawners.append(enemySpawner)
                
            } else {
                
                break
            }
        }
        
    }
    
    func updateObjectArrays(direction: String) {
        
        self.updateBlocks(direction: direction)
        self.updateEnemies(direction: direction)
        self.updatePowerups(direction: direction)
        self.updateEnemySpawners(direction: direction)
    }
    
    func isMatch(object: AnyObject, objectArray: [AnyObject]) -> Bool {
        
        for otherObject in objectArray {
            
            if object === otherObject {
                
                return true
            }
        }
        
        return false
    }
    
    func getMatchPos(object: AnyObject, objectArray: [AnyObject]) -> Int {
        
        for i in 0 ..< objectArray.count {
            
            if object === objectArray[i] {
                
                return i
            }
        }
        
        return -1
    }
    
    func updateBlocks(direction: String) {

        var isInBounds: Bool = false
        
        var selectedToRemove = [Int]()
        
        if direction == "left" {
            
            repeat {
                
                isInBounds = false
                
                if self.blockStartIndex >= 0 && self.blockStartIndex < self.blocks.count {
                    
                    if self.blocks[self.blockStartIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        selectedBlocks.insert(self.blocks[self.blockStartIndex], at: 0)
                        
                        if self.blockStartIndex > 0 {
                            
                            self.blockStartIndex -= 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.blocks.count {
                
                let newI: Int = self.blocks.count - i - 1
                
                if self.blocks[newI].isInBounds() == true {
                    
                    self.blockEndIndex = newI
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.blocks[newI], objectArray: selectedBlocks)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
            
        } else if direction == "right" {
            
            repeat {
                
                isInBounds = false
                
                if self.blockEndIndex < self.blocks.count && self.blockEndIndex >= 0 {
                    
                    if self.blocks[self.blockEndIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        selectedBlocks.append(self.blocks[self.blockEndIndex])
                        
                        if self.blockEndIndex < self.blocks.count - 1 {
                            
                            self.blockEndIndex += 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)

            for i in 0 ..< self.blocks.count {
                
                if self.blocks[i].isInBounds() == true {
                    
                    self.blockStartIndex = i
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.blocks[i], objectArray: selectedBlocks)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
        }
        
//        sortObjectArrays()
//        sortSelectedArrays()

        removeObjects(type: "selectedBlocks", toRemove: selectedToRemove)
    }
    
    func updatePowerups(direction: String) {
        
        var isInBounds: Bool = false
        
        var selectedToRemove = [Int]()
        
        if direction == "left" {
            
            repeat {
                
                isInBounds = false
                
                if self.powerupStartIndex >= 0 && self.powerupStartIndex < self.powerups.count {
                    
                    if self.powerups[self.powerupStartIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        if self.powerups[self.powerupStartIndex].isUsed == false {
                            
                            if isMatch(object: self.powerups[self.powerupStartIndex], objectArray: selectedPowerups) == false {
                                
                                selectedPowerups.insert(self.powerups[self.powerupStartIndex], at: 0)
                            }
                        }
                        
                        if self.powerupStartIndex > 0 {
                            
                            self.powerupStartIndex -= 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.powerups.count {
                
                let newI: Int = self.powerups.count - i - 1
                
                if self.powerups[newI].isInBounds() == true {
                    
                    self.powerupEndIndex = newI
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.powerups[newI], objectArray: selectedPowerups)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
            
        } else if direction == "right" {
            
            repeat {
                
                isInBounds = false
                
                if self.powerupEndIndex < self.powerups.count && self.powerupEndIndex >= 0 {
                    
                    if self.powerups[self.powerupEndIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        if self.powerups[self.powerupEndIndex].isUsed == false {

                            if isMatch(object: self.powerups[self.powerupEndIndex], objectArray: selectedPowerups) == false {
                                
                                selectedPowerups.append(self.powerups[self.powerupEndIndex])
                            }
                        }
                        
                        if self.powerupEndIndex < self.powerups.count - 1 {
                            
                            self.powerupEndIndex += 1
                            
                        } else {
                            
                            break
                        }

                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.powerups.count {
                
                if self.powerups[i].isInBounds() == true {
                    
                    self.powerupStartIndex = i
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.powerups[i], objectArray: selectedPowerups)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
        }

//        sortObjectArrays()
//        sortSelectedArrays()
        
        removeObjects(type: "selectedPowerups", toRemove: selectedToRemove)
    }
    
    func updateEnemies(direction: String) {

        var isInBounds: Bool = false
        
        var selectedToRemove = [Int]()
        
        if direction == "left" {
            
            repeat {
                
                isInBounds = false
                
                if self.enemyStartIndex >= 0 && self.enemyStartIndex < self.enemies.count {
                    
                    if self.enemies[self.enemyStartIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        if self.enemies[self.enemyStartIndex].isUsed == false {
                            
                            if isMatch(object: self.enemies[self.enemyStartIndex], objectArray: selectedEnemies) == false {
                                
                                selectedEnemies.insert(self.enemies[self.enemyStartIndex], at: 0)
                            }
                        }
                        
                        if self.enemyStartIndex > 0 {
                            
                            self.enemyStartIndex -= 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.enemies.count {
                
                let newI: Int = self.enemies.count - i - 1
                
                if self.enemies[newI].isInBounds() == true {
                    
                    self.enemyEndIndex = newI
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.enemies[newI], objectArray: selectedEnemies)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }

        } else if direction == "right" {
            
            repeat {
                
                isInBounds = false
                
                if self.enemyEndIndex < self.enemies.count && self.enemyEndIndex >= 0 {
                    
                    if self.enemies[self.enemyEndIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        if self.enemies[self.enemyEndIndex].isUsed == false {
                            
                            if isMatch(object: self.enemies[self.enemyEndIndex], objectArray: selectedEnemies) == false {
                                
                                selectedEnemies.append(self.enemies[self.enemyEndIndex])
                            }
                        }
                        
                        if self.enemyEndIndex < self.enemies.count - 1 {
                            
                            self.enemyEndIndex += 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.enemies.count {
                
                if self.enemies[i].isInBounds() == true {
                    
                    self.enemyStartIndex = i
                    
                    break

                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.enemies[i], objectArray: selectedEnemies)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
        }
        
//        sortObjectArrays()
//        sortSelectedArrays()
        
        self.enemies = self.enemies.sorted(by: { $0.x < $1.x })
        selectedEnemies = selectedEnemies.sorted(by: { $0.x < $1.x })

        removeObjects(type: "selectedEnemies", toRemove: selectedToRemove)
    }
    
    func updateEnemySpawners(direction: String) {
        
        var isInBounds: Bool = false
        
        var selectedToRemove = [Int]()
        
        if direction == "left" {
            
            repeat {
                
                isInBounds = false
                
                if self.enemySpawnerStartIndex >= 0 && self.enemySpawnerStartIndex < self.enemySpawners.count {
                    
                    if self.enemySpawners[self.enemySpawnerStartIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        self.enemySpawners[self.enemySpawnerStartIndex].startSpawning()
                        
                        selectedEnemySpawners.insert(self.enemySpawners[self.enemySpawnerStartIndex], at: 0)
                        
                        if self.enemySpawnerStartIndex > 0 {
                            
                            self.enemySpawnerStartIndex -= 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.enemySpawners.count {
                
                let newI: Int = self.enemySpawners.count - i - 1
                
                if self.enemySpawners[newI].isInBounds() == true {
                    
                    self.enemySpawnerEndIndex = newI
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.enemySpawners[newI], objectArray: selectedEnemySpawners)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
            
        } else if direction == "right" {
            
            repeat {
                
                isInBounds = false
                
                if self.enemySpawnerEndIndex < self.enemySpawners.count && self.enemySpawnerEndIndex >= 0 {
                    
                    if self.enemySpawners[self.enemySpawnerEndIndex].isInBounds() == true {
                        
                        isInBounds = true
                        
                        self.enemySpawners[self.enemySpawnerEndIndex].startSpawning()
                        
                        selectedEnemySpawners.append(self.enemySpawners[self.enemySpawnerEndIndex])
                        
                        if self.enemySpawnerEndIndex < self.enemySpawners.count - 1 {
                            
                            self.enemySpawnerEndIndex += 1
                            
                        } else {
                            
                            break
                        }
                        
                    }
                }
                
            } while (isInBounds == true)
            
            for i in 0 ..< self.enemySpawners.count {
                
                if self.enemySpawners[i].isInBounds() == true {
                    
                    self.enemySpawnerStartIndex = i
                    
                    break
                    
                } else {
                    
                    let matchPos: Int = getMatchPos(object: self.enemySpawners[i], objectArray: selectedEnemySpawners)
                    
                    if matchPos >= 0 {
                        selectedToRemove.append(matchPos)
                    }
                }
                
            }
        }
        
        removeObjects(type: "selectedEnemySpawners", toRemove: selectedToRemove)
    }
}
