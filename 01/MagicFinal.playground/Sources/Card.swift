public struct Card: Equatable {
    public let rank: Rank
    public let suit: Suit
    
    public init(_ rank: Rank,
                of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension Card {
    public func changed(to rank: Rank,
                        of suit: Suit) -> Card {
        Card(rank, of: suit)
    }
    
    public func changed(to card: Card) -> Card {
        card
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}

extension Card: CustomPlaygroundDisplayConvertible {
     public var playgroundDescription: Any {
        self.description
    }
}
