//
//  NotIncreaseSnakeSpeedStrategy​.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 06.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

// простая стратегия (ничего не делает)
final class NotIncreaseSnakeSpeedStrategy​: SnakeSpeedStrategy {
    var snake: Snake?
    var maxSpeed: Double?
    func increaseSpeedByEatingApple() {}
}
