//
//  SnakeBodyPart.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 05.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let diameter = 10.0
    
    // добавляем конструктор
    init(atPoint point: CGPoint) {
        super.init()
        // рисуем круглый элемент
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: CGFloat(diameter), height: CGFloat(diameter))).cgPath
        // цвет рамки и заливки
        fillColor = UIColor.green
        strokeColor = UIColor.green
        // ширина рамки 5 поинтов
        lineWidth = 5
        // размещаем элемент в переданной точке
        self.position = point
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
