//
//  Explosion.swift
//  downbeat
//
//  Created by Collin Howard on 11/20/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Explosion {
    
    // CONSTANTS
    
    static let height: CGFloat = Block.height
    static let width: CGFloat = Explosion.height
    
        static let color: UIColor = UIColor.clear
//    static let color: UIColor = UIColor.red
    
    static let explosionImages = [UIImage(named: "explosion1"), UIImage(named: "explosion2"), UIImage(named: "explosion3"), UIImage(named: "explosion4")]
    
    static let popImages = [UIImage(named: "pop1"), UIImage(named: "pop2"), UIImage(named: "pop3"), UIImage(named: "pop4")]

    static let breakImages = [UIImage(named: "break1"), UIImage(named: "break2"), UIImage(named: "break3"), UIImage(named: "break4")]

    // VARIABLES
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var view: UIImageView = UIImageView()
    
    init(x: CGFloat, y: CGFloat, type: String) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - Explosion.width / 2
        self.view.frame.origin.y = self.y - Explosion.height / 2
        
        self.view.frame.size.width = Explosion.width
        self.view.frame.size.height = Explosion.height
        
        self.view.backgroundColor = Explosion.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.stopAnimating()
        
        if type == "explosion" {
            
            self.view.animationImages = Explosion.explosionImages as! [UIImage]

        } else if type == "pop" {
            
            self.view.animationImages = Explosion.popImages as! [UIImage]
            
        } else if type == "break" {
            
            self.view.animationImages = Explosion.breakImages as! [UIImage]
        }
        
        self.view.animationRepeatCount = 1

        self.view.animationDuration = 0.135
        self.view.startAnimating()
    }
    
    func setX(x: CGFloat) {
        
        self.x = x
        
        self.view.frame.origin.x = self.x - Explosion.width / 2
    }
}
