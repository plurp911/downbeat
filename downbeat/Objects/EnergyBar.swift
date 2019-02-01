//
//  EnergyBar.swift
//  downbeat
//
//  Created by Collin Howard on 11/25/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class EnergyBar {
    
    // CONSTANTS

    static let height: CGFloat = Block.height * (64 / 16)
    static let width: CGFloat = Block.width * (8 / 16)
    
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var ticks = [EnergyBarTick]()
    
    var type: String
    
    var view: UIImageView = UIImageView()
    
    init(type: String) {
        
        self.type = type
        
        if self.type == "health" {
            
            self.x = Block.width - (EnergyBar.width / 2)
            self.y = (Block.width * 0.5) + (EnergyBar.height / 2)
            
        } else if self.type == "energy" {
            
            self.x = Block.width + (EnergyBar.width / 2)
            self.y = (Block.height * 0.5) + (EnergyBar.height / 2)
            
        } else if self.type == "bossHealth" {

            self.x = Block.width + Block.width + (EnergyBar.width / 2)
            self.y = (Block.height * 0.5) + (EnergyBar.height / 2)
        }
        
        self.view.frame.origin.x = self.x - (EnergyBar.width / 2)
        self.view.frame.origin.y = self.y - (EnergyBar.height / 2)
        
        self.view.frame.size.width = EnergyBar.width
        self.view.frame.size.height = EnergyBar.height
        
        self.view.backgroundColor = EnergyBar.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.type == "health" {
            
            self.view.image = UIImage(named: "energyBarBackground")

            for i in 0 ..< Player.maxHealth {
                ticks.append(EnergyBarTick(x: self.x, y: (EnergyBarTick.height / 2) + self.y + (Block.height * (2 / 16)) * (CGFloat)(i) - (EnergyBar.height / 2), type: "health"))
            }
            
        } else if self.type == "energy" {
        
            self.view.image = UIImage(named: "energyBarBackground")

            for i in 0 ..< Player.maxEnergy {
                ticks.append(EnergyBarTick(x: self.x, y: (EnergyBarTick.height / 2) + self.y + (Block.height * (2 / 16)) * (CGFloat)(i) - (EnergyBar.height / 2), type: "energy"))
            }
            
        } else if self.type == "bossHealth" {
            
            self.view.image = UIImage(named: "energyBarBackground")
            
            for i in 0 ..< Enemy.maxBossHealth {
                ticks.append(EnergyBarTick(x: self.x, y: (EnergyBarTick.height / 2) + self.y + (Block.height * (2 / 16)) * (CGFloat)(i) - (EnergyBar.height / 2), type: "energy"))
            }
            
        }
    }
    
    func setEnergy(energy: Int) {
        
        if energy >= 0 {
            
            for i in 0 ..< ticks.count {
                ticks[i].view.isHidden = false
            }
            
            if self.type == "health" {

                for i in 0 ..< Player.maxHealth - energy {
                    ticks[i].view.isHidden = true
                }
                
            } else if self.type == "energy" {

                for i in 0 ..< Player.maxEnergy - energy {
                    ticks[i].view.isHidden = true
                }
                
            } else if self.type == "bossHealth" {
                
                for i in 0 ..< Enemy.maxBossHealth - energy {
                    ticks[i].view.isHidden = true
                }
            }
            
        }
    }
    
    func updateImages(power: String) {
        
        if power == "regular" {
            
            self.view.isHidden = true

            for tick in ticks {
                tick.view.isHidden = true
            }
            
        } else {
            
            self.view.isHidden = false

            for tick in ticks {
                
                tick.view.isHidden = false
                
                tick.updateImage(power: power)
            }
        }
        
    }

}
