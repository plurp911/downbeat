//
//  Level.swift
//  downbeat
//
//  Created by Collin Howard on 11/27/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Level {
    
    var stages = [[Stage?]]()
    
    var startStage: Stage?

    init(stages: [[Stage?]]) {
        
        self.stages = stages
        
        for i in 0 ..< self.stages.count {
            for j in 0 ..< self.stages[i].count {
                
                if self.stages[i][j] != nil {
                    
                    if self.stages[i][j]?.playerStartX != -1 && self.stages[i][j]?.playerStartY != -1 {
                        
                        self.startStage = stages[i][j]
                        
                        currentStageXPos = j
                        currentStageYPos = i
                    }
                }
                
            }
        }
        
    }
    
    func updateCurrentStagePos() {
        
        for i in 0 ..< self.stages.count {
            for j in 0 ..< self.stages[i].count {
                
                if self.stages[i][j] === currentStage {
                    
                    currentStageXPos = j
                    currentStageYPos = i
                }
                
            }
        }
        
    }
    
    func isNextStage(direction: String) -> Stage? {
        
        var xOffset: Int = 0
        var yOffset: Int = 0
        
        if direction == "up" {
            yOffset = -1
        } else if direction == "down" {
            yOffset = 1
        } else if direction == "right" {
            xOffset = 1
        }

        if currentStageXPos + xOffset >= 0 && currentStageXPos + xOffset < self.stages[0].count && currentStageYPos + yOffset >= 0 && currentStageYPos + yOffset < self.stages.count {
            
            var canGoOn: Bool = true
            
            let stage = self.stages[currentStageYPos + yOffset][currentStageXPos + xOffset]
            
            if direction == "up" {

                if stage?.canEnterFromBottom == false {
                    canGoOn = false
                }

            } else if direction == "down" {

                if stage?.canEnterFromTop == false {
                    canGoOn = false
                }
                
            } else if direction == "right" {

                if stage?.canEnterFromLeft == false {
                    canGoOn = false
                }
            }
            
            if canGoOn == true {
                
                return self.stages[currentStageYPos + yOffset][currentStageXPos + xOffset]
            }
        }
        
        return nil
    }
}
