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
    
    // скорость перемещения змеи
    var moveSpeed = 125.0
    
    // угол, необходимый для расчета направления
    var angle: CGFloat = 0.0
    
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
    
    // метод перемещения змейки
    func move() {
        // если у змейки нет головы, ничего не перемещаем
        guard !body.isEmpty else { return }
        // перемещаем голову
        let head = body[0]
        moveHead(head)
        // перемещаем все сегменты тела
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            moveBodyPart(previousBodyPart, c: currentBodyPart)
        }
    }
    
    // перемещаем голову
    func moveHead(_ head: SnakeBodyPart) {
        // рассчитываем смешение точки
        let dx = CGFloat(moveSpeed) * sin(angle)
        let dy = CGFloat(moveSpeed) * cos(angle)
        // смещаем точку назначения головы
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        // действие перемещение головы
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        // запуск действия перемещения
        head.run(moveAction)
    }
    
    // перемещаем сегмент змеи
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart) {
        // перемещаем текущий элемент к предыдущему
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        // запуск действия перемещения
        c.run(moveAction)
    }
    
    // поворот по часовой стрелке
    func moveClockwise() {
        // смещаем угол на 45 градусов
        angle += CGFloat(Double.pi/2)
    }
    
    // поворот против часовой стрелке
    func moveCounterClockwise() {
        // смещаем угол на 45 градусов
        angle -= CGFloat(Double.pi/2)
    }
}
