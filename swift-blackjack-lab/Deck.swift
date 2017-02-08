//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by TJ Carney on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import GameKit

class Deck {
    private var remainingCards: [Card]
    private var dealtCards: [Card] = []
    var description: String {
        let remaining = remainingCards.count
        let dealt = dealtCards.count
//        print("The following cards are remaining: \(descriptionFor(cardArray: remainingCards))")
//        print("The following cards have been dealt: \(descriptionFor(cardArray: dealtCards))")
//        return descriptionFor(cardArray: remainingCards) + descriptionFor(cardArray: dealtCards)
        return "Cards Remaining: \(remaining), Cards Dealt: \(dealt)"
    }
    
    init() {
        var card1 = Card(suit: "♠️", rank: "A")
        var fiftyTwoArray: [Card] = []
        for rank in Card.validRanks() {
            for suit in Card.validSuits() {
                card1 = Card(suit: suit, rank: rank)
                fiftyTwoArray.append(card1)
            }
        }
        self.remainingCards = fiftyTwoArray
    }
//    REAL WAY TO DO DRAW FUNCTION SINCE THE DECK COULD BE EMPTY
//    func draw() -> Card? {
//        if remainingCards.count == 0 {
//            return nil
//        } else {
//            var nextCard = remainingCards.removeLast()
//            dealtCards.append(nextCard)
//            return nextCard
//        }
//    }
    
    func drawCard() -> Card {
        let drawnCard = remainingCards.removeLast()
        dealtCards.append(drawnCard)
        print(drawnCard)
        return drawnCard
    }
    
    func shuffle() -> [Card] {
        remainingCards = GKRandomSource().arrayByShufflingObjects(in: remainingCards) as! [Card]
        return remainingCards
    }
}

        



