//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by TJ Carney on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck = Deck()
    var house = House(name: "House")
    var player = House(name: "Player")
    var bet: UInt = 0
    
    func place(bet: UInt) -> Bool {
        if house.canPlace(bet: bet) && player.canPlace(bet: bet)  {
            self.bet = bet
            return true
        } else {
            return false
        }
    }
    
    func deal() {
        var firstCard = deck.drawCard()
        var secondCard = deck.drawCard()
        var thirdCard = deck.drawCard()
        var fourthCard = deck.drawCard()
        player.stayed = false
        house.stayed = false
        player.cards.removeAll()
        house.cards.removeAll()
        player.cards.append(firstCard)
        player.cards.append(secondCard)
        house.cards.append(thirdCard)
        house.cards.append(fourthCard)
        
    }
    
    func turn(house: House) {
        if house.mustHit == true {
            house.cards.append(deck.drawCard())
        }
        
        if house.stayed == true {
            house.cards.removeAll()
        }
    }
    
    func winner() -> String {
        var winningString: String = ""
        if player.busted == true {
            winningString = "house"
        } else if house.busted == true {
            winningString = "player"
        } else if player.handscore == house.handscore {
            winningString = "house"
        } else if player.cards.count == 5 && player.handscore <= 21 {
            winningString = "player"
        } else if player.blackjack == true && house.blackjack == false {
            winningString = "player"
        } else if house.blackjack == true && player.blackjack == false {
            winningString = "house" 
        } else if player.stayed == true && house.stayed == true && house.handscore > player.handscore {
            winningString = "house"
        } else if player.stayed == true && house.stayed == true && player.handscore > house.handscore {
            winningString = "player"
        } else {
            winningString = "no"
        }
    return winningString
    }
    
    func award() -> String {
        var whoWon: String = ""
        var handWinner = winner()
        if handWinner == "player" {
            whoWon = "Player wins"
            player.tokens += bet
            house.tokens -= bet
        } else if handWinner == "house" {
            whoWon = "House wins"
            house.tokens += bet
            player.tokens -= bet
        } else if handWinner == "no" {
            whoWon = "There is no winner"
        }
        return whoWon
    }
    
}
