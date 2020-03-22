public struct CoveredCard {
    public let card: Card
}

extension CoveredCard: CustomStringConvertible {
    public var description: String {
        "Covered \(card.rank) \(card.suit)"
    }
}

public func covered(_ card: Card) -> CoveredCard {
    CoveredCard(card: card)
}

public func covered(_ rippedCard: RippedCard) -> CoveredCard {
    covered(rippedCard.card)
}

public func covered(_ burnedCard: BurnedCard) -> CoveredCard {
    covered(burnedCard.card)
}

public func revealed(_ coveredCard: CoveredCard) -> Card {
    coveredCard.card
}
