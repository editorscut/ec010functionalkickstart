public struct BurnedCard {
    public let card: Card
}

extension BurnedCard: CustomStringConvertible {
    public var description: String {
        "Burned \(card.rank) \(card.suit)"
    }
}
