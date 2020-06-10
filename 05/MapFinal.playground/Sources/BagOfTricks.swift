public let threeOfClubs = Card(.three,
                               of: .clubs)

public let queenOfDiamonds = Card(.queen,
                                  of: .diamonds)

public let aceOfSpades = Card(.ace,
                              of: .spades)


public func increment(_ card: Card) -> Card {
    Card(card.rank + 1,
         of: card.suit + 1)
}

public func cardFromFreshDeck(at index: Int) -> Card {
    freshDeck[index]
}

//public func emphasize(_ string: String) -> String {
//    string.uppercased() + "!"
//}

public func emphasize(_ string: String) -> String {
    if string.isEmpty {return ""} else {
        return string.uppercased() + "!"
    }
}

public func numberOfCharacters(in string: String) -> Int {
    string.count
}

public struct ThatsJustStupid: Error {
    public let yourNumber: Int
}

extension ThatsJustStupid: CustomDebugStringConvertible {
    public var debugDescription: String {
        "You can't choose \(yourNumber). It's not between 0 and 51"
    }
}

public func safeCardFromFreshDeck(at index: Int) throws -> Card {
    guard (0...51).contains(index) else {
        throw ThatsJustStupid(yourNumber: index)
    }
    return freshDeck[index]
}

public func identity<A>(_ x: A) -> A {
    x
}


public func optionalCardFromFreshDeck(at index: Int) -> Card? {
    guard (0...51).contains(index) else {
        return nil
    }
    return freshDeck[index]
}

public func resultCardFromFreshDeck(at index: Int) -> Result<Card, ThatsJustStupid> {
    guard (0...51).contains(index) else {
        return .failure(ThatsJustStupid(yourNumber: index))
    }
    return .success(freshDeck[index])
}
