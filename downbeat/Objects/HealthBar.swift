//
//  HealthBar.swift
//  downbeat
//
//  Created by Collin Howard on 11/25/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class HealthBar {
    
    // CONSTANTS
    
    static let height: CGFloat = Block.height * (56 / 16)
    static let width: CGFloat = Block.width * (8 / 16)
    
    //    static let color: UIColor = UIColor.gray
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var ticks = [HealthBarTick]()
    
    var view: UIImageView = UIImageView()
    
    init() {
        
        self.x = Block.width + (Block.width * 0.5) + (HealthBar.width / 2)
        self.y = (Block.width * (25 / 16)) + (HealthBar.height / 2)
        
        self.view.frame.origin.x = self.x - (HealthBar.width / 2)
        self.view.frame.origin.y = self.y - (HealthBar.height / 2)
        
        self.view.frame.size.width = HealthBar.width
        self.view.frame.size.height = HealthBar.height
        
        self.view.backgroundColor = HealthBar.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "healthBarBackground")
        
        for i in 0 ..< Player.maxHealth {
            ticks.append(HealthBarTick(x: self.x, y: self.y + (Block.height * (2 / 16)) * (CGFloat)(i) - (HealthBar.height / 2)))
        }
    }
    
    func setHealth(health: Int) {

        for i in 0 ..< ticks.count {
            ticks[i].view.isHidden = false
        }
        
        for i in 0 ..< Player.maxHealth - health {
            ticks[i].view.isHidden = true
        }
    }
    
}
