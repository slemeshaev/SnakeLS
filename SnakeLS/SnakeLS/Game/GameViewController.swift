//
//  GameViewController.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 03.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

protocol GameViewControllerDelegate: class {
    func didEndGame(withResult result: Int)
}

class GameViewController: UIViewController {
    
    weak var delegate: GameViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // создаю экземпляр сцены
        let scene = GameScene(size: view.bounds.size)
        scene.gameDelegate = self
        
        // получаю главную область экрана
        let skView = view as! SKView
        
        // включаю отображение fps (количество кадров в секунду)
        skView.showsFPS = true
        
        // показываю на экране количество объектов
        skView.showsNodeCount = true
        
        // включаю произвольный порядок рендеринга объектов в узле
        skView.ignoresSiblingOrder = true
        
        // растягиваю режим отображение сцены на все доступное пространстов
        scene.scaleMode = .resizeFill
        
        // добавляю сцену на экран
        skView.presentScene(scene)
        
    }
}

extension GameViewController: GameSceneDelegate {
    func didEndGame(withResult result: Int) {
        self.delegate?.didEndGame(withResult: result)
        self.dismiss(animated: true, completion: nil)
    }
}
