//
//  Snake.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 05.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit

// змейка
class Snake: SKShapeNode {
    
    // массив, где хранятся сегменты тела
    var body = [SnakeBodyPart]()
    
    // конструктор
    convenience init(atPoint point: CGPoint) {
        self.init()
        // змейка начинается с головы, создадим ее
        let head = SnakeHead(atPoint: point)
        // и добавим ее в массив
        body.append(head)
        // и сделаем ее дочерним объектом
        addChild(head)
    }
    
    // метод добавляет еще один сегмент тела
    func addBodyPart() {
        // инстанцируем сегмент
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        // добавляем его в массив
        body.append(newBodyPart)
        // делаем дочерним объектом
        addChild(newBodyPart)
    }
}
