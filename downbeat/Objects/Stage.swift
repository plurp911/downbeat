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

    var playerStartX: CGFloat = -1
    var playerStartY: CGFloat = -1
    
    var blockStartIndex: Int = 0
    var blockEndIndex: Int = 0
    
    var enemyStartIndex: Int = 0
    var enemyEndIndex: Int = 0
    
    var powerupStartIndex: Int = 0
    var powerupEndIndex: Int = 0
    
    var enemySpawnerStartIndex: Int = 0
    var enemySpawnerEndIndex: Int = 0
    
    var x: CGFloat = 0
    var y: CGFloat = 0

    var numberOfHorizontalBlocks: Int = 0

    var counter: Int = 0
    
    var textArray = [[String]]()
    
    var canEnterFromTop: Bool = false
    var canEnterFromBottom: Bool = false
    var canEnterFromLeft: Bool = false
    
    var tileSet: String = "cut"
    
    init(fileName: String) {
        
        let path = Bundle.main.path(forResource: fileName, ofType: "txt")
        
        for _ in 0 ..< numberOfVerticalBricks {
            textArray.append([""])
        }
        
        do {
            
            let text = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            
            var stageText = text.components(separatedBy: "\n")
            
            stageText.removeLast()
            
            for i in 0 ..< stageText.count {
                
                stageText[i].removeLast()
                
                let newText = stageText[i].components(separatedBy: ".")

                textArray[i] = newText
                textArray[i].removeLast()
            }
            
        } catch let error { print(error) }
                
        self.numberOfHorizontalBlocks = textArray[0].count
        
        for i in 0 ..< textArray.count {
            for j in 0 ..< textArray[i].count {
                
                let text = textArray[i][j]
                                
                if text == "#" {
                    
//                    if isEqual(i: i - 1, j: j, block: "#") && isEqual(i: i + 1, j: j, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "verticalYellowMiddleBlock"))
//
//                    } else if isEqual(i: i, j: j - 1, block: "#") && isEqual(i: i, j: j + 1, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "horizontalYellowMiddleBlock"))
//
//                    } else if isEqual(i: i, j: j - 1, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "horizontalYellowRightBlock"))
//
//                    } else if isEqual(i: i, j: j + 1, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "horizontalYellowLeftBlock"))
//
//                    } else if isEqual(i: i - 1, j: j, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "verticalYellowBottomBlock"))
//
//                    } else if isEqual(i: i + 1, j: j, block: "#") {
//
//                        blocks.append(Block(xPos: j, yPos: i, type: "verticalYellowTopBlock"))
//                    }
                    
                    if isEqual(i: i - 1, j: j, block: "#") == false && i > 0 {
                        
                        blocks.append(Block(xPos: j, yPos: i, type: "top", tileSet: tileSet))
                        
                    } else {
                        
                        if j % 2 == 0 {
                            blocks.append(Block(xPos: j, yPos: i, type: "1", tileSet: tileSet))
                        } else {
                            blocks.append(Block(xPos: j, yPos: i, type: "2", tileSet: tileSet))
                        }
                    }

                } else if text == "=" {
                    
                    if isEqual(i: i - 1, j: j, block: "=") {
                        blocks.append(Block(xPos: j, yPos: i, type: "ladder", tileSet: tileSet))
                    } else {
                        blocks.append(Block(xPos: j, yPos: i, type: "topLadder", tileSet: tileSet))
                    }
                    
                } else if text == "^" {
//                    blocks.append(Block(xPos: j, yPos: i, type: "spike", tileSet: tileSet))
                } else if text == "I" {
                    
                    if isEqual(i: i - 1, j: j, block: "#") {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "eye", direction: "down"))
                    } else {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "eye", direction: "up"))
                    }
                    
                } else if text == "i" {
                    
                    if isEqual(i: i, j: j - 1, block: "#") {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "eye", direction: "right"))
                    } else {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "eye", direction: "left"))
                    }
                    
                } else if text == "t" {
                    
                    if isEqual(i: i, j: j - 1, block: "#") {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "turret", direction: "right"))
                    } else {
                        enemies.append(Enemy(xPos: j, yPos: i, type: "turret", direction: "left"))
                    }
                    
                } else if text == "N" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "snake", direction: "right"))
                } else if text == "n" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "snake", direction: "left"))
                } else if text == "D" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "drop", direction: "right"))
                } else if text == "d" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "drop", direction: "left"))
                } else if text == "k" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "sprinkler"))
                } else if text == "H" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "hat", direction: "right"))
                } else if text == "h" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "hat", direction: "left"))
                } else if text == "F" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "follower"))
                } else if text == "f" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "foot"))
                } else if text == "P" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "penguin", direction: "right"))
                } else if text == "p" {
                    enemies.append(Enemy(xPos: j, yPos: i, type: "penguin", direction: "left"))
                } else if text == "S" {
                    enemySpawners.append(EnemySpawner(xPos: j, yPos: i, type: "follower"))
                } else if text == "1" {
                    powerups.append(Powerup(xPos: j, yPos: i, type: "smallHealth"))
                } else if text == "2" {
                    powerups.append(Powerup(xPos: j, yPos: i, type: "largeHealth"))
                } else if text == "8" {
                    powerups.append(Powerup(xPos: j, yPos: i, type: "smallEnergy"))
                } else if text == "9" {
                    powerups.append(Powerup(xPos: j, yPos: i, type: "largeEnergy"))
                } else if text == "5" {
                    powerups.append(Powerup(xPos: j, yPos: i, type: "extraLife"))
                } else if text == ":" {
                    self.setPlayerStartXYPos(startXPos: j, startYPos: i)
                } else if text == "T" {
                    self.canEnterFromTop = true
                } else if text == "B" {
                    self.canEnterFromBottom = true
                } else if text == "L" {
                    self.canEnterFromLeft = true
                }
                
            }
        }
        
        self.sortObjectArrays()
    }
    
    func setPlayerStartXYPos(startXPos: Int, startYPos: Int) {
        
        self.playerStartX = ((CGFloat)(startXPos) * Block.width) + (Block.width / 2)
        self.playerStartY = ((CGFloat)(startYPos) * Block.height) + (Block.height / 2)
    }
    
    func isInBounds(i: Int, j: Int) -> Bool {
        
        if i >= 0 && i < textArray.count && j >= 0 && j < textArray[i].count {
            return true
        }
        
        return false
    }
    
    func isEqual(i: Int, j: Int, block: String) -> Bool {
        
        if isInBounds(i: i, j: j) == true {
            
            if textArray[i][j] == block {
                
                return true
            }
        }
        
        return false
    }
    
    func moveBlocks() {
        
        for i in 0 ..< blocks.count {
            
//            self.blocks[i].setX(x: self.x + (((CGFloat)(self.blocks[i].xPos)) * Block.width) + (Block.width / 2))
            self.blocks[i].setXY(x: self.x + (((CGFloat)(self.blocks[i].xPos)) * Block.width) + (Block.width / 2), y: self.y + (((CGFloat)(self.blocks[i].yPos)) * Block.height) + (Block.height / 2))
        }
    }
    
    func moveEnemies() {
        
        for enemy in self.enemies {
            
            var isMatch: Bool = false
            
            for otherEnemy in selectedEnemies {
                
                if enemy === otherEnemy {
                    
                    isMatch = true

                    break
                }
            }
            
            if isMatch == false {
                
                enemy.setXY(x: self.x + (((CGFloat)(enemy.xPos)) * Block.width) + (Block.width / 2), y: self.y + (((CGFloat)(enemy.yPos)) * Block.height) + Block.height - (enemy.height / 2))
            }
        }

    }
    
    func movePowerups() {
        
        for i in 0 ..< self.powerups.count {
            
//            if self.powerups[i].isInBounds() == false {
            
            self.powerups[i].setXY(x: self.x + (((CGFloat)(self.powerups[i].xPos)) * Block.width) + (Block.width / 2), y: self.y + (((CGFloat)(self.powerups[i].yPos)) * Block.height) + Block.height - (self.powerups[i].height / 2))
//            }
        }
        
    }
    
    func moveEnemySpawners() {
        
        for i in 0 ..< enemySpawners.count {
            
            self.enemySpawners[i].setXY(x: self.x + (((CGFloat)(self.enemySpawners[i].xPos)) * Block.width) + (Block.width / 2), y: self.y + (((CGFloat)(self.enemySpawners[i].yPos)) * Block.height) + (Block.height / 2))
        }
    }
    
