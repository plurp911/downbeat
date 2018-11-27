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
    
    static let height: CGFloat = Block.height
    static let width: CGFloat = Block.width
    
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
            
            self.spawnTimeInterval = 2
            
//            self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        }
        
        self.x = (((CGFloat)(self.xPos)) * EnemySpawner.width) + (EnemySpawner.width / 2)
        self.y = (((CGFloat)(self.yPos)) * EnemySpawner.height) + (EnemySpawner.height / 2)
        
        self.view.frame.origin.x = self.x - EnemySpawner.width / 2
        self.view.frame.origin.y = self.y - EnemySpawner.height / 2
        
        self.view.frame.size.width = EnemySpawner.width
        self.view.frame.size.height = EnemySpawner.height
        
        self.view.backgroundColor = EnemySpawner.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        self.view.image = UIImage(named: "\(self.type)Spawner")
    }
    
    func setX(x: CGFloat) {
        
        self.x = x
        
        self.view.frame.origin.x = self.x - EnemySpawner.width / 2
    }
    
    func isInBounds() -> Bool {
        
        if self.x + (EnemySpawner.width / 2) >= 0 && self.x - (EnemySpawner.width / 2) <= screenSize.height * (screenRatio) {
            return true
        }
        
        return false
    }
    
    func startSpawning() {
        
        if self.spawnTimer.isValid == false {
            
            self.spawnTimer.invalidate()
            
            self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        }
    }
    
    func stopSpawning() {
        self.spawnTimer.invalidate()
    }
    
    @objc func createEnemy() {
        selectedEnemies.append(Enemy(x: self.x, y: self.y, type: self.type))
    }
}
