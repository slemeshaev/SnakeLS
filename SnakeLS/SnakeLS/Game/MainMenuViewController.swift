//
//  MainMenuViewController.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 20.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

final class MainMenuViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var lastResultLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
}

extension MainMenuViewController: GameViewControllerDelegate {
    func didEndGame(withResult result: Int) {
        self.lastResultLabel.text = "Последний результат: \(result)"
    }
}
