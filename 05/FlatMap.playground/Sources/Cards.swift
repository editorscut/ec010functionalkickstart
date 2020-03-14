import Foundation
import SwiftUI

public struct Card: Equatable {
    let rank: Rank
    let suit: Suit
    
    public enum Rank: String, CaseIterable {
        case ace = "A", two = "2", three = "3"
        case four = "4", five = "5", six = "6"
        case seven = "7", eight = "8", nine = "9"
        case ten = "10", jack = "J", queen = "Q", king = "K"
    }
    
    public enum Suit: String, CaseIterable {
        case spades = "♠︎", diamonds = "♦︎"
        case clubs =  "♣︎", hearts = "♥︎"
    }
    public var color: Color {
        switch suit {
        case .diamonds, .hearts:
            return .red
        case .clubs, .spades:
            return .black
        }
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        "\(rank.rawValue) \(suit.rawValue)"
    }
}

extension Card: Identifiable {
    public var id: String {
        description
    }
}

public let freshDeck: [Card] = {
    let suits = Card.Suit.allCases
    let ranks = Card.Rank.allCases
    
    var freshDeck = [Card]()
    for suit in suits {
        for rank in ranks {
            freshDeck.append(Card(rank: rank,
                              suit: suit))
        }
    }
    return freshDeck
}()
