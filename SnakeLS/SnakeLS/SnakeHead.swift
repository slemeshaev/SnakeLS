//
//  SnakeHead.swift
//  SnakeLS
//
//  Created by Станислав Лемешаев on 05.02.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
