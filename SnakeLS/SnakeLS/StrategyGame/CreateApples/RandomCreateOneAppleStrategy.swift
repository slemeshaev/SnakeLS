//
//  RandomCreateOneAppleStrategy.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 06.06.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

// яблоки создаются в разных точках рандомно, по одному за раз
final class RandomCreateOneAppleStrategy: CreateApplesStrategy {
    func createApples(in rect: CGRect) -> [Apple] {
        let randX = CGFloat(arc4random_uniform(UInt32(rect.maxX - 5)) + 1)
        let randY = CGFloat(arc4random_uniform(UInt32(rect.maxY - 5)) + 1)
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        return [apple]
    }
}
