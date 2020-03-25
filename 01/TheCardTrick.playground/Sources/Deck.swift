public typealias Deck = [Card]

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

extension Deck {
    public func selectedCard(at index: Int) -> (Card, Deck) {
        guard indices.contains(index) else {
            if index < 0 {
                fatalError("You can't have \(index) cards in a deck")
            } else {
                fatalError("The deck has fewer than \(index + 1) cards")
            }
        }
        var deck = self
        let card = deck.remove(at: index)
        return (card, deck)
    }

    public func topped(with card: Card) -> Deck {
        [card] + self
    }

    public var topCard: Card {
        guard let firstCard = self.first else {
            fatalError("There are no cards in the deck.")
        }
        return firstCard
    }
}

extension Array: CustomPlaygroundDisplayConvertible where Element == Card {
     public var playgroundDescription: Any {
        self.description
    }
}
//
//public struct Deck {
//    public let cards: [Card]
//
//    public init() {
//        self.cards = freshDeck
//    }
//
//    private init(_ cards: [Card]) {
//        self.cards = cards
//    }
//}
//
//let freshDeck: [Card] = {
//    let suits = Suit.allCases
//    let ranks = Rank.allCases
//
//    var freshDeck = [Card]()
//    for suit in suits {
//        for rank in ranks {
//            freshDeck.append(Card(rank,
//                                  of: suit))
//        }
//    }
//    return freshDeck
//}()
//
//extension Deck {
//    public func selectedCard(at index: Int) -> (Card, Deck) {
//        guard cards.indices.contains(index) else {
//            if index < 0 {
//                fatalError("You can't have \(index) cards in a deck")
//            } else {
//                fatalError("The deck has fewer than \(index + 1) cards")
//            }
//        }
//        var cards = self.cards
//        let card = cards.remove(at: index)
//        return (card, Deck(cards))
//    }
//
//    public func topped(with card: Card) -> Deck {
//        Deck([card] + self.cards)
//    }
//
//    public var topCard: Card {
//        guard let firstCard = cards.first else {
//            fatalError("There are no cards in the deck.")
//        }
//        return firstCard
//    }
//}
//
//extension Deck: CustomStringConvertible {
//    public var description: String {
//        cards.description
//    }
//}
