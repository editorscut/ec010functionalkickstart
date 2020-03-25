public class MagicDeck {
    public private(set) var cards: [MagicCard] = {
            let suits = Suit.allCases
            let ranks = Rank.allCases
            
            var freshDeck = [MagicCard]()
            for suit in suits {
                for rank in ranks {
                    freshDeck.append(MagicCard(rank,
                                          of: suit))
                }
            }
            return freshDeck
        }()
    
    public init(){}
}

extension MagicDeck {
    public func selectCard(at index: Int) -> MagicCard {
        cards.remove(at: index)
    }
    
    public func top(with card: MagicCard) {
        cards = [card] + cards
    }
    
    public var topCard: MagicCard {
        guard let firstCard = cards.first else {
            fatalError("There are no cards in the deck.")
        }
        return firstCard
    }
    
    public var tapThreeTimes: MagicDeck {
        self
    }
}

extension MagicDeck: CustomStringConvertible {
    public var description: String {
        cards.description
    }
}

