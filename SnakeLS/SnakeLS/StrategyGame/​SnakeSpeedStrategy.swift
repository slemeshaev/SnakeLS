//
//  ​SnakeSpeedStrategy.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 03.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol SnakeSpeedStrategy: class {
    var snake: Snake? { get set }
    var maxSpeed: Double? { get set }
    func increaseSpeedByEatingApple()
}

// простая стратегия (ничего не делает)
final class NotIncreaseSnakeSpeedStrategy​: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    func increaseSpeedByEatingApple() {}
}

// стратегия увеличения скорости в арифметической прогрессии
final class ArithmeticProgressionSnakeSpeedStrategy​: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    
    private let diff = 10.0 // на сколько будет увеличена скорость
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed += self.diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed > maxSpeed {
                snake.moveSpeed = maxSpeed
            }
        }
    }
}

// увеличение скорости в геометрической прогрессии
final class ​GeometricProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    
    private let diff = 1.1 // коэффициент во сколько раз будет увеличиваться скорость
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed *= diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed > maxSpeed {
                snake.moveSpeed = maxSpeed
            }
        }
    }
}
