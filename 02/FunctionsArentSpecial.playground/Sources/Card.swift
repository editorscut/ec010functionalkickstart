import SwiftUI

public struct Card: Equatable, Identifiable {
    public let rank: Rank
    public let suit: Suit
    public let id = UUID()
    
    public init(_ rank: Rank,
                of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension Card {
    public var color: Color {
        suit.color
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}

extension Card: CustomPlaygroundDisplayConvertible {
     public var playgroundDescription: Any {
        self.description
    }
}
