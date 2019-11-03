//
//  Matching.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

// Kudos to this project github:

import Foundation

struct Matching {

    private(set) var cards = [Card]()
    public var matches = 0
	private(set) var gameEnd: Bool = false


    private var indexOfFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Matching.chooseCard(at: \(index)): Chosen index out of range.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {

                cards[index].isFaceUp = true
                cards[index].flipCount += 1
                cards[matchIndex].flipCount += 1
            } else {
                indexOfFaceUpCard = index
            }
        }
        let numberOfFaceUpCards = cards.indices.filter { cards[$0].isFaceUp }.count
        if numberOfFaceUpCards == 1 {
        } else {

			gameEnd = true

        }
    }

    mutating func resetCards() {
        cards.removeAll()

    }

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Matching.init(\(numberOfPairsOfCards)): You must have at least 1 pair of cards")
        var preShuffledCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            preShuffledCards += [card, card]
        }
        for _ in preShuffledCards {
            let randomIndex = preShuffledCards.count.arc4random
            let randomCard = preShuffledCards.remove(at: randomIndex)
            cards.append(randomCard)
//            print(randomCard)
        }
    }
}
