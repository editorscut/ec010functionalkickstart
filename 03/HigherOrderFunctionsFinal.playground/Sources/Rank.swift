public let ranks = Rank.allCases
public let numberOfRanks = ranks.count

public enum Rank: String, CaseIterable {
    case ace = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
}

extension Rank: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}
