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
    
//        let stages = [[Stage(fileName: "2-1")]]
        
        let stages: [[Stage?]] = [[nil, nil, nil, Stage(fileName: "1-8"), Stage(fileName: "1-9"), Stage(fileName: "1-10")],
                                  [nil, nil, nil, Stage(fileName: "1-7"), nil, nil],
                                  [nil, nil, nil, Stage(fileName: "1-6"), nil, nil],
                                  [nil, Stage(fileName: "1-3"), Stage(fileName: "1-4"), Stage(fileName: "1-5"), nil, nil],
                                  [Stage(fileName: "1-1"), Stage(fileName: "1-2"), nil, nil, nil, nil]]

        levels.append(Level(stages: stages))
    }
    
    func setLevel(level: Level) {
        
        currentLevel = level
        currentStage = level.startStage
        
//        currentStage!.isUsed = true
        
        currentStage!.setupSelectedArrays()

//        setupStage()
        
        player.reset()
        
        moveTimer = Timer.scheduledTimer(timeInterval: (1 / 120), target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
}
