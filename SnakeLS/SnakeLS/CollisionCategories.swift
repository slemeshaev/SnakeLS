//
//  CollisionCategories.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 06.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

// категории пересечения объектов
struct CollisionCategories {
    // Тело змеи
    static let Snake: UInt32 = 0x1 << 0
    // Голова змеи
    static let SnakeHead: UInt32 = 0x1 << 1
    // Яблоко
    static let Apple: UInt32 = 0x1 << 2
    // Край сцены
    static let EdgeBody: UInt32 = 0x1 << 3
}
