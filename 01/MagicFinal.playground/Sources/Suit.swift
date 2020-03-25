public let suits = Suit.allCases
public let numberOfSuits = suits.count

public enum Suit: String, CaseIterable {
    case spades = "♠︎"
    case diamonds = "♦︎"
    case clubs =  "♣︎"
    case hearts = "♥︎"
}

extension Suit: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}
