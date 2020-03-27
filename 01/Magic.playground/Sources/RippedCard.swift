public struct RippedCard {
    public let card: Card
}

extension RippedCard: CustomStringConvertible {
    public var description: String {
        "Ripped \(card.rank) \(card.suit)"
    }
}

