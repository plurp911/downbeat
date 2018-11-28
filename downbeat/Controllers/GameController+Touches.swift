//
//  GameController+Touches.swift
//  downbeat
//
//  Created by Collin Howard on 11/27/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

extension GameController {

    // TOUCHES
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let position = touch.location(in: touchView)
            
            if joystick.isInOuterRadius(x: position.x, y: position.y) == true {
                
                isOnJoyStick = true
                
                joystick.setInnterXY(x: position.x, y: position.y)
                
            } else {
                
                isOnJoyStick = false
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("1")
        
        if isOnJoyStick == true {
            
            if let touch = touches.first {
                
                let position = touch.location(in: touchView)
                
                joystick.setInnterXY(x: position.x, y: position.y)
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isOnJoyStick == true {
            
            if let touch = touches.first {
                
//                let position = touch.location(in: touchView)
                
                isOnJoyStick = false
                
                joystick.resetInnerXY()
            }
            
        }
    }
    
}
