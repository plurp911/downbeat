//
//  GameController.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    // CONSTANTS
    
    //    let mainButtonRadius: CGFloat = 35
    let mainButtonRadius: CGFloat = 37.5
    
    //    let mainButtonSpacing: CGFloat = 35
    let mainButtonSpacing: CGFloat = 32.5
    
    let joystickSpacing: CGFloat = 35
    
    let opacityChange: CGFloat = 0.0065
    
    // VARIABLES
    
    var moveTimer = Timer()
    
    var isOnJoyStick: Bool = false
    
    var startTitleTextTimer = Timer()
    
    var startTitleTextOpacity: CGFloat = 1
    
    var isGettingDarker: Bool = false
    
    var pausedTextView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "pausedText")
        view.isHidden = true
        return view
    }()
    
    lazy var titleView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "titleBackground")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTitleView)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleTitleView() {
        
        print("TITLE")
        
        updateTitleVisibility(isHidden: true)
    }
    
    var titleLogoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "titleLogo")
        //        view.isHidden = true
        return view
    }()
    
    var startTitleTextView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "startTitleText")
        //        view.isHidden = true
        return view
    }()
    
    var stageSelectView: UIView = {
        let view = UIView()
        view.backgroundColor = stageSelectViewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        //        view.isHidden = true
        return view
    }()
    
    var stageSelectTitleView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTitle")
        //        view.isHidden = true
        return view
    }()
    
    var topPipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        //        view.isHidden = true
        return view
    }()
    
    var middlePipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        //        view.isHidden = true
        return view
    }()
    
    var bottomPipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        //        view.isHidden = true
        return view
    }()
    
    lazy var brickStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBrickStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleBrickStage() {
        
        print("BRICK")
        
        // BORING BLUE
        
        //        gameViewColor = UIColor(red: 75 / 255, green: 125 / 255, blue: 223 / 255, alpha: 1)
        
        // SKY BLUE
        
        //        gameViewColor = UIColor(red: 0 / 255, green: 171 / 255, blue: 255 / 255, alpha: 1)
        
        // BORING SKY BLUE

        gameViewColor = UIColor(red: 0 / 255, green: 136 / 255, blue: 203 / 255, alpha: 1)
        
        // BRICK COLOR
        
        //        gameViewColor = UIColor(red: 192 / 255, green: 114 / 255, blue: 56 / 255, alpha: 1)
        
        setLevel(level: levels[0])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var fireStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFireStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleFireStage() {
        
        print("FIRE")
        
        //        gameViewColor = UIColor(red: 55 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1)
        gameViewColor = UIColor(red: 185 / 255, green: 48 / 255, blue: 48 / 255, alpha: 1)
        //        gameViewColor = UIColor(red: 158 / 255, green: 32 / 255, blue: 32 / 255, alpha: 1)
        
        setLevel(level: levels[1])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var metalStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMetalStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleMetalStage() {
        
        print("METAL")
        
        gameViewColor = UIColor(red: 152 / 255, green: 152 / 255, blue: 152 / 255, alpha: 1)
        
        setLevel(level: levels[2])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var iceStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleIceStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleIceStage() {
        
        print("ICE")
        
        gameViewColor = UIColor(red: 27 / 255, green: 111 / 255, blue: 121 / 255, alpha: 1)
        
        setLevel(level: levels[3])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var centerStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCenterStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleCenterStage() {
        
        print("CENTER")
        
        setLevel(level: levels[8])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var skyStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSkyStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleSkyStage() {
        
        print("SKY")
        
        gameViewColor = UIColor(red: 136 / 255, green: 198 / 255, blue: 253 / 255, alpha: 1)

        setLevel(level: levels[4])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var snowStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSnowStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleSnowStage() {
        
        print("SNOW")
        
        // WHITER
        
//        gameViewColor = UIColor(red: 171 / 255, green: 206 / 255, blue: 208 / 255, alpha: 1)
        
        // BLUER
        
        gameViewColor = UIColor(red: 124 / 255, green: 182 / 255, blue: 184 / 255, alpha: 1)

        setLevel(level: levels[5])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var waterStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleWaterStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleWaterStage() {
        
        print("WATER")
        
        // LIGHTER
        
//        gameViewColor = UIColor(red: 87 / 255, green: 193 / 255, blue: 189 / 255, alpha: 1)

        // DARKER
        
        gameViewColor = UIColor(red: 0 / 255, green: 63 / 255, blue: 66 / 255, alpha: 1)

        setLevel(level: levels[6])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    lazy var sandStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSandStage)))
        //        view.isHidden = true
        return view
    }()
    
    @objc func handleSandStage() {
        
        print("SAND")
        
        //        gameViewColor = UIColor(red: 255 / 255, green: 214 / 255, blue: 92 / 255, alpha: 1)
        gameViewColor = UIColor(red: 227 / 255, green: 179 / 255, blue: 89 / 255, alpha: 1)
        
        setLevel(level: levels[7])
        
        updateControlVisibility(isHidden: false)
        updateStageSelectVisibility(isHidden: true)
    }
    
    var gameView: UIView = {
        let view = UIView()
        view.backgroundColor = gameViewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    var leftCoverView: UIView = {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    var rightCoverView: UIView = {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    lazy var jumpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⇪", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleJump), for: .touchDown)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchCancel)
        return button
    }()
    
    @objc func handleJump() {
        
        if player.isKnockedBack == false {
            
            if player.isJumping == false && player.ySpeed == 0 {
                
                player.jump()
            }
        }
        
    }
    
    @objc func handleJumpCancel() {
        
        if player.isRising == true && player.isJumping == true && player.ySpeed < 0 {
            player.stopJump()
        }
    }
    
    lazy var shootButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⦿", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleShoot), for: .touchDown)
        return button
    }()
    
    @objc func handleShoot() {
        
        if player.isKnockedBack == false {
            
            //            if bullets.count < 3 {
            
            player.shoot()
            //            }
        }
        
    }
    
    lazy var pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("l l", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        //        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handlePause), for: .touchDown)
        return button
    }()
    
    @objc func handlePause() {
        
        isPaused = !isPaused
        
        if isPaused == true {
            
            print("PAUSE")
            
            pausedTextView.isHidden = false
            
            player.handlePause()
            
            for bullet in bullets {
                bullet.handlePause()
            }
            
            for enemy in selectedEnemies {
                enemy.handlePause()
            }
            
        } else {
            
            print("RESUME")
            
            pausedTextView.isHidden = true
            
            player.handleResume()
            
            for bullet in bullets {
                bullet.handleResume()
            }
            
            for enemy in selectedEnemies {
                enemy.handleResume()
            }
        }
        
    }
    
    lazy var weaponLeftButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("previous\nweapon", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 2
        button.addTarget(self, action: #selector(handleWeaponLeft), for: .touchDown)
        return button
    }()
    
    @objc func handleWeaponLeft() {
        
        print("LEFT")
        
        player.cycleWeapon(isNext: false)
    }
    
    lazy var weaponRightButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("next\nweapon", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 2
        button.addTarget(self, action: #selector(handleWeaponRight), for: .touchDown)
        return button
    }()
    
    @objc func handleWeaponRight() {
        
        print("RIGHT")
        
        player.cycleWeapon(isNext: true)
    }
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleLeft), for: .touchDown)
        button.addTarget(self, action: #selector(handleLeftCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleLeftCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleLeftCancel), for: .touchCancel)
        button.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        button.isHidden = true
        return button
    }()
    
    @objc func handleLeft() {
        isLeftPressed = true
    }
    
    @objc func handleLeftCancel() {
        isLeftPressed = false
    }
    
    lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleRight), for: .touchDown)
        button.addTarget(self, action: #selector(handleRightCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleRightCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleRightCancel), for: .touchCancel)
        button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        button.isHidden = true
        return button
    }()
    
    @objc func handleRight() {
        isRightPressed = true
    }
    
    @objc func handleRightCancel() {
        isRightPressed = false
    }
    
    lazy var upButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleUp), for: .touchDown)
        button.addTarget(self, action: #selector(handleUpCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleUpCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleUpCancel), for: .touchCancel)
        button.isHidden = true
        return button
    }()
    
    @objc func handleUp() {
        isUpPressed = true
    }
    
    @objc func handleUpCancel() {
        isUpPressed = false
    }
    
    lazy var downButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = mainButtonOtherColor.cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleDown), for: .touchDown)
        button.addTarget(self, action: #selector(handleDownCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleDownCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleDownCancel), for: .touchCancel)
        button.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        button.isHidden = true
        return button
    }()
    
    @objc func handleDown() {
        isDownPressed = true
    }
    
    @objc func handleDownCancel() {
        isDownPressed = false
    }
    
    var joystickView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    var touchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.clear.cgColor
        view.isHidden = true
        return view
    }()
    
    func setWidthHeight(width: CGFloat, height: CGFloat, imageView: UIImageView) {
        
        imageView.frame.size.width = width
        imageView.frame.size.height = height
    }
    
    func setXY(x: CGFloat, y: CGFloat, imageView: UIImageView, isCentered: Bool) {
        
        if isCentered == true {
            
            imageView.frame.origin.x = x - (imageView.frame.size.width / 2)
            imageView.frame.origin.y = y - (imageView.frame.size.height / 2)
            
        } else {
            
            imageView.frame.origin.x = x
            imageView.frame.origin.y = y
        }
    }
    
    func updateStageSelectVisibility(isHidden: Bool) {
        
        stageSelectView.isHidden = isHidden
        stageSelectTitleView.isHidden = isHidden
        topPipeStageSelectView.isHidden = isHidden
        middlePipeStageSelectView.isHidden = isHidden
        bottomPipeStageSelectView.isHidden = isHidden
        brickStageView.isHidden = isHidden
        fireStageView.isHidden = isHidden
        metalStageView.isHidden = isHidden
        iceStageView.isHidden = isHidden
        centerStageView.isHidden = isHidden
        skyStageView.isHidden = isHidden
        snowStageView.isHidden = isHidden
        waterStageView.isHidden = isHidden
        sandStageView.isHidden = isHidden
    }
    
    func updateTitleVisibility(isHidden: Bool) {
        
        titleView.isHidden = isHidden
        titleLogoView.isHidden = isHidden
        startTitleTextView.isHidden = isHidden
    }
    
    func updateControlVisibility(isHidden: Bool) {
        
        joystickView.isHidden = isHidden
        touchView.isHidden = isHidden
        jumpButton.isHidden = isHidden
        shootButton.isHidden = isHidden
        pauseButton.isHidden = isHidden
        weaponLeftButton.isHidden = isHidden
        weaponRightButton.isHidden = isHidden
    }
    
    @objc func updateStartTitleTextOpacity() {
        
        if isGettingDarker == true {
            
            startTitleTextOpacity += opacityChange
            
            if startTitleTextOpacity >= 1 {
                
                startTitleTextOpacity = 1
                
                isGettingDarker = false
            }
            
        } else {
            
            startTitleTextOpacity -= opacityChange
            
            if startTitleTextOpacity <= 0 {
                
                startTitleTextOpacity = 0
                
                isGettingDarker = true
            }
        }
        
        startTitleTextView.alpha = startTitleTextOpacity
    }
    
    func saveCompletedLevels() {
        
        let tempDefault = UserDefaults.standard
        
        tempDefault.setValue(completedLevels, forKey: "completedLevels")
        tempDefault.synchronize()
    }
    
    func loadCompletedLevels() {
        
        let tempDefault = UserDefaults.standard
        
        if let savedCompletedLevels = tempDefault.value(forKey: "completedLevels") {
            completedLevels = savedCompletedLevels as! [Bool]
        }
        
        completedLevels = [true, true, true, true, true, true, true, true]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        startTitleTextTimer = Timer.scheduledTimer(timeInterval: 1 / 120, target: self, selector: #selector(updateStartTitleTextOpacity), userInfo: nil, repeats: true)
        
        joystick.setOuterXY(x: Joystick.outerRadius + (joystickSpacing * 2.5), y: screenSize.height - Joystick.outerRadius - (joystickSpacing * 0.5))
        joystick.resetInnerXY()
        joystick.showViews()
        
        loadCompletedLevels()
        loadLevels()
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(gameView)
        view.addSubview(pausedTextView)
        view.addSubview(leftCoverView)
        view.addSubview(rightCoverView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(joystickView)
        
        joystickView.addSubview(joystick.outerView)
        joystickView.addSubview(joystick.innerView)
        
        view.addSubview(touchView)
        view.addSubview(jumpButton)
        view.addSubview(shootButton)
        view.addSubview(pauseButton)
        view.addSubview(weaponLeftButton)
        view.addSubview(weaponRightButton)
        
        view.addSubview(stageSelectView)
        view.addSubview(stageSelectTitleView)
        view.addSubview(topPipeStageSelectView)
        view.addSubview(middlePipeStageSelectView)
        view.addSubview(bottomPipeStageSelectView)
        view.addSubview(brickStageView)
        view.addSubview(fireStageView)
        view.addSubview(metalStageView)
        view.addSubview(iceStageView)
        view.addSubview(centerStageView)
        view.addSubview(skyStageView)
        view.addSubview(snowStageView)
        view.addSubview(waterStageView)
        view.addSubview(sandStageView)
        
        view.addSubview(titleView)
        view.addSubview(titleLogoView)
        view.addSubview(startTitleTextView)
        
        setupPausedTextView()
        setupTitleView()
        setupStageSelectView()
        setupGameView()
        setupLeftCoverView()
        setupRightCoverView()
        setupJumpButton()
        setupShootButton()
        setupPauseButton()
        setupWeaponLeftButton()
        setupWeaponRightButton()
        setupLeftButton()
        setupRightButton()
        setupUpButton()
        setupDownButton()
        setupJoystickView()
        setupTouchView()
        
        updateControlVisibility(isHidden: true)
    }
    
    func setupPausedTextView() {
        pausedTextView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        pausedTextView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        pausedTextView.widthAnchor.constraint(equalToConstant: Block.width * (47 / 16)).isActive = true
        pausedTextView.heightAnchor.constraint(equalToConstant: Block.height * (7 / 16)).isActive = true
    }
    
    func setupTitleView() {
        titleView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        titleView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: gameView.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: gameView.heightAnchor).isActive = true
    }
    
    func setupStageSelectView() {
        stageSelectView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        stageSelectView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        stageSelectView.widthAnchor.constraint(equalTo: gameView.widthAnchor).isActive = true
        stageSelectView.heightAnchor.constraint(equalTo: gameView.heightAnchor).isActive = true
    }
    
    func setupGameView() {
        gameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gameView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        gameView.widthAnchor.constraint(equalTo: gameView.heightAnchor, multiplier: screenRatio).isActive = true
    }
    
    func setupLeftCoverView() {
        leftCoverView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftCoverView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftCoverView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        leftCoverView.rightAnchor.constraint(equalTo: gameView.leftAnchor).isActive = true
    }
    
    func setupRightCoverView() {
        rightCoverView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightCoverView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightCoverView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rightCoverView.leftAnchor.constraint(equalTo: gameView.rightAnchor).isActive = true
    }
    
    func setupJumpButton() {
        jumpButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -mainButtonSpacing).isActive = true
        jumpButton.widthAnchor.constraint(equalToConstant: mainButtonRadius * 2).isActive = true
        jumpButton.heightAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        jumpButton.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor, constant: mainButtonSpacing).isActive = true
    }
    
    func setupShootButton() {
        shootButton.rightAnchor.constraint(equalTo: jumpButton.leftAnchor, constant: -mainButtonSpacing).isActive = true
        shootButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        shootButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        shootButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
    
    func setupPauseButton() {
        pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: mainButtonSpacing).isActive = true
        pauseButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        pauseButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        pauseButton.centerXAnchor.constraint(equalTo: jumpButton.centerXAnchor).isActive = true
    }
    
    func setupWeaponLeftButton() {
        weaponLeftButton.topAnchor.constraint(equalTo: view.topAnchor, constant: mainButtonSpacing).isActive = true
        weaponLeftButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        weaponLeftButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        weaponLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: mainButtonSpacing).isActive = true
    }
    
    func setupWeaponRightButton() {
        weaponRightButton.topAnchor.constraint(equalTo: weaponLeftButton.bottomAnchor, constant: mainButtonSpacing / 2).isActive = true
        weaponRightButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        weaponRightButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        weaponRightButton.centerXAnchor.constraint(equalTo: weaponLeftButton.centerXAnchor).isActive = true
    }
    
    func setupLeftButton() {
        leftButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: mainButtonSpacing).isActive = true
        leftButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: downButton.centerYAnchor, constant: -mainButtonSpacing / 2).isActive = true
    }
    
    func setupRightButton() {
        rightButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: mainButtonSpacing).isActive = true
        rightButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor).isActive = true
    }
    
    func setupUpButton() {
        upButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        upButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        upButton.bottomAnchor.constraint(equalTo: leftButton.centerYAnchor, constant: -mainButtonSpacing / 2).isActive = true
        upButton.leftAnchor.constraint(equalTo: leftButton.centerXAnchor, constant: mainButtonSpacing / 2).isActive = true
    }
    
    func setupDownButton() {
        downButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        downButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        downButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -mainButtonSpacing / 2).isActive = true
        downButton.centerXAnchor.constraint(equalTo: upButton.centerXAnchor).isActive = true
    }
    
    func setupJoystickView() {
        joystickView.topAnchor.constraint(equalTo: touchView.topAnchor).isActive = true
        joystickView.bottomAnchor.constraint(equalTo: touchView.bottomAnchor).isActive = true
        joystickView.leftAnchor.constraint(equalTo: touchView.leftAnchor).isActive = true
        joystickView.rightAnchor.constraint(equalTo: touchView.rightAnchor).isActive = true
    }
    
    func setupTouchView() {
        touchView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        touchView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        touchView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        touchView.rightAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        
        setupStageSelectTitleView()
        setupBrickStageView()
        setupFireStageView()
        setupMetalStageView()
        setupIceStageView()
        setupCenterStageView()
        setupSkyStageView()
        setupSnowStageView()
        setupWaterStageView()
        setupSandStageView()
        setupTopPipeStageSelectView()
        setupMiddlePipeStageSelectView()
        setupBottomPipeStageSelectView()
        
        setupTitleLogoView()
        setupStartTitleTextView()
    }
    
    func setupTitleLogoView() {
        
        setWidthHeight(width: Block.width * (140 / 16), height: Block.height * (60 / 16), imageView: titleLogoView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: (titleLogoView.frame.size.height / 2) + Block.height * 3, imageView: titleLogoView, isCentered: true)
    }
    
    func setupStartTitleTextView() {
        
        setWidthHeight(width: Block.width * (93 / 16), height: Block.height * (7 / 16), imageView: startTitleTextView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: (titleLogoView.frame.size.height / 2) + Block.height * 8.125, imageView: startTitleTextView, isCentered: true)
    }
    
    func setupStageSelectTitleView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (7 / 16), imageView: stageSelectTitleView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: Block.height * 1, imageView: stageSelectTitleView, isCentered: true)
    }
    
    func setupBrickStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        //        print(verticalSpacing)
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: brickStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16)), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + verticalSpacing, imageView: brickStageView, isCentered: false)
    }
    
    func setupFireStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: fireStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16) * 3) + (Block.width * (48 / 16) * 2), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + verticalSpacing, imageView: fireStageView, isCentered: false)
    }
    
    func setupMetalStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: metalStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16)), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 3) + Block.width * (48 / 16) * 2, imageView: metalStageView, isCentered: false)
    }
    
    func setupIceStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: iceStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16) * 3) + (Block.width * (48 / 16) * 2), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 3) + Block.width * (48 / 16) * 2, imageView: iceStageView, isCentered: false)
    }
    
    func setupCenterStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: centerStageView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: 0, imageView: centerStageView, isCentered: true)
        setXY(x: centerStageView.frame.origin.x, y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 2) + Block.width * (48 / 16), imageView: centerStageView, isCentered: false)
    }
    
    func setupSkyStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: skyStageView)
        setXY(x: centerStageView.frame.origin.x, y: brickStageView.frame.origin.y, imageView: skyStageView, isCentered: false)
    }
    
    func setupSnowStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: snowStageView)
        setXY(x: brickStageView.frame.origin.x, y: centerStageView.frame.origin.y, imageView: snowStageView, isCentered: false)
    }
    
    func setupWaterStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: waterStageView)
        setXY(x: fireStageView.frame.origin.x, y: centerStageView.frame.origin.y, imageView: waterStageView, isCentered: false)
    }
    
    func setupSandStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        //        let verticalSpacing: CGFloat = (240 - (Block.height * (7 / 16) + Block.height * 1)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: sandStageView)
        setXY(x: centerStageView.frame.origin.x, y: metalStageView.frame.origin.y, imageView: sandStageView, isCentered: false)
    }
    
    func setupTopPipeStageSelectView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (8 / 16), imageView: topPipeStageSelectView)
        setXY(x: centerStageView.frame.origin.x + (centerStageView.frame.size.width / 2), y: brickStageView.frame.origin.y + (brickStageView.frame.size.height / 2), imageView: topPipeStageSelectView, isCentered: true)
    }
    
    func setupMiddlePipeStageSelectView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (8 / 16), imageView: middlePipeStageSelectView)
        setXY(x: centerStageView.frame.origin.x + (centerStageView.frame.size.width / 2), y: centerStageView.frame.origin.y + (centerStageView.frame.size.height / 2), imageView: middlePipeStageSelectView, isCentered: true)
    }
    
    func setupBottomPipeStageSelectView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (8 / 16), imageView: bottomPipeStageSelectView)
        setXY(x: centerStageView.frame.origin.x + (centerStageView.frame.size.width / 2), y: metalStageView.frame.origin.y + (metalStageView.frame.size.height / 2), imageView: bottomPipeStageSelectView, isCentered: true)
    }
}
