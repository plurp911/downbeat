//
//  GameController.swift
//  downbeat
//
//  Created by Collin Howard on 11/18/18.
//  Copyright © 2018 Collin Howard. All rights reserved.
//

import UIKit
import Darwin
import Foundation
import AVFoundation
import AudioToolbox
import StoreKit

class GameController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    // IN APP PURCHASE FUNCTIONS
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        
        if queue.transactions.count != 0 {
            
            didPurchaseFullGame = true
            
            updateLockedStageViews()
            
            saveDidPurchaseFullGame()
            
            UIAlertView(title: "PURCHASE RESTORED", message: "You've successfully restored your purchase!", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    func fetchAvailableProducts()  {
        
        let productIdentifiers = NSSet(objects:
            REMOVEADS_PRODUCT_ID
        )
        
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func productsRequest (_ request:SKProductsRequest, didReceive response:SKProductsResponse) {
        
        if (response.products.count > 0) {
            iapProducts = response.products
        }
    }
    
    func canMakePurchases() -> Bool {  return SKPaymentQueue.canMakePayments()  }
    
    func purchaseMyProduct(product: SKProduct) {
        
        if self.canMakePurchases() {
            
            let payment = SKPayment(product: product)
            
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
            //print("PRODUCT TO PURCHASE: \(product.productIdentifier)")
            
            productID = product.productIdentifier
            
        } else {
            
            UIAlertView(title: "PURCHASE ERROR", message: "Purchases are disabled on your device!", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction:AnyObject in transactions {
            
            if let trans = transaction as? SKPaymentTransaction {
                
                switch trans.transactionState {
                    
                case .purchased:
                    
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    
                    if productID == REMOVEADS_PRODUCT_ID {
                        
                        didPurchaseFullGame = true
                        
                        updateLockedStageViews()
                        
                        saveDidPurchaseFullGame()
                        
                        //UIAlertView(title: "ADS REMOVED", message: "You've successfully removed full screen ads!", delegate: nil, cancelButtonTitle: "OK").show()
                    }
                    
                    break
                    
                case .failed:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                case .restored:
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    break
                default:
                    break
                }
            }
            
        }
    }
    
    // IN APP PURCHASE VARIABLES
    
    let REMOVEADS_PRODUCT_ID = "com.collinhoward.downbeat.fullgame"
    
    var productID = ""
    var productsRequest = SKProductsRequest()
    var iapProducts = [SKProduct]()
    
    // CONSTANTS
    
    let mainButtonSpacing: CGFloat = 32.5
    
    let joystickSpacing: CGFloat = 35
    
    let cancelButtonSpacing: CGFloat = Block.height * (5 / 16)
    
    let pausedButtonWidth: CGFloat = Block.width * (155 / 16)
    let pausedButtonHeight: CGFloat = Block.height * (31 / 16)
    
    let pausedButtonSpacing: CGFloat = Block.height * (5 / 16)
    
    let purchaseButtonWidth: CGFloat = Block.width * (155 / 16)
    let purchaseButtonHeight: CGFloat = Block.height * (31 / 16)
    
    let purchaseButtonSpacing: CGFloat = Block.height * (16 / 16)
    
    let purchaseButtonBorderWidth: CGFloat = Block.width * (2 / 16)
    
    let pausedButtonBorderWidth: CGFloat = Block.width * (2 / 16)
    
    let settingsButtonWidth: CGFloat = Block.width * (155 / 16)
    let settingsButtonHeight1: CGFloat = Block.height * (48 / 16)
    let settingsButtonHeight2: CGFloat = Block.height * (31 / 16)
    
    let settingsButtonSpacing1: CGFloat = Block.height * (5 / 16)
    let settingsButtonSpacing2: CGFloat = Block.height * (25 / 16)
    
    let settingsButtonBorderWidth: CGFloat = Block.width * (2 / 16)
    
    let weaponButtonSpacing: CGFloat = Block.height * (5 / 16)
    
    let completedStageOpacity: CGFloat = 0.2
    
    let shadowOpacity: CGFloat = 0.2
    
    let deathTimeInterval: CGFloat = 2
    
    let winTimeInterval: CGFloat = 2
    
    let loadingTimeInterval: CGFloat = 0.25
    
    // VARIABLES
    
    var moveTimer = Timer()
    
    var isOnJoyStick: Bool = false
    
    var startTitleTextOpacity: CGFloat = 1
    
    var isGettingDarker: Bool = false
    
    var completedStageSelectTiles = [UIImageView]()
    
    var lockedStageSelectTiles = [UIImageView]()
    
    var deathTimer = Timer()
    
    var loadingTimer = Timer()
    
    var currentTrack: String = ""
    
    var isFromPaused: Bool = false
    var isFromSettings: Bool = false
    
    var controlOpacity: CGFloat = 0.2

    lazy var titleView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "titleBackground")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTitleView)))
        return view
    }()
    
    @objc func handleTitleView() {
        
        playSound(name: "menu")
        
        playTrack(track: "stageSelect")
        
        updateTitleVisibility(isHidden: true)
        updateStageSelectVisibility(isHidden: false)
    }
    
    lazy var purchaseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleCancel), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        button.isHidden = true
        return button
    }()
    
    @objc func handleCancel() {
        
        updatePurchaseVisibility(isHidden: true)
        
        if isFromSettings == true {
            
            updateSettingsVisibility(isHidden: false)
            
        } else {
            
            updateStageSelectVisibility(isHidden: false)
        }
    }
    
    lazy var loadingBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var gameOverView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "gameOverBackground")
        view.isUserInteractionEnabled = true
        view.isHidden = true
        return view
    }()
    
    lazy var congratulationsView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "congratulationsBackground")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCongratulationsView)))
        view.isHidden = true
        return view
    }()
    
    @objc func handleCongratulationsView() {
        
        playSound(name: "menu")
        
        completedLevels = [false, false, false, false, false, false, false, false]
        
        saveCompletedLevels()
        
        updateCompletedStageViews()
        
        updatePausedVisibility(isHidden: true)
        updateCongratulationsVisibility(isHidden: true)
        updateTitleVisibility(isHidden: false)
    }
    
    var stageSelectView: UIView = {
        let view = UIView()
        view.backgroundColor = stageSelectViewColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    var stageSelectTitleView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectTitle")
        return view
    }()
    
    var topPipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        return view
    }()
    
    var middlePipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        return view
    }()
    
    var bottomPipeStageSelectView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "stageSelectPipe")
        return view
    }()
    
    lazy var brickStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "brickBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBrickStage)))
        return view
    }()
    
    @objc func handleBrickStage() {
        
        playSound(name: "menu")
        
        handleSelectedStage(type: "brick")
        
        gameViewColor = UIColor(red: 0 / 255, green: 136 / 255, blue: 203 / 255, alpha: 1)

        setLevel(level: levels[0])
    }
    
    lazy var fireStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "fireBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFireStage)))
        return view
    }()
    
    @objc func handleFireStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "fire")
            
            gameViewColor = UIColor(red: 185 / 255, green: 48 / 255, blue: 48 / 255, alpha: 1)
            
            setLevel(level: levels[1])
        }
    }
    
    lazy var metalStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "metalBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMetalStage)))
        return view
    }()
    
    @objc func handleMetalStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "metal")

            gameViewColor = UIColor(red: 152 / 255, green: 152 / 255, blue: 152 / 255, alpha: 1)
            
            setLevel(level: levels[2])
        }
    }
    
    lazy var iceStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "iceBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleIceStage)))
        return view
    }()
    
    @objc func handleIceStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "ice")
            
            gameViewColor = UIColor(red: 27 / 255, green: 111 / 255, blue: 121 / 255, alpha: 1)
            
            setLevel(level: levels[3])
        }
    }
    
    lazy var centerStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "chemicalBossStageSelectTileHolder")
        view.isUserInteractionEnabled = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCenterStage)))
        return view
    }()
    
    @objc func handleCenterStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "chemical")
            
            gameViewColor = UIColor(red: 145 / 255, green: 107 / 255, blue: 189 / 255, alpha: 1)
            
            setLevel(level: levels[8])
        }
    }
    
    lazy var skyStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "skyBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSkyStage)))
        return view
    }()
    
    @objc func handleSkyStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "sky")
            
            gameViewColor = UIColor(red: 136 / 255, green: 198 / 255, blue: 253 / 255, alpha: 1)
            
            setLevel(level: levels[4])
        }
    }
    
    lazy var snowStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "snowBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSnowStage)))
        return view
    }()
    
    @objc func handleSnowStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "snow")
            
            gameViewColor = UIColor(red: 75 / 255, green: 147 / 255, blue: 156 / 255, alpha: 1)
            
            setLevel(level: levels[5])
        }
    }
    
    lazy var waterStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "waterBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleWaterStage)))
        return view
    }()
    
    @objc func handleWaterStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "water")
            
            gameViewColor = UIColor(red: 0 / 255, green: 63 / 255, blue: 66 / 255, alpha: 1)
            
            setLevel(level: levels[6])
        }
    }
    
    lazy var sandStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "sandBossStageSelectTile")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSandStage)))
        return view
    }()
    
    @objc func handleSandStage() {
        
        if didPurchaseFullGame == true {
            
            playSound(name: "menu")
            
            handleSelectedStage(type: "sand")
            
            gameViewColor = UIColor(red: 227 / 255, green: 179 / 255, blue: 89 / 255, alpha: 1)
            
            setLevel(level: levels[7])
        }
    }
    
    lazy var centerShadowStageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.black.withAlphaComponent(completedStageOpacity)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = nil
        view.isHidden = true
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
    
    lazy var restoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = purchaseButtonColor
        button.layer.borderWidth = purchaseButtonBorderWidth
        button.layer.borderColor = purchaseButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "restoreText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, left: Block.width * (0 / 16), bottom: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handleRestore), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handleRestore() {
        
        playSound(name: "menu")
        
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = purchaseButtonColor
        button.layer.borderWidth = purchaseButtonBorderWidth
        button.layer.borderColor = purchaseButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "purchaseText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, left: Block.width * (0 / 16), bottom: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handlePurchase), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handlePurchase() {
        
        playSound(name: "menu")
        
        purchaseMyProduct(product: iapProducts[0])
    }
    
    lazy var resumeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = pausedButtonColor
        button.layer.borderWidth = pausedButtonBorderWidth
        button.layer.borderColor = pausedButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "resumeText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, left: Block.width * (0 / 16), bottom: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handleResume), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handleResume() {
        
        if isLoading == false {
            
            if isMusicMuted == false {
                
                musicPlayer?.play()
            }
            
            playSound(name: "menu")
        }
        
        isPaused = false
        
        updatePausedVisibility(isHidden: true)
        updateControlVisibility(isHidden: false)
        
        player.handleResume()
        
        for bullet in bullets {
            bullet.handleResume()
        }
        
        for enemy in selectedEnemies {
            enemy.handleResume()
        }
        
        if let thisStage = currentStage {
            
            for specialEnemy in thisStage.specialEnemies {
                specialEnemy.handleResume()
            }
        }
        
        for enemySpawner in selectedEnemySpawners {
            enemySpawner.handleResume()
        }
        
        for enemyBullet in enemyBullets {
            enemyBullet.handleResume()
        }
    }
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = pausedButtonColor
        button.layer.borderWidth = pausedButtonBorderWidth
        button.layer.borderColor = pausedButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "retryText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, left: Block.width * (0 / 16), bottom: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handleRetry), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handleRetry() {
        
        playSound(name: "menu")
        
        updateGameOverVisibility(isHidden: true)
        updateControlVisibility(isHidden: false)
        
        handleSelectedStage(type: currentTrack)
        
        setLevel(level: currentLevel!)
    }
    
    lazy var quitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = pausedButtonColor
        button.layer.borderWidth = pausedButtonBorderWidth
        button.layer.borderColor = pausedButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "quitText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, left: Block.width * (0 / 16), bottom: (pausedButtonHeight - (Block.height * (7 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handleQuit), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handleQuit() {
        
        musicPlayer?.pause()
        
        playSound(name: "menu")
        
        if gameOverView.isHidden == true {
            
            playTrack(track: "stageSelect")
            
            updatePausedVisibility(isHidden: true)
            updateStageSelectVisibility(isHidden: false)
            
        } else {
            
            updateGameOverVisibility(isHidden: true)
            updateTitleVisibility(isHidden: false)
        }
    }
    
    lazy var jumpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "jumpButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleJump), for: .touchDown)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchUpOutside)
        button.addTarget(self, action: #selector(handleJumpCancel), for: .touchCancel)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
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
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "shootButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleShoot), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        return button
    }()
    
    @objc func handleShoot() {
        
        if player.isKnockedBack == false {
            
            //            if bullets.count < 3 {
            
            player.shoot()
            //            }
        }
        
    }
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "settingsButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleSettings), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        button.isHidden = true
        return button
    }()
    
    @objc func handleSettings() {
        
        playSound(name: "menu")
        
        if isFromPaused == true {
            
            updatePausedVisibility(isHidden: true)
            
        } else {
            
            updateStageSelectVisibility(isHidden: true)
        }
        
        updateSettingsVisibility(isHidden: false)
    }
    
    lazy var settingsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleClose), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        button.isHidden = true
        return button
    }()
    
    @objc func handleClose() {
        
        playSound(name: "menu")
        
        updateSettingsVisibility(isHidden: true)
        
        if isFromPaused == true {
            
            updatePausedVisibility(isHidden: false)
            
        } else {
            
            updateStageSelectVisibility(isHidden: false)
        }
    }
    
    var opacityTextView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.magnificationFilter = CALayerContentsFilter.nearest
        view.image = UIImage(named: "opacityText")
        view.isHidden = true
        return view
    }()
    
    lazy var opacitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.1
        slider.maximumValue = 1.0
        slider.isContinuous = true
        slider.tintColor = UIColor.white
        slider.value = Float(controlOpacity)
        slider.setThumbImage(nil, for: .normal)
        slider.addTarget(self, action: #selector(handleOpacitySlider), for: .valueChanged)
        slider.addTarget(self, action: #selector(handleOpacitySliderEnd), for: .touchUpInside)
        slider.addTarget(self, action: #selector(handleOpacitySliderEnd), for: .touchUpOutside)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.isHidden = true
        return slider
    }()
    
    @objc func handleOpacitySlider(sender: UISlider!) {
        
        updateControlVisibility2(isHidden: false)
        
        let newControlOpacity = CGFloat(sender.value)
        
        controlOpacity = newControlOpacity
        
        updateControlOpacity()
        saveControlOpacity()
    }
    
    @objc func handleOpacitySliderEnd() {
        
        updateControlVisibility2(isHidden: true)
    }
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = settingsButtonColor
        button.layer.borderWidth = settingsButtonBorderWidth
        button.layer.borderColor = settingsButtonOtherColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.tintColor = UIColor.white
        button.setImage(UIImage(named: "buyText"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: (settingsButtonHeight1 - (Block.height * (24 / 16))) / 2, left: Block.width * (0 / 16), bottom: (settingsButtonHeight1 - (Block.height * (24 / 16))) / 2, right: Block.width * (0 / 16))
        button.addTarget(self, action: #selector(handleBuy), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        button.isHidden = true
        return button
    }()
    
    @objc func handleBuy() {
        
        playSound(name: "menu")
        
        isFromSettings = true
        
        updateSettingsVisibility(isHidden: true)
        updatePurchaseVisibility(isHidden: false)
    }
    
    lazy var buyShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(shadowOpacity)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var restoreShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(shadowOpacity)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "pauseButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handlePause), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        button.isHidden = true
        return button
    }()
    
    @objc func handlePause() {
        
        musicPlayer?.pause()
        
        isPaused = true
        
        updateControlVisibility(isHidden: true)
        
        if gameOverView.isHidden == true {
            
            isFromPaused = true
            
            playSound(name: "menu")
            
            updatePausedVisibility(isHidden: false)
            
        }
        
        isOnJoyStick = false
        
        joystick.resetInnerXY()
        
        player.handlePause()
        
        for bullet in bullets {
            bullet.handlePause()
        }
        
        for enemy in selectedEnemies {
            enemy.handlePause()
        }
        
        if let thisStage = currentStage {
         
            for specialEnemy in thisStage.specialEnemies {
                specialEnemy.handlePause()
            }
        }
        
        for enemySpawner in selectedEnemySpawners {
            enemySpawner.handlePause()
        }
        
        for enemyBullet in enemyBullets {
            enemyBullet.handlePause()
        }
    }
    
    lazy var muteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "isMutedButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleMute), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        button.isHidden = true
        return button
    }()
    
    @objc func handleMute() {
        
        if isMusicMuted == false {
            
            musicPlayer?.stop()
            
            for soundPlayer in players {
                
                soundPlayer?.stop()
            }
            
            players.removeAll()
            
            isMusicMuted = true
            isSoundMuted = true
            
            muteButton.setImage(UIImage(named: "isMutedButton"), for: .normal)
            
        } else {
            
            isMusicMuted = false
            isSoundMuted = false
            
            playSound(name: "menu")
            
            if isFromPaused == false {
                
                playTrack(track: "stageSelect")
                
            } else {
                
                playTrack(track: currentTrack)
                
                musicPlayer?.stop()
            }
            
            muteButton.setImage(UIImage(named: "isNotMutedButton"), for: .normal)
        }
        
        saveMutedSettings()
    }
    
    lazy var weaponLeftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "weaponLeftButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleWeaponLeft), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        return button
    }()
    
    @objc func handleWeaponLeft() {
        
        player.cycleWeapon(isNext: false)
    }

    lazy var weaponRightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.imageView?.layer.magnificationFilter = CALayerContentsFilter.nearest
        button.setImage(UIImage(named: "weaponRightButton"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(handleWeaponRight), for: .touchDown)
        button.adjustsImageWhenHighlighted = false
        button.alpha = controlOpacity
        return button
    }()
    
    @objc func handleWeaponRight() {
        
        player.cycleWeapon(isNext: true)
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
        
        if isHidden == false {
            
            isFromPaused = false
        }
        
        settingsButton.isHidden = isHidden
        
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
        
        centerShadowStageView.isHidden = isHidden
        
        for i in 0 ..< completedStageSelectTiles.count {
            completedStageSelectTiles[i].isHidden = isHidden
        }
        
        for i in 0 ..< lockedStageSelectTiles.count {
            lockedStageSelectTiles[i].isHidden = isHidden
        }
    }
    
    func updateSettingsVisibility(isHidden: Bool) {
        
        settingsView.isHidden = isHidden
        closeButton.isHidden = isHidden
        muteButton.isHidden = isHidden
        opacityTextView.isHidden = isHidden
        opacitySlider.isHidden = isHidden
        buyButton.isHidden = isHidden
        restoreButton.isHidden = isHidden
        
        if didPurchaseFullGame == true {
            
            buyShadowView.isHidden = isHidden
            restoreShadowView.isHidden = isHidden
        }
    }
    
    func updateLoadingVisibility(isHidden: Bool) {
        
        loadingBackgroundView.isHidden = isHidden
        loadingView.isHidden = isHidden
    }
    
    func updatePurchaseVisibility(isHidden: Bool) {
        
        purchaseView.isHidden = isHidden
        purchaseButton.isHidden = isHidden
        cancelButton.isHidden = isHidden
    }
    
    func updateTitleVisibility(isHidden: Bool) {
        
        titleView.isHidden = isHidden
    }
    
    func updateGameOverVisibility(isHidden: Bool) {
        
        gameOverView.isHidden = isHidden
        retryButton.isHidden = isHidden
        quitButton.isHidden = isHidden
    }
    
    func updateCongratulationsVisibility(isHidden: Bool) {
        
        congratulationsView.isHidden = isHidden
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
    
    func updateControlVisibility2(isHidden: Bool) {
        
        joystickView.isHidden = isHidden
        touchView.isHidden = isHidden
        jumpButton.isHidden = isHidden
        shootButton.isHidden = isHidden
        weaponLeftButton.isHidden = isHidden
        weaponRightButton.isHidden = isHidden
    }
    
    func updatePausedVisibility(isHidden: Bool) {
        
        settingsButton.isHidden = isHidden
        
        resumeButton.isHidden = isHidden
        retryButton.isHidden = isHidden
        quitButton.isHidden = isHidden
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
        //        completedLevels = [false, false, false, false, false, false, false, false]
    }
    
    func saveMutedSettings() {
        
        let tempDefault1 = UserDefaults.standard
        
        tempDefault1.setValue(isMusicMuted, forKey: "isMusicMuted")
        tempDefault1.synchronize()
        
        let tempDefault2 = UserDefaults.standard
        
        tempDefault2.setValue(isSoundMuted, forKey: "isSoundMuted")
        tempDefault2.synchronize()
    }
    
    func loadMutedSettings() {
        
        let tempDefault1 = UserDefaults.standard
        
        if let savedIsMusicMuted = tempDefault1.value(forKey: "isMusicMuted") {
            isMusicMuted = savedIsMusicMuted as! Bool
        }
        
        let tempDefault2 = UserDefaults.standard
        
        if let savedIsSoundMuted = tempDefault2.value(forKey: "isSoundMuted") {
            isSoundMuted = savedIsSoundMuted as! Bool
        }
        
        if isMusicMuted == true {
            
            musicPlayer?.stop()
            
            for soundPlayer in players {
                
                soundPlayer?.stop()
            }
            
            players.removeAll()
            
            isMusicMuted = true
            isSoundMuted = true
            
            muteButton.setImage(UIImage(named: "isMutedButton"), for: .normal)
            
        } else {
            
            isMusicMuted = false
            isSoundMuted = false
            
            muteButton.setImage(UIImage(named: "isNotMutedButton"), for: .normal)
        }
        
        saveMutedSettings()
    }
    
    func handleSelectedStage(type: String) {
        
        // BACKUP PLAN
        
        // loadLevels()
        
        isLoading = true
        
        musicPlayer?.stop()

        updateStageSelectVisibility(isHidden: true)
        updateLoadingVisibility(isHidden: false)
        
        currentTrack = type
        
        loadingTimer.invalidate()
        
        loadingTimer = Timer.scheduledTimer(timeInterval: TimeInterval(loadingTimeInterval), target: self, selector: #selector(handleLoaded), userInfo: nil, repeats: false)
    }
    
    func createCompletedStageViews() {
        
        completedStageSelectTiles.removeAll()
        
        for i in 0 ..< completedLevels.count {
            
            let imageView: UIImageView = UIImageView()
            
            //            imageView.backgroundColor = UIColor.clear
            imageView.backgroundColor = UIColor.black.withAlphaComponent(completedStageOpacity)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.layer.magnificationFilter = CALayerContentsFilter.nearest
            //            imageView.image = UIImage(named: "completedStageSelectTile")
            imageView.image = nil
            imageView.isHidden = false
            
            imageView.frame.size.width = brickStageView.frame.size.width
            imageView.frame.size.height = brickStageView.frame.size.height
            
            if i == 0 {
                
                imageView.frame.origin.x = iceStageView.frame.origin.x
                imageView.frame.origin.y = iceStageView.frame.origin.y
                
            } else if i == 1 {
                
                imageView.frame.origin.x = fireStageView.frame.origin.x
                imageView.frame.origin.y = fireStageView.frame.origin.y
                
            } else if i == 2 {
                
                imageView.frame.origin.x = snowStageView.frame.origin.x
                imageView.frame.origin.y = snowStageView.frame.origin.y
                
            } else if i == 3 {
                
                imageView.frame.origin.x = waterStageView.frame.origin.x
                imageView.frame.origin.y = waterStageView.frame.origin.y
                
            } else if i == 4 {
                
                imageView.frame.origin.x = skyStageView.frame.origin.x
                imageView.frame.origin.y = skyStageView.frame.origin.y
                
            } else if i == 5 {
                
                imageView.frame.origin.x = metalStageView.frame.origin.x
                imageView.frame.origin.y = metalStageView.frame.origin.y
                
            } else if i == 6 {
                
                imageView.frame.origin.x = sandStageView.frame.origin.x
                imageView.frame.origin.y = sandStageView.frame.origin.y
                
            } else if i == 7 {
                
                imageView.frame.origin.x = brickStageView.frame.origin.x
                imageView.frame.origin.y = brickStageView.frame.origin.y
            }
            
            completedStageSelectTiles.append(imageView)
            
            view.addSubview(completedStageSelectTiles[completedStageSelectTiles.count - 1])
        }
    }
    
    func setupCompletedStageViews() {
        
        for i in 0 ..< completedStageSelectTiles.count {
            
            completedStageSelectTiles[i].frame.size.width = brickStageView.frame.size.width
            completedStageSelectTiles[i].frame.size.height = brickStageView.frame.size.height
            
            if i == 0 {
                
                completedStageSelectTiles[i].frame.origin.x = iceStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = iceStageView.frame.origin.y
                
            } else if i == 1 {
                
                completedStageSelectTiles[i].frame.origin.x = fireStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = fireStageView.frame.origin.y
                
            } else if i == 2 {
                
                completedStageSelectTiles[i].frame.origin.x = snowStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = snowStageView.frame.origin.y
                
            } else if i == 3 {
                
                completedStageSelectTiles[i].frame.origin.x = waterStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = waterStageView.frame.origin.y
                
            } else if i == 4 {
                
                completedStageSelectTiles[i].frame.origin.x = skyStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = skyStageView.frame.origin.y
                
            } else if i == 5 {
                
                completedStageSelectTiles[i].frame.origin.x = metalStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = metalStageView.frame.origin.y
                
            } else if i == 6 {
                
                completedStageSelectTiles[i].frame.origin.x = sandStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = sandStageView.frame.origin.y
                
            } else if i == 7 {
                
                completedStageSelectTiles[i].frame.origin.x = brickStageView.frame.origin.x
                completedStageSelectTiles[i].frame.origin.y = brickStageView.frame.origin.y
            }
        }
        
    }
    
    func updateCompletedStageViews() {
        
        for i in 0 ..< completedLevels.count {
            
            if completedLevels[i] == true {
                
                //                completedStageSelectTiles[i].isHidden = false
                completedStageSelectTiles[i].alpha = 1
                
            } else {
                
                //                completedStageSelectTiles[i].isHidden = true
                completedStageSelectTiles[i].alpha = 0
            }
        }
        
        var didComplete: Bool = true
        
        for level in completedLevels {
            
            if level == false {
                
                didComplete = false
            }
        }
        
        if didComplete == true {
            
            centerStageView.isUserInteractionEnabled = true
            
            centerStageView.image = UIImage(named: "chemicalBossStageSelectTile")
            
            centerShadowStageView.alpha = 0
            
        } else {
            
            centerStageView.isUserInteractionEnabled = false
            
            centerStageView.image = UIImage(named: "chemicalBossStageSelectTileHolder")
            
            centerShadowStageView.alpha = 1
        }
    }
    
    func createLockedStageViews() {
        
        lockedStageSelectTiles.removeAll()
        
        for i in 0 ..< completedLevels.count {
            
            let imageView: UIImageView = UIImageView()
            
            imageView.backgroundColor = UIColor.clear
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.layer.magnificationFilter = CALayerContentsFilter.nearest
            imageView.image = UIImage(named: "lockedStageSelectTile")
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLockedView)))
            imageView.isHidden = false
            
            imageView.frame.size.width = brickStageView.frame.size.width
            imageView.frame.size.height = brickStageView.frame.size.height
            
            if i == 0 {
                
                imageView.frame.origin.x = iceStageView.frame.origin.x
                imageView.frame.origin.y = iceStageView.frame.origin.y
                
            } else if i == 1 {
                
                imageView.frame.origin.x = fireStageView.frame.origin.x
                imageView.frame.origin.y = fireStageView.frame.origin.y
                
            } else if i == 2 {
                
                imageView.frame.origin.x = snowStageView.frame.origin.x
                imageView.frame.origin.y = snowStageView.frame.origin.y
                
            } else if i == 3 {
                
                imageView.frame.origin.x = waterStageView.frame.origin.x
                imageView.frame.origin.y = waterStageView.frame.origin.y
                
            } else if i == 4 {
                
                imageView.frame.origin.x = skyStageView.frame.origin.x
                imageView.frame.origin.y = skyStageView.frame.origin.y
                
            } else if i == 5 {
                
                imageView.frame.origin.x = metalStageView.frame.origin.x
                imageView.frame.origin.y = metalStageView.frame.origin.y
                
            } else if i == 6 {
                
                imageView.frame.origin.x = sandStageView.frame.origin.x
                imageView.frame.origin.y = sandStageView.frame.origin.y
                
            } else if i == 7 {
                
                imageView.frame.origin.x = centerStageView.frame.origin.x
                imageView.frame.origin.y = centerStageView.frame.origin.y
            }
            
            if i == 7 {
                
                imageView.backgroundColor = UIColor.clear
                
            } else {
                
                imageView.backgroundColor = UIColor.black.withAlphaComponent(completedStageOpacity)
            }
            
            lockedStageSelectTiles.append(imageView)
            
            view.addSubview(lockedStageSelectTiles[lockedStageSelectTiles.count - 1])
        }
    }
    
    func setupLockedStageViews() {
        
        for i in 0 ..< lockedStageSelectTiles.count {
            
            lockedStageSelectTiles[i].frame.size.width = brickStageView.frame.size.width
            lockedStageSelectTiles[i].frame.size.height = brickStageView.frame.size.height
            
            if i == 0 {
                
                lockedStageSelectTiles[i].frame.origin.x = iceStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = iceStageView.frame.origin.y
                
            } else if i == 1 {
                
                lockedStageSelectTiles[i].frame.origin.x = fireStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = fireStageView.frame.origin.y
                
            } else if i == 2 {
                
                lockedStageSelectTiles[i].frame.origin.x = snowStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = snowStageView.frame.origin.y
                
            } else if i == 3 {
                
                lockedStageSelectTiles[i].frame.origin.x = waterStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = waterStageView.frame.origin.y
                
            } else if i == 4 {
                
                lockedStageSelectTiles[i].frame.origin.x = skyStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = skyStageView.frame.origin.y
                
            } else if i == 5 {
                
                lockedStageSelectTiles[i].frame.origin.x = metalStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = metalStageView.frame.origin.y
                
            } else if i == 6 {
                
                lockedStageSelectTiles[i].frame.origin.x = sandStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = sandStageView.frame.origin.y
                
            } else if i == 7 {
                
                lockedStageSelectTiles[i].frame.origin.x = centerStageView.frame.origin.x
                lockedStageSelectTiles[i].frame.origin.y = centerStageView.frame.origin.y
            }
        }
        
    }
    
    func updateLockedStageViews() {
        
        for i in 0 ..< completedLevels.count {
            
            if didPurchaseFullGame == true {
                
                //                lockedStageSelectTiles[i].isHidden = true
                lockedStageSelectTiles[i].alpha = 0
                
                lockedStageSelectTiles[i].isUserInteractionEnabled = false
                
            } else {
                
                //                lockedStageSelectTiles[i].isHidden = false
                lockedStageSelectTiles[i].alpha = 1
                
                lockedStageSelectTiles[i].isUserInteractionEnabled = true
            }
        }
        
    }
    
    @objc func handleLockedView() {
        
        isFromSettings = false
        
        updateStageSelectVisibility(isHidden: true)
        updatePurchaseVisibility(isHidden: false)
    }
    
    @objc func handleLoaded() {
        
        isLoading = false
        
        loadingTimer.invalidate()
        
        playTrack(track: currentTrack)
        
        updateLoadingVisibility(isHidden: true)
        updateControlVisibility(isHidden: false)
    }
    
    func saveDidPurchaseFullGame() {
        
        let didPurchaseFullGameDefault = UserDefaults.standard
        didPurchaseFullGameDefault.setValue(didPurchaseFullGame, forKey: "didPurchaseFullGame")
        didPurchaseFullGameDefault.synchronize()
    }
    
    func loadDidPurchaseFullGame() {
        
        let didPurchaseFullGameDefault = UserDefaults.standard
        
        if let savedDidPurchaseFullGame = didPurchaseFullGameDefault.value(forKey: "didPurchaseFullGame") {
            didPurchaseFullGame = savedDidPurchaseFullGame as! Bool
        }
    }
    
    func updateControlOpacity() {
        
        touchView.alpha = controlOpacity
        jumpButton.alpha = controlOpacity
        shootButton.alpha = controlOpacity
        pauseButton.alpha = controlOpacity
        weaponLeftButton.alpha = controlOpacity
        weaponRightButton.alpha = controlOpacity
        
        joystick.innerImageView.alpha = controlOpacity
        joystick.outerImageView.alpha = controlOpacity
        
        cancelButton.alpha = controlOpacity
        settingsButton.alpha = controlOpacity
        closeButton.alpha = controlOpacity
        muteButton.alpha = controlOpacity
    }
    
    func saveControlOpacity() {
        
        let controlOpacityDefault = UserDefaults.standard
        controlOpacityDefault.setValue(controlOpacity, forKey: "controlOpacity")
        controlOpacityDefault.synchronize()
    }
    
    func loadControlOpacity() {
        
        let controlOpacityDefault = UserDefaults.standard
        
        if let savedControlOpacity = controlOpacityDefault.value(forKey: "controlOpacity") {
            controlOpacity = savedControlOpacity as! CGFloat
        }
        
        opacitySlider.value = Float(controlOpacity)
        
        updateControlOpacity()
    }
    
    func updateSpeeds() {
        
        Player.updateSpeeds()
        DeflectedBullet.updateSpeeds()
        Powerup.updateSpeeds()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchAvailableProducts()
        
        loadDidPurchaseFullGame()
        
        updateSpeeds()
        
        loadMutedSettings()
        loadControlOpacity()
        
//        joystick.setOuterXY(x: Joystick.outerRadius + (joystickSpacing * 2.5), y: screenSize.height - Joystick.outerRadius - (joystickSpacing * 0.5))
//        joystick.setOuterXY(x: Joystick.outerRadius + (newVal(oldVal: joystickSpacing) * 2.5), y: screenSize.height - Joystick.outerRadius - (newVal(oldVal: joystickSpacing) * 0.5))
        joystick.setOuterXY(x: Joystick.outerRadius + (newVal(oldVal: joystickSpacing) * 0.5), y: screenSize.height - Joystick.outerRadius - (newVal(oldVal: joystickSpacing) * 0.5))
        joystick.resetInnerXY()
        joystick.showViews()
        
        loadCompletedLevels()
        loadLevels()
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(gameView)

        view.addSubview(leftCoverView)
        view.addSubview(rightCoverView)
        
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
        
        view.addSubview(centerShadowStageView)
        
        view.addSubview(settingsButton)
        view.addSubview(settingsView)
        view.addSubview(closeButton)
        view.addSubview(muteButton)
        view.addSubview(opacityTextView)
        view.addSubview(opacitySlider)
        view.addSubview(buyButton)
        view.addSubview(restoreButton)
        view.addSubview(buyShadowView)
        view.addSubview(restoreShadowView)

        view.addSubview(joystickView)
        
        joystickView.addSubview(joystick.outerImageView)
        joystickView.addSubview(joystick.innerImageView)
        
        view.addSubview(touchView)
        view.addSubview(jumpButton)
        view.addSubview(shootButton)
        view.addSubview(pauseButton)
        view.addSubview(weaponLeftButton)
        view.addSubview(weaponRightButton)
        
        createCompletedStageViews()
        createLockedStageViews()
        
        view.addSubview(gameOverView)
        
        view.addSubview(resumeButton)
        view.addSubview(retryButton)
        view.addSubview(quitButton)
        
        view.addSubview(congratulationsView)
        
        view.addSubview(titleView)
        
        view.addSubview(purchaseView)
        view.addSubview(purchaseButton)
        view.addSubview(cancelButton)
        
        view.addSubview(loadingBackgroundView)
        view.addSubview(loadingView)
        
        setupResumeButton()
        setupRetryButton()
        setupQuitButton()
        setupGameOverView()
        setupCongratulationsView()
        setupTitleView()
        setupPurchaseView()
        setupRestoreButton()
        setupPurchaseButton()
        setupCancelButton()
        setupStageSelectView()
        setupGameView()
        setupLeftCoverView()
        setupRightCoverView()
        setupJumpButton()
        setupShootButton()
        setupPauseButton()
        
        setupSettingsButton()
        setupSettingsView()
        setupCloseButton()
        setupMuteButton()
        setupOpacityTextView()
        setupOpacitySlider()
        setupBuyButton()
        setupBuyShadowView()
        setupRestoreShadowView()
        
        setupLoadingBackgroundView()
        setupLoadingView()
        
        setupWeaponLeftButton()
        setupWeaponRightButton()
        setupJoystickView()
        setupTouchView()
        
        updateControlVisibility(isHidden: true)
    }
    
    func setupSettingsButton() {
        
        if #available(iOS 11.0, *) {
            settingsButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -settingsButtonSpacing1).isActive = true
        } else {
            settingsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -settingsButtonSpacing1).isActive = true
        }

        settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: settingsButtonSpacing1).isActive = true
        settingsButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        settingsButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
    }
    
    func setupSettingsView() {
        settingsView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        settingsView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        settingsView.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        settingsView.heightAnchor.constraint(equalTo: titleView.heightAnchor).isActive = true
    }
    
    func setupCloseButton() {
        closeButton.centerXAnchor.constraint(equalTo: settingsButton.centerXAnchor).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: settingsButton.centerYAnchor).isActive = true
        closeButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        closeButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
    }
    
    func setupMuteButton() {
        muteButton.centerXAnchor.constraint(equalTo: closeButton.centerXAnchor).isActive = true
        muteButton.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: settingsButtonSpacing1).isActive = true
        muteButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        muteButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
    }
    
    func setupOpacityTextView() {
        opacityTextView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        opacityTextView.topAnchor.constraint(equalTo: gameView.topAnchor, constant: settingsButtonSpacing2).isActive = true
        opacityTextView.widthAnchor.constraint(equalToConstant: Block.width * (111 / 16)).isActive = true
        opacityTextView.heightAnchor.constraint(equalToConstant: Block.height * (7 / 16)).isActive = true
    }
    
    func setupOpacitySlider() {
        opacitySlider.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        opacitySlider.widthAnchor.constraint(equalTo: gameView.widthAnchor, constant: -Block.width * (64 / 16)).isActive = true
        opacitySlider.centerYAnchor.constraint(equalTo: gameView.centerYAnchor, constant: -Block.height * (40 / 16)).isActive = true
        opacitySlider.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    func setupBuyButton() {
        buyButton.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: restoreButton.topAnchor, constant: -settingsButtonSpacing1).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: settingsButtonWidth).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: settingsButtonHeight1).isActive = true
    }
    
    func setupBuyShadowView() {
        buyShadowView.centerXAnchor.constraint(equalTo: buyButton.centerXAnchor).isActive = true
        buyShadowView.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor).isActive = true
        buyShadowView.widthAnchor.constraint(equalTo: buyButton.widthAnchor).isActive = true
        buyShadowView.heightAnchor.constraint(equalTo: buyButton.heightAnchor).isActive = true
    }
    
    func setupRestoreShadowView() {
        restoreShadowView.centerXAnchor.constraint(equalTo: restoreButton.centerXAnchor).isActive = true
        restoreShadowView.centerYAnchor.constraint(equalTo: restoreButton.centerYAnchor).isActive = true
        restoreShadowView.widthAnchor.constraint(equalTo: restoreButton.widthAnchor).isActive = true
        restoreShadowView.heightAnchor.constraint(equalTo: restoreButton.heightAnchor).isActive = true
    }
    
    func setupResumeButton() {
        resumeButton.centerXAnchor.constraint(equalTo: retryButton.centerXAnchor).isActive = true
        resumeButton.bottomAnchor.constraint(equalTo: retryButton.topAnchor, constant: -pausedButtonSpacing).isActive = true
        resumeButton.widthAnchor.constraint(equalTo: retryButton.widthAnchor).isActive = true
        resumeButton.heightAnchor.constraint(equalTo: retryButton.heightAnchor).isActive = true
    }
    
    func setupRetryButton() {
        retryButton.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        retryButton.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        retryButton.widthAnchor.constraint(equalToConstant: pausedButtonWidth).isActive = true
        retryButton.heightAnchor.constraint(equalToConstant: pausedButtonHeight).isActive = true
    }
    
    func setupQuitButton() {
        quitButton.centerXAnchor.constraint(equalTo: retryButton.centerXAnchor).isActive = true
        quitButton.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: pausedButtonSpacing).isActive = true
        quitButton.widthAnchor.constraint(equalTo: retryButton.widthAnchor).isActive = true
        quitButton.heightAnchor.constraint(equalTo: retryButton.heightAnchor).isActive = true
    }
    
    func setupGameOverView() {
        gameOverView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        gameOverView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        gameOverView.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        gameOverView.heightAnchor.constraint(equalTo: titleView.heightAnchor).isActive = true
    }
    
    func setupCongratulationsView() {
        congratulationsView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        congratulationsView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        congratulationsView.widthAnchor.constraint(equalTo: titleView.widthAnchor).isActive = true
        congratulationsView.heightAnchor.constraint(equalTo: titleView.heightAnchor).isActive = true
    }
    
    func setupTitleView() {
        titleView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        titleView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: gameView.widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: gameView.heightAnchor).isActive = true
    }
    
    func setupPurchaseView() {
        purchaseView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        purchaseView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        purchaseView.widthAnchor.constraint(equalTo: gameView.widthAnchor).isActive = true
        purchaseView.heightAnchor.constraint(equalTo: gameView.heightAnchor).isActive = true
    }
    
    func setupRestoreButton() {
        restoreButton.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        restoreButton.bottomAnchor.constraint(equalTo: gameView.bottomAnchor, constant: -settingsButtonSpacing2).isActive = true
        restoreButton.widthAnchor.constraint(equalToConstant: settingsButtonWidth).isActive = true
        restoreButton.heightAnchor.constraint(equalToConstant: settingsButtonHeight2).isActive = true
    }

    func setupPurchaseButton() {
        purchaseButton.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        purchaseButton.bottomAnchor.constraint(equalTo: purchaseView.bottomAnchor, constant: -purchaseButtonSpacing).isActive = true
        purchaseButton.widthAnchor.constraint(equalToConstant: purchaseButtonWidth).isActive = true
        purchaseButton.heightAnchor.constraint(equalToConstant: purchaseButtonHeight).isActive = true
    }
    
    func setupCancelButton() {
        cancelButton.widthAnchor.constraint(equalToConstant: Block.width * (49 / 16)).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: closeButton.centerXAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor).isActive = true
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
        
        if #available(iOS 11.0, *) {
            jumpButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -newVal(oldVal: mainButtonSpacing)).isActive = true
        } else {
            jumpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -newVal(oldVal: mainButtonSpacing)).isActive = true
        }
        