//    func reset() {
//
//        self.x = 0
//
//        self.moveBlocks()
//    }
    
    func setupAsNextStage(direction: String) {
        
        if direction == "right" {
            
            self.x = screenSize.height * screenRatio
            
            self.moveObjects()
            self.updateObjectArrays(direction: "right")
            
        } else if direction == "up" {
            
//            self.x = 0
            self.y = -screenSize.height
            
            self.moveObjects()
            //            self.updateObjectArrays(direction: direction)
            
//            self.beginSelectedArrays()
            
            for block in self.blocks {
                
                if block.isInBounds() == true {
                    
                    selectedBlocks.append(block)
                    
                } else {
                    
                    break
                }
            }
            
//            self.sortSelectedArrays()
            
        } else if direction == "down" {
            
//            self.x = 0
            self.y = screenSize.height
            
            self.moveObjects()
//            self.updateObjectArrays(direction: direction)
            
//            self.beginSelectedArrays()
            
            for block in self.blocks {
                
                if block.isInBounds() == true {
                    
                    selectedBlocks.append(block)
                    
                } else {
                    
                    break
                }
            }
            
//            self.sortSelectedArrays()
        }
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
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            // make speed for movement a set constabnt if transitioning right...
            // or set player.is knocked back to false when strating transitioning...
            
            // make it impossible to transition from being hit... <- BEST
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if player.isKnockedBack == true {
                self.x -= Player.knockBackMoveSpeed
            } else {
                self.x -= Player.maxMoveSpeed
            }
            
//            if self.x <= 0 {
//                self.x = 0
//            }
            
        } else if direction == "up" {
            
            self.y += Player.maxMoveSpeed
            
        } else if direction == "down" {
            
            self.y -= Player.maxMoveSpeed
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
    
    func sortSelectedArrays() {

        selectedBlocks = selectedBlocks.sorted(by: { $0.x < $1.x })
        selectedEnemies = selectedEnemies.sorted(by: { $0.x < $1.x })
        selectedPowerups = selectedPowerups.sorted(by: { $0.x < $1.x })
        selectedEnemySpawners = selectedEnemySpawners.sorted(by: { $0.x < $1.x })
    }
    
    func setupSelectedArrays() {
        
        selectedBlocks.removeAll()
        selectedEnemies.removeAll()
        selectedPowerups.removeAll()
        selectedEnemySpawners.removeAll()

        beginSelectedArrays()
    }
    
    func beginSelectedArrays() {
        
        for block in self.blocks {
            
            if block.isInBounds() == true {
                
                selectedBlocks.append(block)
                
            } else {
                
                break
            }
        }
        
        for enemy in self.enemies {
            
            if enemy.isInBounds() == true {
                
                enemy.reset()
                enemy.startTimers()
                
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
                        
                        if isMatch(object: self.blocks[self.blockStartIndex], objectArray: selectedBlocks) == false {
                            
                            selectedBlocks.insert(self.blocks[self.blockStartIndex], at: 0)
                        }
                        
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
                        
                        if isMatch(object: self.blocks[self.blockEndIndex], objectArray: selectedBlocks) == false {

                            selectedBlocks.append(self.blocks[self.blockEndIndex])
                        }
                        
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
                                
                                self.enemies[self.enemyEndIndex].reset()
                                self.enemies[self.enemyStartIndex].startTimers()
                                
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
                        
                    } else {
                        
                        self.enemies[newI].reset()
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
                                
                                self.enemies[self.enemyEndIndex].reset()
                                self.enemies[self.enemyEndIndex].startTimers()

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
                        
                    } else {
                        
                        self.enemies[i].reset()
                    }
                }
                
            }
        }

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
                        
                        if isMatch(object: self.enemySpawners[self.enemySpawnerStartIndex], objectArray: selectedEnemySpawners) == false {

                            self.enemySpawners[self.enemySpawnerStartIndex].startSpawning()
                            
                            selectedEnemySpawners.insert(self.enemySpawners[self.enemySpawnerStartIndex], at: 0)
                        }
                        
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
                        
                        if isMatch(object: self.enemySpawners[self.enemySpawnerEndIndex], objectArray: selectedEnemySpawners) == false {
                            
                            self.enemySpawners[self.enemySpawnerEndIndex].startSpawning()
                            
                            selectedEnemySpawners.append(self.enemySpawners[self.enemySpawnerEndIndex])
                        }
                        
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
