//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/14/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Deck {
    private var remainingCards : [Card]
    private var dealtCards : [Card]
    
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
    
    private func getDescription() -> String {
        var description = "Deck"
        description += "\n  Cards Remaining: "
        description += descriptionForCardArray(remainingCards)
        description += "\n  Cards Dealt: "
        description += descriptionForCardArray(dealtCards)
        
        return description
    }
    
    
    func drawCard() -> Card {
        let card = remainingCards.removeLast()
        self.dealtCards.append(card)
        return card
    }
    
    func shuffle() {
        self.remainingCards.appendContentsOf(dealtCards)
        self.dealtCards.removeAll()
        self.randomize()
    }
    
    private func randomize() {
        var shuffledCards : [Card] = []
        
        let limit = remainingCards.count
        
        for _ in 0...limit-1 {
            let randomIndex = Int(arc4random_uniform(UInt32(remainingCards.count)))
            
            let randomCard = remainingCards.removeAtIndex(randomIndex)
            shuffledCards.append(randomCard)
        }
        
        remainingCards = shuffledCards
    }
}