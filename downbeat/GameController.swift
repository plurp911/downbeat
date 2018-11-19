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
    
    let buttonSpacing: CGFloat = 30

    lazy var jumpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        button.setTitle("⇪", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.35).cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleJump), for: .touchUpInside)
        return button
    }()
    
    @objc func handleJump() {
        
        print("JUMP")
        
    }
    
    lazy var shootButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        button.setTitle("◎", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.35).cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleShoot), for: .touchUpInside)
        return button
    }()
    
    @objc func handleShoot() {
        
        print("SHOOT")
        
    }
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.35).cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleLeft), for: .touchUpInside)
        button.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        return button
    }()
    
    @objc func handleLeft() {
        
        print("LEFT")
        
    }
    
    lazy var rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        button.setTitle("⇧", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.semibold)
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.35).cgColor
        button.layer.cornerRadius = mainButtonRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.textAlignment = .center
        button.titleLabel!.numberOfLines = 1
        button.addTarget(self, action: #selector(handleRight), for: .touchUpInside)
        button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        return button
    }()
    
    @objc func handleRight() {
        
        print("RIGHT")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(jumpButton)
        view.addSubview(shootButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        
        setupJumpButton()
        setupShootButton()
        setupLeftButton()
        setupRightButton()
    }
    
    func setupJumpButton() {
        jumpButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -buttonSpacing).isActive = true
        jumpButton.widthAnchor.constraint(equalToConstant: mainButtonRadius * 2).isActive = true
        jumpButton.heightAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        jumpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -buttonSpacing).isActive = true
    }
    
    func setupShootButton() {
        shootButton.rightAnchor.constraint(equalTo: jumpButton.leftAnchor, constant: -buttonSpacing).isActive = true
        shootButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        shootButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        shootButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
    
    func setupLeftButton() {
        leftButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: buttonSpacing).isActive = true
        leftButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        leftButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        leftButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
    
    func setupRightButton() {
        rightButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: buttonSpacing).isActive = true
        rightButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        rightButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }
}
