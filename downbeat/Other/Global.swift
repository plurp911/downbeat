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

let gameViewColor = UIColor.darkGray

// VARIABLES

var stages = [Stage]()

var bullets = [Bullet]()

var canMoveLeft: Bool = true
var canMoveRight: Bool = true

// OBJECTS

var currentStage = Stage()

var player = Player()

// FUNCTIONS

func scaleUIImageToSize(image: UIImage, size: CGSize) -> UIImage {
    
    let hasAlpha = true
    let scale: CGFloat = UIScreen.main.scale // Automatically use scale factor of main screen
    
    UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
    
    image.draw(in: CGRect(origin: CGPoint.zero, size: size))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return scaledImage!
}
