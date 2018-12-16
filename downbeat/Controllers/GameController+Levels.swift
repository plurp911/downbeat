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
        
//        let stages: [[Stage?]] = [[nil, nil, nil, Stage(fileName: "1-8"), Stage(fileName: "1-9"), Stage(fileName: "1-10")],
//                                  [nil, nil, nil, Stage(fileName: "1-7"), nil, nil],
//                                  [nil, nil, nil, Stage(fileName: "1-6"), nil, nil],
//                                  [nil, Stage(fileName: "1-3"), Stage(fileName: "1-4"), Stage(fileName: "1-5"), nil, nil],
//                                  [Stage(fileName: "1-1"), Stage(fileName: "1-2"), nil, nil, nil, nil]]

        // FIRE
        
        //        let stages = [[nil, nil, Stage(fileName: "2-7"), Stage(fileName: "1-9"), Stage(fileName: "1-10")],
        //                      [nil, nil, Stage(fileName: "2-6"), nil, nil],
        //                      [nil, nil, Stage(fileName: "2-5"), nil, nil],
        //                      [nil, nil, Stage(fileName: "2-4"), nil, nil],
        //                      [Stage(fileName: "2-1"), Stage(fileName: "2-2"), Stage(fileName: "2-3"), nil]]

        // METAL
        
        let stages = [[Stage(fileName: "3-1"), Stage(fileName: "3-2"), Stage(fileName: "3-3"), Stage(fileName: "3-4")]]

        levels.append(Level(stages: stages))
    }
    
    func setLevel(level: Level) {
        
        currentLevel = level
        currentStage = level.startStage
        
        currentStage!.setupSelectedArrays()
        
        player.reset()
        
        moveTimer = Timer.scheduledTimer(timeInterval: (1 / 120), target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
}
