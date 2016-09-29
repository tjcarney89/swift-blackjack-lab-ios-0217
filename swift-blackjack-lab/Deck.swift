//  Deck.swift

import Foundation

class Deck {
    fileprivate var remainingCards : [Card]
    fileprivate var dealtCards : [Card]
    
    var description: String { return self.getDescription() }
    
    init() {
        var cards : [Card] = []
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        remainingCards = cards
        dealtCards = []
    }
    
    fileprivate func getDescription() -> String {
        var description = "Deck"
        description += "\n  Cards Remaining: "
        description += descriptionFor(cardArray: remainingCards)
        description += "\n  Cards Dealt: "
        description += descriptionFor(cardArray: dealtCards)
        
        return description
    }

    
    func drawCard() -> Card {
        let card = remainingCards.removeLast()
        self.dealtCards.append(card)
        return card
    }
    
    
    func shuffle() {
        self.remainingCards.append(contentsOf: dealtCards)
        self.dealtCards.removeAll()
        self.randomize()
    }
    
    fileprivate func randomize() {
        var shuffledCards : [Card] = []
        
        let limit = remainingCards.count
        
        for _ in 0..<limit {
            let randomIndex = Int(arc4random_uniform(UInt32(remainingCards.count)))
            
            let randomCard = remainingCards.remove(at: randomIndex)
            shuffledCards.append(randomCard)
        }
        
        remainingCards = shuffledCards
    }
}

