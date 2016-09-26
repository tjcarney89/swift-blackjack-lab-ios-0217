//  Player.swift

import Foundation

class Player {
    let name : String
    var cards : [Card] = []
    var stayed: Bool = false
    var tokens: UInt = 100
    
    var handscore: UInt { return self.getHandscore() }
    var blackjack: Bool { return handscore == 21 && cards.count == 2 }
    var busted: Bool { return handscore > 21 }
    var mayHit: Bool { return !blackjack && !busted && !stayed }

    var description: String { return self.getDebugDescription() }
    
    init(name: String) {
        self.name = name
    }
    
    fileprivate func getDebugDescription() -> String{
        var debug = "Player: \(name)"
        debug += "\n  cardsInHand: "
        debug += descriptionFor(cardArray: cards)
        debug += "\n  handscore: \(handscore)"
        debug += "\n    blackjack: \(blackjack)"
        debug += "\n    busted   : \(busted)"
        debug += "\n    stayed   : \(stayed)"
        debug += "\n    tokens: \(tokens)"
        return debug
    }
    
    fileprivate func getHandscore() -> UInt {
        var score: UInt = 0
        
        for card in cards {
            score += card.cardValue
        }
        if self.hasAce() && score <= 11 {
            score += 10
        }
        return score
    }
    
    fileprivate func hasAce() -> Bool {
        for card in cards {
            if card.rank == "A" {
                return true
            }
        }
        return false
    }
    
    func canPlace(bet bet: UInt) -> Bool {
        return tokens >= bet
    }
    
    func didWin(bet bet: UInt) {
        tokens += bet
    }
    
    func didLose(bet bet: UInt) {
        tokens -= bet
    }
    
    /* advanced
    func didPush() {
        // no action
    }
    */
}

