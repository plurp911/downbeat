//
//  GameController+Stages.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {

    func loadLevels() {
        
        let stages = [[Stage(fileName: "1-3"), Stage(fileName: "1-2"), Stage(fileName: "1-2")]]
        
        levels.append(Level(stages: stages))
        
        //        stage.setPlayerStartXY(startX: (screenSize.height * screenRatio) / 2, startY: -Player.height / 2)
//        stage.setPlayerStartXY(startX: Block.width * 3, startY: screenSize.height - Block.height - (Player.height / 2))
        
//        stage.sortObjectArrays()
//        stage.setupSelectedArrays()
        
//        currentStage = stage
    }
    
    func setLevel(level: Level) {
        
        currentLevel = level
        currentStage = level.startStage
        
        currentStage!.setupSelectedArrays()

//        setupStage()
        
        player.reset()
        
        moveTimer = Timer.scheduledTimer(timeInterval: (1 / 120), target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    /*
     
    func loadStages() {
        
//        let blockType: String = "topWoodBlock"
        let blockType: String = "horizontalYellowMiddleBlock"

//        stages.append(Stage())
        
        // SIZE
        
        stages[0].numberOfHorizontalBlocks = 50
//        stages[0].numberOfHorizontalBlocks = 16

        // PLAYER

        stages[0].setPlayerStartXY(startX: (screenSize.height * screenRatio) / 2, startY: -Player.height / 2)

        // BLOCKS
        
        stages[0].blocks.append(Block(xPos: 0, yPos: 14, type: "horizontalYellowLeftBlock"))

        for i in 1 ..< 49 {
            stages[0].blocks.append(Block(xPos: i, yPos: 14, type: blockType))
        }
        
        stages[0].blocks.append(Block(xPos: 49, yPos: 14, type: "horizontalYellowRightBlock"))

        stages[0].blocks.append(Block(xPos: 4, yPos: 12, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 5, yPos: 12, type: blockType))
        stages[0].blocks.append(Block(xPos: 6, yPos: 12, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 4, yPos: 5, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 5, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 6, yPos: 5, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 7, yPos: 13, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 12, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 11, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 10, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 9, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 8, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 7, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 6, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 7, yPos: 5, type: "topLadder"))

        stages[0].blocks.append(Block(xPos: 8, yPos: 5, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 9, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 10, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 11, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 12, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 13, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 14, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 15, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 16, yPos: 5, type: blockType))
        stages[0].blocks.append(Block(xPos: 17, yPos: 5, type: "horizontalYellowRightBlock"))
        
//        stages[0].blocks.append(Block(xPos: 9, yPos: 9, type: "verticalYellowTopBlock"))
//        stages[0].blocks.append(Block(xPos: 9, yPos: 10, type: "verticalYellowBottomBlock"))

        stages[0].blocks.append(Block(xPos: 16, yPos: 12, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 12, type: blockType))
        stages[0].blocks.append(Block(xPos: 18, yPos: 12, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 17, yPos: 11, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 10, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 9, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 8, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 7, type: "ladder"))
        stages[0].blocks.append(Block(xPos: 17, yPos: 6, type: "ladder"))
        
        stages[0].blocks.append(Block(xPos: 18, yPos: 8, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 19, yPos: 8, type: blockType))
        stages[0].blocks.append(Block(xPos: 20, yPos: 8, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 20, yPos: 10, type: "verticalYellowTopBlock"))
        stages[0].blocks.append(Block(xPos: 20, yPos: 11, type: "verticalYellowBottomBlock"))

        stages[0].blocks.append(Block(xPos: 22, yPos: 10, type: "verticalYellowTopBlock"))
        stages[0].blocks.append(Block(xPos: 22, yPos: 11, type: "verticalYellowBottomBlock"))

        stages[0].blocks.append(Block(xPos: 24, yPos: 8, type: "verticalYellowTopBlock"))
        stages[0].blocks.append(Block(xPos: 24, yPos: 9, type: "verticalYellowMiddleBlock"))
        stages[0].blocks.append(Block(xPos: 24, yPos: 10, type: "verticalYellowBottomBlock"))
        
        stages[0].blocks.append(Block(xPos: 27, yPos: 11, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 28, yPos: 11, type: blockType))
        stages[0].blocks.append(Block(xPos: 29, yPos: 11, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 32, yPos: 9, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 33, yPos: 9, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 37, yPos: 9, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 38, yPos: 9, type: blockType))
        stages[0].blocks.append(Block(xPos: 39, yPos: 9, type: blockType))
        stages[0].blocks.append(Block(xPos: 40, yPos: 9, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 44, yPos: 8, type: "horizontalYellowLeftBlock"))
        stages[0].blocks.append(Block(xPos: 45, yPos: 8, type: blockType))
        stages[0].blocks.append(Block(xPos: 46, yPos: 8, type: blockType))
        stages[0].blocks.append(Block(xPos: 47, yPos: 8, type: "horizontalYellowRightBlock"))
        
        stages[0].blocks.append(Block(xPos: 49, yPos: 0, type: "verticalYellowTopBlock"))

        for i in 1 ..< 13 {
            stages[0].blocks.append(Block(xPos: 49, yPos: i, type: "verticalYellowMiddleBlock"))
        }
        
        stages[0].blocks.append(Block(xPos: 49, yPos: 13, type: "verticalYellowBottomBlock"))

        // ENEMIES
        
//        stages[0].enemies.append(Enemy(xPos: 2, yPos: 2, type: "follower"))

//        stages[0].enemies.append(Enemy(xPos: 17, yPos: 11, type: "hat"))

//        stages[0].enemies.append(Enemy(xPos: 16, yPos: 10, type: "penguin"))
        
        // POWERUPS
        
//        stages[0].powerups.append(Powerup(xPos: 0, yPos: 13, type: "largeEnergy"))
//        stages[0].powerups.append(Powerup(xPos: 1, yPos: 13, type: "smallEnergy"))
//        stages[0].powerups.append(Powerup(xPos: 2, yPos: 13, type: "smallHealth"))
//        stages[0].powerups.append(Powerup(xPos: 3, yPos: 13, type: "largeHealth"))
//        stages[0].powerups.append(Powerup(xPos: 4, yPos: 13, type: "smallEnergy"))
//        stages[0].powerups.append(Powerup(xPos: 20, yPos: 13, type: "largeEnergy"))
        
        // ENEMY SPAWNERS
        
        stages[0].enemySpawners.append(EnemySpawner(xPos: 3, yPos: 3, type: "follower"))

        // FINAL SETUP
        
        stages[0].sortObjectArrays()
        stages[0].setupSelectedArrays()

        currentStage = stages[0]
    }
    
    func newLoadStages() {
        
        let stage = Stage(fileName: "1-2")
        
//        stage.setPlayerStartXY(startX: (screenSize.height * screenRatio) / 2, startY: -Player.height / 2)
        stage.setPlayerStartXY(startX: Block.width * 3, startY: screenSize.height - Block.height - (Player.height / 2))

        stage.sortObjectArrays()
        stage.setupSelectedArrays()
        
        currentStage = stage
    }
 
    */
}
