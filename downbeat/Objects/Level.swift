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
                
                if self.stages[i][j]?.playerStartX != -1 && self.stages[i][j]?.playerStartY != -1 {
                    self.startStage = stages[i][j]
                }
                
            }
        }
        
    }
    
}
