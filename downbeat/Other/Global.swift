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

// COLORS

let backgroundColor: UIColor = UIColor.black

let mainButtonColor: UIColor = UIColor.gray
let mainButtonOtherColor: UIColor = UIColor.lightGray
let mainButtonTextColor: UIColor = UIColor.white

let gameViewColor: UIColor = UIColor.darkGray

// VARIABLES

var stages = [Stage]()

// OBJECTS

var currentStage: Stage = Stage()

var player = Player()