public struct ImmutableCard {
    public let rank: Rank
    public let suit: Suit
    
    public init(_ rank: Rank,
         of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension ImmutableCard: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}
