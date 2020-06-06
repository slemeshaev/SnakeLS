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
