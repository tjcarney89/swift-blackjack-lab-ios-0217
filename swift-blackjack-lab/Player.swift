//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by TJ Carney on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = []
    var handscore: UInt {
        var handTotal: UInt = 0
        
        var numberOfAces = 0
        for card in cards {
            if card.rank == "A" {
                numberOfAces += 1
            }
        }
        
        for card in cards {
            if card.rank == "A" && handTotal <= 10 && numberOfAces < 2{
                    handTotal += 11
            } else {
                handTotal += card.cardValue
            }
        }
        return handTotal
    }
    var blackjack: Bool {
        var container = false
        if cards.count == 2 && handscore == 21 {
            return true
        }
        return container
    }
    
            
    var busted: Bool {
        var total: UInt = 0
        for card in cards {
            total += card.cardValue
        }
        if total > 21 {
            return true
        } else {
            return false
        }
    }
    var stayed: Bool = false
    var mayHit: Bool {
        var container = false
        if busted == false && blackjack == false && stayed == false {
            return true
        }
        return container
    }
    var tokens: UInt
    var description: String {
        var sentence: String = ""
            sentence += "Player: \(name)\n"
            sentence += "Cards: \(cards)\n"
            sentence += "Handscore: \(handscore)\n"
            sentence += "BlackJack: \(blackjack)\n"
            sentence += "Busted: \(busted)\n"
            sentence += "Stayed: \(stayed)\n"
            sentence += "Tokens: \(tokens)\n"
        return sentence
    }

                
    init(name: String) {
        self.name = name
        self.tokens = 100
    }
    
    func canPlace(bet: UInt) -> Bool {
        var container = false
        if tokens >= bet {
            return true
        }
        return container
    }
    
    func didWin(bet: UInt) {
        tokens += bet
        
    }
    
    func didLose(bet: UInt) {
        tokens -= bet
    }
    
}
