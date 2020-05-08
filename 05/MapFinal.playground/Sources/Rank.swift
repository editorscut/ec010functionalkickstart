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

// not needed with Swift 5.3

extension Rank: Equatable, Comparable {
    public static func <(lhs: Rank, rhs: Rank) -> Bool {
        Rank.allCases.firstIndex(of: lhs)! < Rank.allCases.firstIndex(of: rhs)!
    }
}

extension Rank {
    public static func + (rank: Rank, int: Int ) -> Rank {
        guard let index = ranks.firstIndex(of: rank) else {
            fatalError("Rank was not a valid rank - should never fail")
        }
        return ranks[(index + int) % numberOfRanks]
    }
}
