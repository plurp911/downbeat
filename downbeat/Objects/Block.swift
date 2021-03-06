//
//  Block.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class Block {
    
    // CONSTANTS
    
    static let height: CGFloat = screenSize.height / ((CGFloat)(numberOfVerticalBricks))
    static let width: CGFloat = Block.height
    
    static let color: UIColor = UIColor.clear

    static let hideTimeInterval: CGFloat = 1.5

    // VARIABLES
    
    var xPos: Int = 0
    var yPos: Int = 0
    
    var type: String = ""

    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var isLadder: Bool = false
    var isTopLadder: Bool = false
    
    var isSpike: Bool = false
    
    var isDisappearing: Bool = false
    
    var isHidden: Bool = false
    
    var hideOffsetTimeInterval: CGFloat = 0
    var hideTotalTimeInterval: CGFloat = 0

    var hideOffsetTimer = Timer()
    var hideTimer = Timer()
    var hideWaitTimer = Timer()

    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, hideOffsetTime: CGFloat, hideTotalTime: CGFloat, tileSet: String) {
        
        self.isDisappearing = true
        
        self.isHidden = true
        
        self.view.isHidden = self.isHidden
        
        self.hideOffsetTimeInterval = hideOffsetTime
        self.hideTotalTimeInterval = hideTotalTime

        setup(xPos: xPos, yPos: yPos, type: "disappearing", tileSet: tileSet)
    }
    
    init(xPos: Int, yPos: Int, type: String, tileSet: String) {
        
        setup(xPos: xPos, yPos: yPos, type: type, tileSet: tileSet)
    }
    
    func setup(xPos: Int, yPos: Int, type: String, tileSet: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        if self.type == "ladder" {
            
            self.isLadder = true
            
        } else if self.type == "topLadder" {
            
            self.isTopLadder = true
            
        } else if self.type == "spike" {
            
            self.isSpike = true
        }
        
        self.x = (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2)
        self.y = (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2)

        self.view.frame.origin.x = self.x - Block.width / 2
        self.view.frame.origin.y = self.y - Block.height / 2
        
        self.view.frame.size.width = Block.width
        self.view.frame.size.height = Block.height
        
        self.view.backgroundColor = Block.color
        
        self.view.contentMode = .scaleAspectFill

        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.type == "topLadder" {
            
            self.view.image = UIImage(named: "\(tileSet)TileLadder")

        } else {
            
            self.view.image = UIImage(named: "\(tileSet)Tile\(self.type.capitalizingFirstLetter())")
        }
    }
    
    func reset() {
        
        self.isHidden = true
        
        self.view.isHidden = self.isHidden
    }
    
    func startTimers() {
        
        if self.hideOffsetTimer.isValid == false && self.hideTimer.isValid == false && self.hideWaitTimer.isValid == false {
            
            self.hideOffsetTimer.invalidate()
            self.hideTimer.invalidate()
            self.hideWaitTimer.invalidate()
            
            self.hideOffsetTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.hideOffsetTimeInterval), target: self, selector: #selector(handleStartHide), userInfo: nil, repeats: false)
        }
    }
    
    @objc func handleStartHide() {
        
        self.isHidden = false
        
        self.view.isHidden = self.isHidden

        self.hideOffsetTimer.invalidate()
        self.hideWaitTimer.invalidate()

        if self.hideTimer.isValid == false {
            
            self.hideTimer.invalidate()
            
            self.hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(Block.hideTimeInterval), target: self, selector: #selector(handleHide), userInfo: nil, repeats: false)
        }
    }
    
    @objc func handleHide() {
        
        self.isHidden = true
        
        self.view.isHidden = self.isHidden
        
        self.hideOffsetTimer.invalidate()
        self.hideTimer.invalidate()
        
        if self.hideWaitTimer.isValid == false {
            
            self.hideWaitTimer.invalidate()
            
            self.hideWaitTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.hideTotalTimeInterval), target: self, selector: #selector(handleStartHide), userInfo: nil, repeats: false)
        }
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y

        self.view.frame.origin.x = self.x - Block.width / 2
        self.view.frame.origin.y = self.y - Block.height / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (Block.width / 2) >= 0 && self.x - (Block.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
    
    func isInLargeBounds() -> Bool {
        
        if self.x + (Block.width / 2) >= -(screenSize.height * (screenRatio)) && self.x - (Block.width / 2) <= (screenSize.height * (screenRatio)) + (screenSize.height * (screenRatio)) {
            return true
        }
        
        return false
    }
    
    func isInLargeBounds2() -> Bool {
        
        if self.x + (Block.width / 2) >= -(screenSize.height * (screenRatio)) * 2 && self.x - (Block.width / 2) <= (screenSize.height * (screenRatio)) * 3 {
            return true
        }
        
        return false
    }
}
