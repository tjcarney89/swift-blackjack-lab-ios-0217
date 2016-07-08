//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /**
     
     * Declare any custom properties here.
     
     */
    
    let dealer = Dealer()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /**
         
         * Call your custom classes here when running the scheme.
         
         */
        
        let deck = Deck.init()
        print(deck.description)
        
        deck.shuffle()
        print(deck.description)
        
        let house = House.init(name: "House")
        
        house.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        print(house.description)
        
        while house.mustHit {
            house.cards.append(deck.drawCard())
            print(house.description)
        }
        
        self.playBlackjack(20)
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /**
     
     * Write your playBlackjack method in here
     
     */
    
    func playBlackjack(bet: UInt) {
        let goodBet = dealer.placeBet(bet)
        if !goodBet {
            return
        }
        print("The bet is \(bet)")
        
        print("Deal!")
        dealer.deal()
        print(dealer.house.description)
        print(dealer.player.description)
        
        for _ in 2...4 {
            dealer.turn(dealer.player)
            if !dealer.player.busted {
                dealer.turn(dealer.house)
            }
        }
        
        print("--End of the hand--")
        let award = dealer.award()
        print(award)
        print(dealer.house.description)
        print(dealer.player.description)
    }
    
    // do not delete
} //////////////

