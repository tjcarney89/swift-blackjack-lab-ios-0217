//
//  House.swift
//  swift-blackjack-lab
//
//  Created by TJ Carney on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    var mustHit: Bool {
        var container = false
        if handscore < 17 {
            container = true
        }
    return container 
    }
    
    override init(name: String) {
        super.init(name: name)
        tokens = 1000
        
    }
    
}
