public struct MagicCard: Equatable {
    public let rank: Rank
    public let suit: Suit
    
    public init(_ rank: Rank,
                of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension MagicCard: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}
