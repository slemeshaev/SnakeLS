//
//  GameScene.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 03.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // вызывается при первом запуске сцены
    override func didMove(to view: SKView) {
        // цвет фона сцены
        backgroundColor = SKColor.black
        // вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        // выключаем внешние воздействия на игру
        self.physicsBody?.allowsRotation = false
        // включаем отображение отладочной информации
        view.showsPhysics = true
        
        // Делаем кнопку поворота против часовой стрелки
        // создаю нодe (объект)
        let counterClockwiseButton = SKShapeNode()
        // задаю форму круга
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height:  45)).cgPath
        // указываю координаты размещения
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minX + 30)
        // цвет заливки кнопки
        counterClockwiseButton.fillColor = UIColor.gray
        // цвет рамки кнопки
        counterClockwiseButton.strokeColor = UIColor.gray
        // толщина рамки
        counterClockwiseButton.lineWidth = 10
        // имя объекта для взаимодействия
        counterClockwiseButton.name = "counterClockwiseButton"
        // добавляю на сцену
        self.addChild(counterClockwiseButton)
    }
    
    // вызывается при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    // вызывается при прекращении нажатия на экран
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    // вызывается при обрыве нажатия на экран (при приеме звонка, например)
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    // вызывается при обработке кадров сцены
    override func update(_ currentTime: TimeInterval) {
        //
    }
    
}
