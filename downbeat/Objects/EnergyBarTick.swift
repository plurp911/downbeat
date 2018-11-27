//
//  EnergyBarTick.swift
//  downbeat
//
//  Created by Collin Howard on 11/25/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class EnergyBarTick {
    
    // CONSTANTS
    
    static let height: CGFloat = Block.height * (1 / 16)
    static let width: CGFloat = Block.width * (6 / 16)
    
    //    static let color: UIColor = UIColor.gray
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var type: String
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, type: String) {
        
        self.x = x
        self.y = y
        
        self.type = type
        
        self.view.frame.origin.x = self.x - (EnergyBarTick.width / 2)
        self.view.frame.origin.y = self.y - (EnergyBarTick.height / 2)
        
        self.view.frame.size.width = EnergyBarTick.width
        self.view.frame.size.height = EnergyBarTick.height
        
        self.view.backgroundColor = EnergyBarTick.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.type == "health" {
            self.view.image = UIImage(named: "healthBarTick")
        } else if self.type == "energy" {
            self.view.image = UIImage(named: "energyBarTick")
        }
    }
    
}
