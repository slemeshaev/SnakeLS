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
    
    // наша змея
    var snake: Snake?
    
    // яблоко
    var apple: Apple?
    
    // завершение игры
    var onGameEnd: ((Int) -> Void)?
    
    // свойство вариант сложности
    fileprivate let difficultyFacade: DifficultySettingsFacade
    
    init(size: CGSize, difficulty: Difficulty) {
        self.difficultyFacade = DifficultySettingsFacade(difficulty: difficulty)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SKScene
    
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
        
        // Делаем нашу сцену делегатом соприкосновений
        self.physicsWorld.contactDelegate = self
        
        // устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        // устанавливаем категории, с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
        // Делаем кнопку поворота против часовой стрелки
        // создаю нодe (объект)
        let counterClockwiseButton = SKShapeNode()
        // задаю форму круга
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height:  45)).cgPath
        // указываю координаты размещения
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minX + 30)
        // цвет заливки левой кнопки
        counterClockwiseButton.fillColor = UIColor.gray
        // цвет рамки левой кнопки
        counterClockwiseButton.strokeColor = UIColor.gray
        // толщина рамки
        counterClockwiseButton.lineWidth = 10
        // имя объекта для взаимодействия
        counterClockwiseButton.name = "counterClockwiseButton"
        // добавляю левую кнопку на сцену
        self.addChild(counterClockwiseButton)
        
        // Делаем кнопку поворота по часовой стрелке
        let clockwiseButton = SKShapeNode()
        // задаю форму круга
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        // указываю координаты размещения
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        // цвет заливки правой кнопки
        clockwiseButton.fillColor = UIColor.gray
        // цвет рамки правой кнопки
        clockwiseButton.strokeColor = UIColor.gray
        // толщина рамки
        clockwiseButton.lineWidth = 10
        // имя объекта для взаимодействия
        clockwiseButton.name = "clockwiseButton"
        // добавляю правую кнопку на сцену
        self.addChild(clockwiseButton)
        // создаем яблоко на старте
        createApple()
        // создаем змею по центру экрана и добавляем ее на сцену
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    // вызывается при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // перебираем все точки, куда прикоснулся палец
        for touch in touches {
            // определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            // проверяем, есть ли объект по этим координатам
            // и если есть, то не наша ли это кнопка
            guard  let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else { return }
            // если это наша кнопка, заливаем ее зеленым цветом
            touchedNode.fillColor = .green
            // определяем, какая кнопка нажата, и поворачиваем в нужную сторону
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
    // вызывается при прекращении нажатия на экран
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // перебираем все точки, куда прикоснулся палец
        for touch in touches {
            // определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            // проверяем, есть ли объект по этим координатам
            // и если есть, то не наша ли это кнопка
            guard  let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else { return }
            // если это наша кнопка, заливаем ее зеленым цветом
            touchedNode.fillColor = .gray
        }
    }
    
    // вызывается при обрыве нажатия на экран (при приеме звонка, например)
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
    }
    
    // вызывается при обработке кадров сцены
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    // добавление змейки
    fileprivate func addSnake() {
        guard let view = self.view, let scene = view.scene else { return }
        //создаем змею по центру экрана и добавляем ее на сцену
        let snake = Snake(atPoint: CGPoint(x: scene.frame.midX, y: scene.frame.midY))
        self.snake = snake
        self.addChild(snake)
    }
    
    // создание яблока в случайной точке сцены
    fileprivate func createApple() {
        let apple = self.difficultyFacade.createApples(in: self).first!
        self.apple = apple
        // добавляем яблоко на сцену
        self.addChild(apple)
    }
    
    // рестарт игры
    fileprivate func restartGame() {
        self.snake?.body.forEach { $0.removeFromParent() }
        self.snake?.removeFromParent()
        self.snake = nil
        self.apple?.removeFromParent()
        self.apple = nil
        self.addSnake()
    }
}

// Имплементируем протокол
extension GameScene: SKPhysicsContactDelegate {
    // Добавляем метод отслеживания начала столкновения
    func didBegin(_ contact: SKPhysicsContact) {
        // логическая сумма масок соприкоснувшихся объектов
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        // вычитаем из суммы голову змеи, и у нас остается маска второго объекта
        let collisionObject = bodies ^ CollisionCategories.SnakeHead
        // проверяем, что это за второй объект
        switch collisionObject {
        case CollisionCategories.Apple:
            // проверяем, что это яблоко
            // яблоко - это один из двух объектов, которые соприкоснулись.
            // Используем тернарный оператор, чтобы вычислить, какой именно
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            // добавляем к змее еще одну секцию
            snake?.addBodyPart()
            // удаляем съеденное яблоко со сцены
            apple?.removeFromParent()
            // создаем новое яблоко
            createApple()
        case CollisionCategories.EdgeBody:
            self.headDidCollideWall(contact)
        default:
            break
        }
    }
    
    private func headDidCollideApple(apple: SKNode?) {
        guard let snake = snake else { return }
        //добавляем к змее еще одну секцию
        snake.addBodyPart()
        //удаляем яблоко
        apple?.removeFromParent()
        self.apple = nil
        // создаем новое яблоко
        createApple()
        
        self.difficultyFacade.snake = snake
        self.difficultyFacade.increaseSnakeSpeed()
    }
    
    private func headDidCollideWall(_ contact: SKPhysicsContact) {
        guard let snake = self.snake else { return }
        let score = snake.body.count - 1
        let record = Record(date: Date(), score: score)
        Game.shared.addRecord(record)
        self.onGameEnd?(score)
    }
}
