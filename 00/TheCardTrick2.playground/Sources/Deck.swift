public typealias Deck = [Card]

extension Deck {
    public var topCard: Card {
        get {
            guard let topCard = first else {
                fatalError("Deck is Empty")
            }
            return topCard
        }
        set {
            insert(newValue,
                   at: 0)
        }
    }
    
    public func card(at index: Int) -> Card {
        guard indices.contains(index) else {
            fatalError("There's no card at index \(index)")
        }
        return self[index]
    }
}

public let freshDeck: Deck = {
    let suits = Suit.allCases
    let ranks = Rank.allCases
    
    var freshDeck = Deck()
    for suit in suits {
        for rank in ranks {
            freshDeck.append(Card(rank,
                                  of: suit))
        }
    }
    return freshDeck
}()
