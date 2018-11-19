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
        
        stages[0].setPlayerStartXY(startX: screenSize.width / 2, startY: screenSize.height / 2)
        
        stages[0].blocks.append(Block(xPos: 0, yPos: 0))
        stages[0].blocks.append(Block(xPos: 5, yPos: 5))
        stages[0].blocks.append(Block(xPos: 7, yPos: 5))
        stages[0].blocks.append(Block(xPos: 6, yPos: 8))
        
        currentStage = stages[0]
    }
}
