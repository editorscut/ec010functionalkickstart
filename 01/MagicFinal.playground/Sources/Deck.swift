public typealias Deck = [Card]

extension Deck {
    public func selectCard(at index: Int) -> (Card, Deck) {
        guard index < count else {
            fatalError("The deck has fewer than \(index + 1) cards.")
        }
        var deck = self
        let card = deck.remove(at: index)
        return (card, deck)
    }
}

extension Deck {
    public func topped(with card: Card) -> Deck {
        [card] + self
    }
}

extension Deck {
    public var topCard: Card {
        self[0]
    }
    
    public var selectTopCard: (Card, Deck) {
        selectCard(at: 0)
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

extension Array: CustomPlaygroundDisplayConvertible
                                    where Element == Card {
     public var playgroundDescription: Any {
        self.description
    }
}

