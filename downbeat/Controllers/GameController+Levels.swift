//
//  GameController+Levels.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {
    
    func loadLevels() {
        
        // BRICK
        
        tileSet = "brick"
        
        let brickStages = [[nil, nil, nil, Stage(fileName: "1-8"), Stage(fileName: "1-9"), Stage(fileName: "1-10")],
                           [nil, nil, nil, Stage(fileName: "1-7"), nil, nil],
                           [nil, nil, nil, Stage(fileName: "1-6"), nil, nil],
                           [nil, Stage(fileName: "1-3"), Stage(fileName: "1-4"), Stage(fileName: "1-5"), nil, nil],
                           [Stage(fileName: "1-1"), Stage(fileName: "1-2"), nil, nil, nil, nil]]
        
        
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
        
        // EYE, TURRET
        
        tileSet = "sky"
        
        let skyStages = [[Stage(fileName: "5-11"), Stage(fileName: "5-12"), Stage(fileName: "5-13")],
                         [Stage(fileName: "5-10"), nil, nil],
                         [Stage(fileName: "5-9"), nil, nil],
                         [Stage(fileName: "5-8"), nil, nil],
                         [Stage(fileName: "5-7"), nil, nil],
                         [Stage(fileName: "5-6"), nil, nil],
                         [Stage(fileName: "5-5"), nil, nil],
                         [Stage(fileName: "5-4"), nil, nil],
                         [Stage(fileName: "5-3"), nil, nil],
                         [Stage(fileName: "5-2"), nil, nil],
                         [Stage(fileName: "5-1"), nil, nil]]
        
        // TOP MAKER, SHELL
        
        tileSet = "snow"
        
        let snowStages = [[Stage(fileName: "6-1"), nil, nil, nil, nil, nil],
                          [Stage(fileName: "6-2"), nil, nil, Stage(fileName: "6-11"), Stage(fileName: "6-12"), Stage(fileName: "6-13")],
                          [Stage(fileName: "6-3"), Stage(fileName: "6-8"), Stage(fileName: "6-9"), Stage(fileName: "6-10"), nil, nil],
                          [Stage(fileName: "6-4"), Stage(fileName: "6-7"), nil, nil, nil, nil],
                          [Stage(fileName: "6-5"), Stage(fileName: "6-6"), nil, nil, nil, nil]]
        
        // SCOOPER, SPRINKLER
        
        tileSet = "water"
        
        let waterStages = [[nil, Stage(fileName: "7-8"), Stage(fileName: "7-9"), Stage(fileName: "7-10"), Stage(fileName: "7-11")],
                           [nil, Stage(fileName: "7-7"), nil, nil, nil],
                           [nil, Stage(fileName: "7-6"), nil, nil, nil],
                           [nil, Stage(fileName: "7-5"), nil, nil, nil],
                           [Stage(fileName: "7-3"), Stage(fileName: "7-4"), nil, nil, nil],
                           [Stage(fileName: "7-2"), nil, nil, nil, nil],
                           [Stage(fileName: "7-1"), nil, nil, nil, nil]]
        
        // JUMPER, SNAKE
        
        tileSet = "sand"
        
        let sandStages = [[nil, nil, Stage(fileName: "8-9"), Stage(fileName: "8-10"), Stage(fileName: "8-11")],
                          [nil, nil, Stage(fileName: "8-8"), nil, nil],
                          [Stage(fileName: "8-3"), Stage(fileName: "8-4"), Stage(fileName: "8-7"), nil, nil],
                          [Stage(fileName: "8-2"), Stage(fileName: "8-5"), Stage(fileName: "8-6"), nil, nil],
                          [Stage(fileName: "8-1"), nil, nil, nil, nil]]
        
        // FINAL
        
        tileSet = "chemical"
        
        let chemicalStages = [[Stage(fileName: "9-1"), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                              [Stage(fileName: "9-2"), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                              [Stage(fileName: "9-3"), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                              [Stage(fileName: "9-4"), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                              [Stage(fileName: "9-5"), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
                              [Stage(fileName: "9-6"), nil, nil, nil, nil, nil, nil, nil, nil, nil, Stage(fileName: "9-26"), Stage(fileName: "9-27"), Stage(fileName: "9-28")],
                              [Stage(fileName: "9-7"), Stage(fileName: "9-8"), nil, nil, nil, nil, nil, nil, nil, nil, Stage(fileName: "9-25"), nil, nil],
                              [nil, Stage(fileName: "9-9"), Stage(fileName: "9-10"), nil, nil, nil, nil, Stage(fileName: "9-21"), Stage(fileName: "9-22"), Stage(fileName: "9-23"), Stage(fileName: "9-24"), nil, nil],
                              [nil, nil, Stage(fileName: "9-11"), Stage(fileName: "9-12"), Stage(fileName: "9-13"), nil, Stage(fileName: "9-19"), Stage(fileName: "9-20"), nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, Stage(fileName: "9-14"), Stage(fileName: "9-17"), Stage(fileName: "9-18"), nil, nil, nil, nil, nil, nil],
                              [nil, nil, nil, nil, Stage(fileName: "9-15"), Stage(fileName: "9-16"), nil, nil, nil, nil, nil, nil, nil]]
        
        // OTHER
        
        //        tileSet = "other"
        
        //        let otherStages = [[Stage(fileName: "1-1")]]
        
        // LOAD LEVELS
        
        levels.append(Level(stages: brickStages))
        levels.append(Level(stages: fireStages))
        levels.append(Level(stages: metalStages))
        levels.append(Level(stages: iceStages))
        levels.append(Level(stages: skyStages))
        levels.append(Level(stages: snowStages))
        levels.append(Level(stages: waterStages))
        levels.append(Level(stages: sandStages))
        levels.append(Level(stages: chemicalStages))
        //        levels.append(Level(stages: otherStages))
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
