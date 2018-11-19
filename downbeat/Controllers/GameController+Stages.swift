//
//  GameController+Stages.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {
    
    func loadStages() {
        
        stages.append(Stage())
        
        stages[0].numberOfHorizontalBlocks = 50
        
//        stages[0].setPlayerStartXY(startX: Player.width * 2, startY: -Player.height * 2)
        
        stages[0].setPlayerStartXY(startX: screenSize.width / 2, startY: screenSize.height / 2)

        for i in 0 ..< 50 {
            stages[0].blocks.append(Block(xPos: i, yPos: 14))
        }
        
        stages[0].blocks.append(Block(xPos: 10, yPos: 13))
        stages[0].blocks.append(Block(xPos: 11, yPos: 13))
        stages[0].blocks.append(Block(xPos: 12, yPos: 13))

        stages[0].blocks.append(Block(xPos: 16, yPos: 12))
        stages[0].blocks.append(Block(xPos: 17, yPos: 12))
        stages[0].blocks.append(Block(xPos: 18, yPos: 12))
        
        stages[0].blocks.append(Block(xPos: 25, yPos: 11))
        stages[0].blocks.append(Block(xPos: 26, yPos: 10))
        stages[0].blocks.append(Block(xPos: 27, yPos: 9))
        stages[0].blocks.append(Block(xPos: 28, yPos: 8))
        stages[0].blocks.append(Block(xPos: 29, yPos: 7))
        stages[0].blocks.append(Block(xPos: 30, yPos: 6))
        stages[0].blocks.append(Block(xPos: 31, yPos: 5))
        stages[0].blocks.append(Block(xPos: 32, yPos: 4))
        stages[0].blocks.append(Block(xPos: 33, yPos: 3))
        stages[0].blocks.append(Block(xPos: 34, yPos: 2))
        stages[0].blocks.append(Block(xPos: 35, yPos: 1))

        currentStage = stages[0]
    }
}
