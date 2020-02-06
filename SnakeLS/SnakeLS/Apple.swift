//
//  Apple.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 04.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit

// яблоко для змейки
class Apple: SKShapeNode {
    // определяем, как оно будет отрисовываться
    convenience init(position: CGPoint) {
        self.init()
        // рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        // заливаем красным
        fillColor = UIColor.red
        // рамка тоже красная
        strokeColor = UIColor.red
        // ширина рамки 5 поинтов
        lineWidth = 5
        self.position = position
        // Добавляем физическое тело, совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
    }
}
