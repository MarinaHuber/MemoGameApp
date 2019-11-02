//
//  Card.swift
//  MartianDemoApp
//
//  Created by Marina Huber on 11/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct Card: Hashable {

    var hashValue: Int { return identifier }
    var isFaceUp = false
    var isMatched = false
    var flipCount = 0
    private var identifier: Int
    private static var identifierFactory = 0

	// all objects that conform to Equatable
	// will now have default equality based on the
	// struct properties

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        identifier = Card.getUniqueIdentifier()
    }

}

