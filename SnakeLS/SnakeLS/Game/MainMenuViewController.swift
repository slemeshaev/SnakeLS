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
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .medium
        case 2:
            return .hard
        case 3:
            return .insane
        default:
            return .medium
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let gameVC = segue.destination as? GameViewController else { return }
            gameVC.difficulty = self.selectedDifficulty
            gameVC.onGameEnd = { [weak self] result in
                self?.lastResultLabel.text = "Последний результат: \(result)"
            }
        default:
            break
        }
    }
    
    @IBAction func closeButton(_ sender: UIStoryboardSegue) { }
    
}
