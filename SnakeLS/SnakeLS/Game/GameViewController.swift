//
//  GameViewController.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 03.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var onGameEnd: ((Int) -> Void)?
    
    var difficulty: Difficulty = .medium
    
    private var createAppleStrategy: CreateApplesStrategy {
        switch self.difficulty {
        case .easy:
            return SequentialCreateOneAppleStrategy()
        case .medium, .hard, .insane:
            return RandomCreateOneAppleStrategy()
        }
    }
    
    private var snakeSpeedStrategy: SnakeSpeedStrategy {
        switch self.difficulty {
        case .easy, .medium:
            return NotIncreaseSnakeSpeedStrategy​()
        case .hard:
            let strategy = ArithmeticProgressionSnakeSpeedStrategy​()
            strategy.maxSpeed = 1000.0
            return strategy
        case .insane:
            return ​GeometricProgressionSnakeSpeedStrategy()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // создаю экземпляр сцены
        let scene = GameScene(size: view.bounds.size,
                              createApplesStrategy: self.createAppleStrategy,
                              snakeSpeedStrategy: self.snakeSpeedStrategy)
        scene.onGameEnd = { [weak self] result in
            self?.onGameEnd?(result)
            self?.dismiss(animated: true, completion: nil)
        }
        
        // получаю главную область экрана
        let skView = view as! SKView
        
        // включаю отображение fps (количество кадров в секунду)
        skView.showsFPS = true
        
        // показываю на экране количество объектов
        skView.showsNodeCount = true
        
        // включаю произвольный порядок рендеринга объектов в узле
        skView.ignoresSiblingOrder = true
        
        // растягиваю режим отображение сцены на все доступное пространстов
        scene.scaleMode = .resizeFill
        
        // добавляю сцену на экран
        skView.presentScene(scene)
        
    }
}
