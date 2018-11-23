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
    
    let mainButtonRadius: CGFloat = 37
    
    let mainButtonSpacing: CGFloat = 30
        
    // VARIABLES
    
    var moveTimer = Timer()

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
        //        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchDragExit)
        //        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchDragOutside)
        return button
    }()
    
    @objc func handleJump() {
        
        print("JUMP")
        
        if player.isKnockedBack == false {
            
            if player.isJumping == false && player.ySpeed == 0 {
                
                player.jump()
                
//                player.updateAnimation()
            }
        }
        
    }
    
    @objc func handleJumpCancel() {
        
        print("JUMP CANCEL")
        
        if player.isRising == true && player.isJumping == true && player.ySpeed < 0 {
            player.stopJump()
        }
    }
    
    lazy var shootButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = mainButtonColor
        button.setTitle("◎", for: .normal)
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
        
        print("SHOOT")
        
        if player.isKnockedBack == false {
            
            if bullets.count < 3 {
                
                player.shoot()
                
//                player.updateAnimation()
            }
        }
        
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
//        button.addTarget(self, action: #selector(handleLeftCancel), for: .touchDragExit)
//        button.addTarget(self, action: #selector(handleLeftCancel), for: .touchDragOutside)
        button.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        return button
    }()
    
    @objc func handleLeft() {
        
        isLeftPressed = true
        
//        if player.isKnockedBack == false {
//
//            print("LEFT")
//
//            player.isMoving = true
//            player.isMovingLeft = true
//
//            player.isMovingRight = false
//
//            player.direction = "left"
//
//            player.updateAnimation()
//        }
    }
    
    @objc func handleLeftCancel() {
        
        isLeftPressed = false
        
//        print("LEFT CANCEL")
//
//        player.isMoving = false
//        player.isMovingLeft = false
//
//        player.updateAnimation()
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
//        button.addTarget(self, action: #selector(handleRightCancel), for: .touchDragExit)
//        button.addTarget(self, action: #selector(handleRightCancel), for: .touchDragOutside)
        button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        return button
    }()
    
    @objc func handleRight() {
        
        isRightPressed = true
        
//        if player.isKnockedBack == false {
//
//            print("RIGHT")
//
//            player.isMoving = true
//            player.isMovingRight = true
//
//            player.isMovingLeft = false
//
//            player.direction = "right"
//
//            player.updateAnimation()
//        }
    }
    
    @objc func handleRightCancel() {
        
        isRightPressed = false

//        print("RIGHT CANCEL")
//
//        player.isMoving = false
//        player.isMovingRight = false
//
//        player.updateAnimation()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadStages()
        
        setupStage()
        
        player.reset()
        
        moveTimer = Timer.scheduledTimer(timeInterval: (1 / 120), target: self, selector: #selector(move), userInfo: nil, repeats: true)
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(gameView)
        view.addSubview(leftCoverView)
        view.addSubview(rightCoverView)
        view.addSubview(jumpButton)
        view.addSubview(shootButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        
        setupGameView()
        setupLeftCoverView()
        setupRightCoverView()
        setupJumpButton()
        setupShootButton()
        setupLeftButton()
        setupRightButton()
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
        jumpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -mainButtonSpacing).isActive = true
    }
    
    func setupShootButton() {
        shootButton.rightAnchor.constraint(equalTo: jumpButton.leftAnchor, constant: -mainButtonSpacing).isActive = true
        shootButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        shootButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        shootButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
    
    func setupLeftButton() {
        leftButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: mainButtonSpacing).isActive = true
        leftButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        leftButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
    
    func setupRightButton() {
        rightButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: mainButtonSpacing).isActive = true
        rightButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
}
