//
//  EnemySpawner.swift
//  downbeat
//
//  Created by Collin Howard on 11/25/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class EnemySpawner {
    
    // CONSTANTS
    
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    //    static let color: UIColor = UIColor.gray
    static let color: UIColor = UIColor.clear
    
    // VARIABLES
    
    var xPos: Int = 0
    var yPos: Int = 0
    
    var type: String = ""
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var spawnTimer = Timer()
    
    var spawnTimeInterval: CGFloat = 0
    
    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        if self.type == "follower" {
            
            self.width = Block.width * (14 / 16)
            self.height = Block.height * (15 / 16)
            
            self.spawnTimeInterval = 3
            
//            self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        }
        
        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))
        
//        self.x = (((CGFloat)(self.xPos)) * self.width) + (self.width / 2)
//        self.y = (((CGFloat)(self.yPos)) * self.height) + (self.height / 2)
//
//        self.view.frame.origin.x = self.x - self.width / 2
//        self.view.frame.origin.y = self.y - self.height / 2
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = EnemySpawner.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "\(self.type)Spawner")
    }
    
    func setXY(x: CGFloat, y: CGFloat) {
        
        self.x = x
        self.y = y
        
        self.view.frame.origin.x = self.x - self.width / 2
        self.view.frame.origin.y = self.y - self.height / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (self.width / 2) >= 0 && self.x - (self.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
    
    func startSpawning() {
        
        if self.spawnTimer.isValid == false {
            
            self.createEnemy()
            
            self.spawnTimer.invalidate()
            
            self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        }
    }
    
    func stopSpawning() {
        self.spawnTimer.invalidate()
    }
    
    @objc func createEnemy() {
        
//        var enemyCount: Int = 0
//
//        for enemy in selectedEnemies {
//
//            if enemy.type == self.type && enemy.isUsed == false {
//                enemyCount += 1
//            }
//        }
//
//        print(enemyCount)
//        
//        if enemyCount < 3 {
            selectedEnemies.append(Enemy(x: self.x, y: self.y, type: self.type))
//        }
    }
    
}
