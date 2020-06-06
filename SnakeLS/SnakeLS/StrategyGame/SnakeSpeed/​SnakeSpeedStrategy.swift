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

// увеличение скорости в геометрической прогрессии
final class ​GeometricProgressionSnakeSpeedStrategy: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    
    private let diff = 1.1 // коэффициент во сколько раз будет увеличиваться скорость
    
    func increaseSpeedByEatingApple() {
        guard let snake = snake else { return }
        snake.moveSpeed.value *= diff
        if let maxSpeed = maxSpeed {
            if snake.moveSpeed.value > maxSpeed {
                snake.moveSpeed.value = maxSpeed
            }
        }
    }
    
}
