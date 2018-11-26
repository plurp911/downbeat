//
//  HealthBarTick.swift
//  downbeat
//
//  Created by Collin Howard on 11/25/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class HealthBarTick {
    
    // CONSTANTS
    
    static let height: CGFloat = Block.height * (1 / 16)
    static let width: CGFloat = Block.width * (6 / 16)
    
    //    static let color: UIColor = UIColor.gray
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - (HealthBarTick.width / 2)
        self.view.frame.origin.y = self.y - (HealthBarTick.height / 2)
        
        self.view.frame.size.width = HealthBarTick.width
        self.view.frame.size.height = HealthBarTick.height
        
        self.view.backgroundColor = HealthBarTick.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "healthBarTick")
    }
}
