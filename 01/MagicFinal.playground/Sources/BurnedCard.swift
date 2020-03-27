public struct BurnedCard: CardCarrying {
    public let card: Card
}

extension BurnedCard: CustomStringConvertible {
    public var description: String {
        "Burned \(card.rank) \(card.suit)"
    }
}

public func burned(_ card: Card) -> BurnedCard {
    BurnedCard(card: card)
}

public func burned(_ rippedCard: RippedCard) -> BurnedCard {
    burned(rippedCard.card)
}
