public struct RippedCard: CardCarrying {
    public let card: Card
}

extension RippedCard: CustomStringConvertible {
    public var description: String {
        "Ripped \(card.rank) \(card.suit)"
    }
}

public func ripped(_ card: Card) -> RippedCard {
    RippedCard(card: card)
}
