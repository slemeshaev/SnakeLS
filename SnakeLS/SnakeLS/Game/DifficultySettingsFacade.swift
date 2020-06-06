//
//  DifficultySettingsFacade.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 04.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit

final class DifficultySettingsFacade {
    
    let difficulty: Difficulty
    
    weak var snake: Snake? {
        didSet {
            snakeSpeedStrategy.snake = snake
        }
    }
    
    // MARK: - Strategies
    
    private lazy var createApplesStrategy: CreateApplesStrategy = {
        switch self.difficulty {
        case .easy:
            return SequentialCreateOneAppleStrategy()
        case .medium, .hard, .insane:
            return RandomCreateOneAppleStrategy()
        }
    }()
    
    private lazy var snakeSpeedStrategy: SnakeSpeedStrategy = {
        switch self.difficulty {
        case .easy, .medium:
            return NotIncreaseSnakeSpeedStrategy()
        case .hard:
            let strategy = ArithmeticProgressionSnakeSpeedStrategy()
            strategy.maxSpeed = 350.0
            return strategy
        case .insane:
            return GeometricProgressionSnakeSpeedStrategy()
        }
    }()
    
    // MARK: - Init
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    // MARK: - Methods
    
    func createApples(in scene: SKScene) -> [Apple] {
        return createApplesStrategy.createApples(in: scene.frame)
    }
    
    func increaseSnakeSpeed() {
        self.snakeSpeedStrategy.increaseSpeedByEatingApple()
    }
}
