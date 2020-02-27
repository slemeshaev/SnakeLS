//
//  Game.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 27.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

final class Game {
    
    static let shared = Game()
    
    private(set) var records: [Record] = []
    
    private init() {}
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
}
