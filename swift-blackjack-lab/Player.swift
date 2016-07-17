//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

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
    
    private func getDebugDescription() -> String{
        var debug = "Player: \(name)"
        debug += "\n  cardsInHand: "
        debug += descriptionForCardArray(cards)
        debug += "\n  handscore: \(handscore)"
        debug += "\n    blackjack: \(blackjack)"
        debug += "\n    busted   : \(busted)"
        debug += "\n    stayed   : \(stayed)"
        debug += "\n    tokens: \(tokens)"
        return debug
    }
    
    private func getHandscore() -> UInt {
        var score: UInt = 0
        
        for card in cards {
            score += card.cardValue
        }
        if self.hasAce() && score <= 11 {
            score += 10
        }
        return score
    }
    
    private func hasAce() -> Bool {
        for card in cards {
            if card.rank == "A" {
                return true
            }
        }
        return false
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return tokens >= bet
    }
    
    func didWin(bet: UInt) {
        tokens += bet
    }
    
    func didLose(bet: UInt) {
        tokens -= bet
}
}
        
//        func checkStay() -> Bool {
//            if handScore < 21 {
//                return true
//            } else {
//                return false
//            }
//        }
//    
//        // determines whether the player may take a new card (if the hand is not busted, is not a blackjack, and if the player has not stayed).
//        func checkIfPlayerMayHit() -> Bool {
//            if !busted && !blackjack && !stayed {
//                return true
//            } else {
//                return false
//            }
//        }
//        
//        //    Write a method called canPlaceBet() which takes an unsigned integer argument and returns a boolean of whether or not the player can afford the submitted bet.
//        
//        func canPlaceBet(bet: Int) -> Bool {
//            if handScore < 17 && token >= bet {
//                return true
//            }else {
//                return false
//            }
//        }
//        
//        func didWin(valueOfBet: Int){
//            token += valueOfBet
//        }
//        
//        
//        func didLose(valueOfBet: Int) {
//            token -= valueOfBet
//        }
//    }