//        jumpButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -mainButtonSpacing).isActive = true
        jumpButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        jumpButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
        jumpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Block.width * (49 / 16) * 0.5).isActive = true
    }

    func setupShootButton() {
//        shootButton.rightAnchor.constraint(equalTo: jumpButton.leftAnchor, constant: -mainButtonSpacing).isActive = true
        shootButton.rightAnchor.constraint(equalTo: jumpButton.leftAnchor, constant: -newVal(oldVal: mainButtonSpacing)).isActive = true
        shootButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        shootButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
        shootButton.centerYAnchor.constraint(equalTo: jumpButton.centerYAnchor).isActive = true
    }

    func setupPauseButton() {
        pauseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: pausedButtonSpacing).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: Block.width * (49 / 16)).isActive = true
        pauseButton.heightAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        
        if #available(iOS 11.0, *) {
            pauseButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -pausedButtonSpacing).isActive = true
        } else {
            pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -pausedButtonSpacing).isActive = true
        }
    }
    
    func setupLoadingBackgroundView() {
        loadingBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loadingBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    func setupLoadingView() {
        loadingView.centerXAnchor.constraint(equalTo: gameView.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: gameView.centerYAnchor).isActive = true
        loadingView.widthAnchor.constraint(equalTo: gameView.widthAnchor).isActive = true
        loadingView.heightAnchor.constraint(equalTo: gameView.heightAnchor).isActive = true
    }
    
    func setupWeaponLeftButton() {
        weaponLeftButton.topAnchor.constraint(equalTo: view.topAnchor, constant: weaponButtonSpacing).isActive = true
        weaponLeftButton.widthAnchor.constraint(equalTo: jumpButton.widthAnchor).isActive = true
        weaponLeftButton.heightAnchor.constraint(equalTo: jumpButton.heightAnchor).isActive = true
//        weaponLeftButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: mainButtonSpacing).isActive = true
        
        if #available(iOS 11.0, *) {
            weaponLeftButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: newVal(oldVal: mainButtonSpacing)).isActive = true
        } else {
            weaponLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: newVal(oldVal: mainButtonSpacing)).isActive = true
        }
    }
    
    func setupWeaponRightButton() {
        weaponRightButton.topAnchor.constraint(equalTo: weaponLeftButton.bottomAnchor, constant: weaponButtonSpacing).isActive = true
        weaponRightButton.widthAnchor.constraint(equalTo: pauseButton.widthAnchor).isActive = true
        weaponRightButton.heightAnchor.constraint(equalTo: pauseButton.heightAnchor).isActive = true
        weaponRightButton.centerXAnchor.constraint(equalTo: weaponLeftButton.centerXAnchor).isActive = true
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
        setupSandStageView()
        setupCenterStageView()
        setupSkyStageView()
        setupSnowStageView()
        setupWaterStageView()
        setupIceStageView()
        setupCenterShadowStageView()
        setupTopPipeStageSelectView()
        setupMiddlePipeStageSelectView()
        setupBottomPipeStageSelectView()
        
        setupCompletedStageViews()
        updateCompletedStageViews()
        
        setupLockedStageViews()
        updateLockedStageViews()
        
//        joystick.setOuterXY(x: Joystick.outerRadius + (joystickSpacing * 2.5), y: screenSize.height - Joystick.outerRadius - (joystickSpacing * 0.5))
//        joystick.setOuterXY(x: Joystick.outerRadius + (newVal(oldVal: joystickSpacing) * 2.5), y: screenSize.height - Joystick.outerRadius - (newVal(oldVal: joystickSpacing) * 0.5))
        joystick.setOuterXY(x: Joystick.outerRadius + (newVal(oldVal: joystickSpacing) * 0.5), y: screenSize.height - Joystick.outerRadius - (newVal(oldVal: joystickSpacing) * 0.5))
        joystick.resetInnerXY()
    }

    func setupStageSelectTitleView() {
        
        setWidthHeight(width: Block.width * (256 / 16), height: Block.height * (7 / 16), imageView: stageSelectTitleView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: Block.height * 1, imageView: stageSelectTitleView, isCentered: true)
    }
    
    func setupBrickStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: brickStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16)), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + verticalSpacing, imageView: brickStageView, isCentered: false)
    }
    
    func setupFireStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: fireStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16) * 3) + (Block.width * (48 / 16) * 2), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + verticalSpacing, imageView: fireStageView, isCentered: false)
    }
    
    func setupMetalStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: metalStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16)), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 3) + Block.width * (48 / 16) * 2, imageView: metalStageView, isCentered: false)
    }
    
    func setupIceStageView() {
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: iceStageView)
        setXY(x: centerStageView.frame.origin.x, y: metalStageView.frame.origin.y, imageView: iceStageView, isCentered: false)
        setXY(x: centerStageView.frame.origin.x + (centerStageView.frame.size.width / 2), y: iceStageView.frame.origin.y + (iceStageView.frame.size.height / 2), imageView: iceStageView, isCentered: true)
    }
    
    func setupCenterStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: centerStageView)
        setXY(x: stageSelectView.frame.origin.x + (stageSelectView.frame.size.width / 2), y: 0, imageView: centerStageView, isCentered: true)
        setXY(x: centerStageView.frame.origin.x, y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 2) + Block.width * (48 / 16), imageView: centerStageView, isCentered: false)
    }
    
    func setupSkyStageView() {
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: skyStageView)
        setXY(x: centerStageView.frame.origin.x, y: brickStageView.frame.origin.y, imageView: skyStageView, isCentered: false)
        setXY(x: centerStageView.frame.origin.x + (centerStageView.frame.size.width / 2), y: skyStageView.frame.origin.y + (skyStageView.frame.size.height / 2), imageView: skyStageView, isCentered: true)
    }
    
    func setupSnowStageView() {
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: snowStageView)
        setXY(x: brickStageView.frame.origin.x, y: centerStageView.frame.origin.y, imageView: snowStageView, isCentered: false)
    }
    
    func setupWaterStageView() {
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: waterStageView)
        setXY(x: fireStageView.frame.origin.x, y: centerStageView.frame.origin.y, imageView: waterStageView, isCentered: false)
    }
    
    func setupSandStageView() {
        
        let verticalSpacing: CGFloat = (Block.height * (96 / 16) - (stageSelectTitleView.frame.size.height + stageSelectTitleView.frame.origin.y)) / 4

        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: sandStageView)
        setXY(x: stageSelectView.frame.origin.x + (Block.width * (28 / 16) * 3) + (Block.width * (48 / 16) * 2), y: stageSelectTitleView.frame.origin.y + stageSelectTitleView.frame.size.height + (verticalSpacing * 3) + Block.width * (48 / 16) * 2, imageView: sandStageView, isCentered: false)
    }
    
    func setupCenterShadowStageView() {
        
        setWidthHeight(width: Block.width * (48 / 16), height: Block.height * (48 / 16), imageView: centerShadowStageView)
        setXY(x: centerStageView.frame.origin.x, y: centerStageView.frame.origin.y, imageView: centerShadowStageView, isCentered: false)
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
    
    // MUSIC FUNCTIONS

    func playTrack(track: String) {
        
        if isMusicMuted == false {
            
            musicPlayer?.stop()
            
            let url = Bundle.main.url(forResource: track, withExtension: "mp3")!
            
            do {
                
                musicPlayer = try AVAudioPlayer(contentsOf: url)
                
                guard let musicPlayer = musicPlayer else { return }
                
                var volume: Float = 0
                
                if track == "brick" {
                    volume = 0.5
                } else if track == "sky" {
                    volume = 0.5
                } else if track == "fire" {
                    volume = 0.5
                } else if track == "snow" {
                    volume = 0.5
                } else if track == "water" {
                    volume = 0.5
                } else if track == "metal" {
                    volume = 0.5
                } else if track == "sand" {
                    volume = 0.5
                } else if track == "ice" {
                    volume = 0.5
                } else if track == "chemical" {
                    volume = 0.5
                } else if track == "congratulations" {
                    volume = 0.5
                } else if track == "stageSelect" {
                    volume = 0.5
                } else {
                    print("PLAY TRACK ERROR")
                }
                
                musicPlayer.volume = volume
                
                musicPlayer.numberOfLoops = -1
                
                musicPlayer.prepareToPlay()
                musicPlayer.play()
                
            } catch let error as NSError {
                print(error.description)
            }
            
        }
    }
    
}
