//
//  ​GeometricProgressionSnakeSpeedStrategy.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 06.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

// увеличение скорости в геометрической прогрессии
final class GeometricProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    
    private let diff = 1.1
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed.value *= self.diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
}
