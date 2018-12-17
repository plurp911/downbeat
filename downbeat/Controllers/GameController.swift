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

    // VARIABLES
    
    var moveTimer = Timer()
    
    var isOnJoyStick: Bool = false

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
        
        if player.isKnockedBack == false {
            
//            if bullets.count < 3 {
            
                player.shoot()
//            }
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
    
    func setXY(x: CGFloat, y: CGFloat, imageView: UIImageView) {
        
        imageView.frame.origin.x = x - (imageView.frame.size.width / 2)
        imageView.frame.origin.y = y - (imageView.frame.size.height / 2)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        joystick.setOuterXY(x: Joystick.outerRadius + (joystickSpacing * 2.5), y: screenSize.height - Joystick.outerRadius - (joystickSpacing * 0.5))
        joystick.resetInnerXY()
        joystick.showViews()
        
        loadLevels()
        
        setLevel(level: levels[0])
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(gameView)
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
        
        view.addSubview(stageSelectView)
        view.addSubview(stageSelectTitleView)

        setupStageSelectView()
        setupGameView()
        setupLeftCoverView()
        setupRightCoverView()
        setupJumpButton()
        setupShootButton()
        setupLeftButton()
        setupRightButton()
        setupUpButton()
        setupDownButton()
        setupJoystickView()
        setupTouchView()
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
    }
    
    func setupStageSelectTitleView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (7 / 16), imageView: stageSelectTitleView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: Block.height * 1, imageView: stageSelectTitleView)
    }
}
