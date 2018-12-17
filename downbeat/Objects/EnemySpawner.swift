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
    
    static let followerImages = [UIImage(named: "followerSpawner1"), UIImage(named: "followerSpawner2")]
    
    // VARIABLES
    
    var xPos: Int = 0
    var yPos: Int = 0
    
    var type: String = ""
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var spawnTimer = Timer()
    var startSpawnTimer = Timer()

    var spawnTimeInterval: CGFloat = 0
    var startSpawnTimeInterval: CGFloat = 0

    var direction: String = ""

    var view: UIImageView = UIImageView()
    
    init(xPos: Int, yPos: Int, type: String) {

        self.setup(xPos: xPos, yPos: yPos, type: type)
    }
    
    init(xPos: Int, yPos: Int, type: String, direction: String) {

        self.direction = direction
        
        self.setup(xPos: xPos, yPos: yPos, type: type)
    }
    
    func setup(xPos: Int, yPos: Int, type: String) {
        
        self.xPos = xPos
        self.yPos = yPos
        
        self.type = type
        
        if self.type == "follower" {
            
//            self.width = Block.width * (14 / 16)
//            self.height = Block.height * (15 / 16)
            
            self.width = Block.width * (32 / 16)
            self.height = Block.height * (24 / 16)
            
            self.spawnTimeInterval = 3
            
//            self.startSpawnTimeInterval = 0.5
            self.startSpawnTimeInterval = 0

        } else if self.type == "special" {
            
            self.width = Block.width
            self.height = self.width
            
//            self.spawnTimeInterval = 3
//            self.spawnTimeInterval = 1.25
            self.spawnTimeInterval = 2

//            self.startSpawnTimeInterval = 0
            self.startSpawnTimeInterval = 1

        } else if self.type == "drop" {
            
            self.width = Block.width
            self.height = self.width
            
            self.spawnTimeInterval = 5

            self.startSpawnTimeInterval = 0
        }
        
        self.setXY(x: (((CGFloat)(self.xPos)) * Block.width) + (Block.width / 2), y: (((CGFloat)(self.yPos)) * Block.height) + (Block.height / 2))
        
        self.view.frame.size.width = self.width
        self.view.frame.size.height = self.height
        
        self.view.backgroundColor = EnemySpawner.color
        
        self.view.contentMode = .scaleAspectFill
        
        self.view.layer.magnificationFilter = CALayerContentsFilter.nearest
        
        if self.type == "follower" {
            
//            self.view.image = UIImage(named: "\(self.type)Spawner")
            
            self.view.animationImages = EnemySpawner.followerImages as! [UIImage]
            
            self.view.animationDuration = 0.85 * 0.6
            
            self.view.startAnimating()
            
        } else if self.type == "special" {
            
            self.view.isHidden = true
            
        } else if self.type == "drop" {
            
            self.view.isHidden = true
        }
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
    
    func isInSpawningBounds() -> Bool {
        
        if self.type == "follower" {

            let enemyWidth: CGFloat = Block.width
            
            if self.x - (enemyWidth / 2) >= 0 && self.x + (enemyWidth / 2) <= screenSize.height * (screenRatio) {
                return true
            }
            
        } else if self.type == "special" {
            
            let enemyWidth: CGFloat = Block.width

            if self.x - (enemyWidth / 2) >= 0 && self.x + (enemyWidth / 2) <= screenSize.height * (screenRatio) {
                return true
            }
            
//            return true

        } else if self.type == "drop" {
            
            let xRange: CGFloat = Block.width * 2

            if player.x + (Player.width / 2) >= self.x - (xRange / 2) && player.x - (Player.width / 2) <= self.x + (xRange / 2) {
                
                print("IN RANGE")

                return true
            }
        }
        
        return false
    }
    
    func startSpawning() {
        
        if self.startSpawnTimer.isValid == false && self.spawnTimer.isValid == false {
            
            if self.type == "drop" {
                
                self.spawn()

            } else {
                
                let value: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            
                self.startSpawnTimer.invalidate()
                
                self.startSpawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.startSpawnTimeInterval * value), target: self, selector: #selector(startSpawnLoop), userInfo: nil, repeats: false)
            }
        }
        
    }
    
    func stopSpawning() {
        self.spawnTimer.invalidate()
        self.startSpawnTimer.invalidate()
    }
    
    @objc func startSpawnLoop() {
        
        if self.spawnTimer.isValid == false {
            
            self.startSpawnTimer.invalidate()
            
            self.spawn()
            
            self.spawnTimer.invalidate()
            
            self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(spawn), userInfo: nil, repeats: true)
        }
    }
    
    @objc func spawn() {
        
        if self.type == "follower" {
            
            var enemyCount: Int = 0
            
            for enemy in selectedEnemies {
                
                if enemy.type == self.type && enemy.isUsed == false {
                    enemyCount += 1
                }
            }
            
            if enemyCount < 3 {
                
                selectedEnemies.append(Enemy(x: self.x, y: self.y, type: self.type))
                
                selectedEnemies = selectedEnemies.sorted(by: { $0.x < $1.x })
            }
            
        } else if self.type == "special" {
            
            let value: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            
//            let bulletSpeed: CGFloat = 1.5
            let bulletSpeed: CGFloat = 0.9

            let xOffset: CGFloat = Block.width * (0 / 16)
            let yOffset: CGFloat = Block.height * (16 / 16)
            
            if self.direction == "up" {
                
//                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: 0, ySpeed: -bulletSpeed, type: "special"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: 0, ySpeed: -bulletSpeed - value, type: "special"))

            } else if self.direction == "down" {
                
//                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y + yOffset, xSpeed: 0, ySpeed: bulletSpeed, type: "special"))
                enemyBullets.append(EnemyBullet(x: self.x - xOffset, y: self.y - yOffset, xSpeed: 0, ySpeed: bulletSpeed + value, type: "special"))
            }
            
        } else if self.type == "drop" {
            
            var enemyCount: Int = 0
            
            for enemy in selectedEnemies {
                
                if enemy.type == self.type && enemy.isUsed == false {
                    enemyCount += 1
                }
            }

            if enemyCount < 2 {
                
                if self.isInSpawningBounds() == true {
                    
                    if self.spawnTimer.isValid == false {

                        selectedEnemies.append(Enemy(x: (screenSize.height * (screenRatio)) + (Block.width / 2), y: self.y, type: self.type, direction: "left"))
                        
                        selectedEnemies = selectedEnemies.sorted(by: { $0.x < $1.x })
                        
                        self.spawnTimer.invalidate()
                        
                        self.spawnTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.spawnTimeInterval), target: self, selector: #selector(spawn), userInfo: nil, repeats: false)
                    }
                    
                }
            }
            
        }
    }
    
}
