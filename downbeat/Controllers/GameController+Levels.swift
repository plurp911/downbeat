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
    
        // BRICK
        
        tileSet = "sky"

//        let brickStages = [[nil, nil, nil, Stage(fileName: "1-8"), Stage(fileName: "1-9"), Stage(fileName: "1-10")],
//                           [nil, nil, nil, Stage(fileName: "1-7"), nil, nil],
//                           [nil, nil, nil, Stage(fileName: "1-6"), nil, nil],
//                           [nil, Stage(fileName: "1-3"), Stage(fileName: "1-4"), Stage(fileName: "1-5"), nil, nil],
//                           [Stage(fileName: "1-1"), Stage(fileName: "1-2"), nil, nil, nil, nil]]

        let brickStages = [[Stage(fileName: "5-1")]]
        
        // FIRE
        
        tileSet = "fire"

        let fireStages = [[nil, nil, Stage(fileName: "2-7"), Stage(fileName: "2-8"), Stage(fileName: "2-9")],
                          [nil, nil, Stage(fileName: "2-6"), nil, nil],
                          [nil, nil, Stage(fileName: "2-5"), nil, nil],
                          [nil, nil, Stage(fileName: "2-4"), nil, nil],
                          [Stage(fileName: "2-1"), Stage(fileName: "2-2"), Stage(fileName: "2-3"), nil]]
        
        // METAL
        
        tileSet = "metal"

        let metalStages = [[Stage(fileName: "3-1"), Stage(fileName: "3-2"), Stage(fileName: "3-3"), Stage(fileName: "3-4"), nil, nil, nil, nil],
                           [nil, nil, nil, Stage(fileName: "3-5"), nil, nil, nil, nil],
                           [nil, nil, nil, Stage(fileName: "3-6"), nil, nil, nil, nil],
                           [nil, nil, nil, Stage(fileName: "3-7"), Stage(fileName: "3-8"), Stage(fileName: "3-9"), Stage(fileName: "3-10"), Stage(fileName: "3-11")]]
        
        // ICE
        
        tileSet = "ice"

        let iceStages = [[Stage(fileName: "4-1"), Stage(fileName: "4-2"), Stage(fileName: "4-3"), Stage(fileName: "4-4"), nil, nil, nil, nil],
                         [nil, nil, nil, Stage(fileName: "4-5"), Stage(fileName: "4-6"), Stage(fileName: "4-7"), Stage(fileName: "4-8"), Stage(fileName: "4-9")]]
        
        // OTHER
        
        tileSet = "other"

        let otherStages = [[Stage(fileName: "1-1")]]
        
        // LOAD LEVELS
        
        levels.append(Level(stages: brickStages))
        levels.append(Level(stages: fireStages))
        levels.append(Level(stages: metalStages))
        levels.append(Level(stages: iceStages))
        levels.append(Level(stages: otherStages))
    }
    
    func setLevel(level: Level) {
        
        gameView.backgroundColor = gameViewColor

        currentLevel = level
        currentStage = level.startStage
        
        currentLevel!.updateCurrentStagePos()
        currentStage!.setupSelectedArrays()
        
        player.reset()
        
        moveTimer = Timer.scheduledTimer(timeInterval: (1 / 120), target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
}
