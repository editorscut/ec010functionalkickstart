extension Suit {
    fileprivate var suitNumber: Int {
        suits.firstIndex(of: self)!
    }
    fileprivate static func makeFrom(int: Int) -> Suit {
        suits[int % numberOfSuits]
    }
}

public func rotateSuits(_ deck: Deck) -> Deck {
    var deck = deck
    for (index, card) in deck.enumerated() {
        let newSuit = Suit.makeFrom(int: index + 2)
        deck[index] = Card(card.rank, of: newSuit)
    }
    return deck
}
