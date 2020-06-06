//
//  CreateApplesStrategy.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 03.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol CreateApplesStrategy {
    func createApples(in rect: CGRect) -> [Apple]
}

// яблоки создаются в разных точках рандомно, по одному за раз
final class RandomCreateOneAppleStrategy: CreateApplesStrategy {
    
    func createApples(in rect: CGRect) -> [Apple] {
        let randX = CGFloat(arc4random_uniform(UInt32(rect.maxX - 5)) + 1)
        let randY = CGFloat(arc4random_uniform(UInt32(rect.maxY - 5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        return [apple]
    }
    
}

// заранее создадим места появления яблок массивом точек
final class SequentialCreateOneAppleStrategy: CreateApplesStrategy {
    
    private let positions = [CGPoint(x: 210, y: 210),
                             CGPoint(x: 250, y: 250),
                             CGPoint(x: 150, y: 250),
                             CGPoint(x: 250, y: 300),
                             CGPoint(x: 210, y: 210),
                             CGPoint(x: 200, y: 210),
                             CGPoint(x: 100, y: 200),
                             CGPoint(x: 150, y: 300),
                             CGPoint(x: 150, y: 250)]
    
    private var lastUsedPostionIndex = -1
    
    func createApples(in rect: CGRect) -> [Apple] {
        self.lastUsedPostionIndex += 1
        if self.lastUsedPostionIndex >= self.positions.count {
            self.lastUsedPostionIndex = 0
        }
        let position = self.positions[self.lastUsedPostionIndex]
        let apple = Apple(position: position)
        return [apple]
    }
}
