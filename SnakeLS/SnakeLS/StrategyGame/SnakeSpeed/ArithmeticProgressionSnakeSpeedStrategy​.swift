//
//  ArithmeticProgressionSnakeSpeedStrategy​.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 06.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

// стратегия увеличения скорости в арифметической прогрессии
final class ArithmeticProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    
    private let diff = 10.0
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed.value += self.diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
    
}
