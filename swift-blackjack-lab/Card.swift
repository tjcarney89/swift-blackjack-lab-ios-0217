//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by TJ Carney on 2/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Card: CustomStringConvertible {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt {
        return determineCardValue(rank)
    }
    var description: String {
        return cardLabel
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = (suit + rank)
    }
    
    class func validSuits() -> [String] {
        return ["♠️", "♥️", "♦️", "♣️"]
    }
    
    class func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    func determineCardValue(_ rank: String) -> UInt {
        var newCardValue = 0
        switch rank {
        case "A":
            newCardValue = 1
        case "2":
            newCardValue = 2
            
        case "3" :
            newCardValue = 3
            
        case "4" :
            newCardValue = 4
            
        case "5" :
            newCardValue = 5
            
        case "6" :
            newCardValue = 6
            
        case "7" :
            newCardValue = 7
            
        case "8":
            newCardValue = 8
            
        case "9":
            newCardValue = 9
            
        case "10":
            newCardValue = 10
            
        case "J":
            newCardValue = 10
            
        case "Q":
            newCardValue = 10
            
        case "K":
            newCardValue = 10
            
        default:
            newCardValue = 0
        }
        return UInt(newCardValue)
    }
}

func descriptionFor(cardArray: [Card]) -> String {
    var spades = [Card]()
    var hearts = [Card]()
    var diamonds = [Card]()
    var clubs = [Card]()
    var spadeString: String = ""
    var heartString: String = ""
    var diamondString: String = ""
    var clubString: String = ""
    var cardOrder: String = ""
    for card in cardArray {
        if card.suit == "♠️" {
            spades.append(card)
        } else if card.suit == "♥️" {
            hearts.append(card)
        } else if card.suit == "♦️" {
            diamonds.append(card)
        } else if card.suit == "♣️" {
            clubs.append(card)
        }
    }
    spades.sort {$0.rank < $1.rank}
    hearts.sort {$0.rank < $1.rank}
    diamonds.sort {$0.rank < $1.rank}
    clubs.sort {$0.rank < $1.rank}
    
    for spade in spades {
        spadeString += spade.cardLabel
    }
    for heart in hearts {
        heartString += heart.cardLabel
    }
    for diamond in diamonds {
        diamondString += diamond.cardLabel
    }
    for club in clubs {
        clubString += club.cardLabel
    }
    
    cardOrder = "\(spadeString)" + "\n\(heartString)" + "\n\(diamondString)" + "\n\(clubString)"
    print(cardOrder)
    return cardOrder
}





