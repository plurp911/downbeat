//
//  Global.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

// CONSTANTS

let screenSize = UIScreen.main.bounds

var numberOfVerticalBricks: Int = 15

let maxBullets: Int = 3

//let screenRatio: CGFloat = 16 / 9
//let screenRatio: CGFloat = 4 / 3
let screenRatio: CGFloat = 16 / 15
//let screenRatio: CGFloat = 1

// COLORS

let backgroundColor = UIColor.black

let mainButtonColor = UIColor.gray.withAlphaComponent(0.35)
let mainButtonOtherColor = UIColor.lightGray.withAlphaComponent(0.7)
let mainButtonTextColor = UIColor.white

let gameViewColor = UIColor(red: 32 / 255, green: 56 / 255, blue: 236 / 255, alpha: 1)

// VARIABLES

var stages = [Stage]()

var bullets = [Bullet]()
var explosions = [Explosion]()
var powerups = [Powerup]()

var canMoveLeft: Bool = true
var canMoveRight: Bool = true

//var canJump: Bool = true
//var canShoot: Bool = true

// OBJECTS

var currentStage = Stage()

var player = Player()
