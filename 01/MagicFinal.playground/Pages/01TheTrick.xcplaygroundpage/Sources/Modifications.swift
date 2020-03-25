public struct MagicRippedCard {
    public let card: MagicCard
}

extension MagicRippedCard: CustomStringConvertible {
    public var description: String {
        "Ripped \(card.rank) \(card.suit)"
    }
}

public func rip(_ card: MagicCard) -> MagicRippedCard {
    MagicRippedCard(card: card)
}


// ---------

public struct MagicBurnedCard {
    public let card: MagicCard
}

extension MagicBurnedCard: CustomStringConvertible {
    public var description: String {
        "Burned \(card.rank) \(card.suit)"
    }
}

public func burn(_ card: MagicCard) -> MagicBurnedCard {
    MagicBurnedCard(card: card)
}

public func burn(_ rippedCard: MagicRippedCard) -> MagicBurnedCard {
    burn(rippedCard.card)
}

// ----------

public struct MagicCovered<T> {
    public let coveredItem: T
}

extension MagicCovered: CustomStringConvertible {
    public var description: String {
        "Covered \(coveredItem)"
    }
}

extension MagicCovered {
    public var reveal: T {
        coveredItem
    }
}

public func cover<T>(_ item: T) -> MagicCovered<T> {
    MagicCovered(coveredItem: item)
}



