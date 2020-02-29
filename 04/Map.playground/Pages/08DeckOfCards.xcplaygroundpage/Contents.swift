//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct Card: Equatable {
    let rank: Rank
    let suit: Suit
    
    enum Rank: String, CaseIterable {
        case ace = "A", two = "2", three = "3"
        case four = "4", five = "5", six = "6"
        case seven = "7", eight = "8", nine = "9"
        case ten = "10", jack = "J", queen = "Q", king = "K"
    }
    
    enum Suit: String, CaseIterable {
        case spades = "♠︎", diamonds = "♦︎"
        case clubs =  "♣︎", hearts = "♥︎"
        
        var color: Color {
            switch self {
            case .diamonds, .hearts:
                return .red
            case .clubs, .spades:
                return .black
            }
        }
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        "\(rank.rawValue) \(suit.rawValue)"
    }
}

extension Card: Identifiable {
    var id: String {
        description
    }
}

let freshDeck: [Card] = {
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

//: End setup


class Deck {
    let cards: [Card]
    
    init(_ cards: [Card] = freshDeck) {
        self.cards = cards
    }
}

extension Deck {
    func map(_ transform: (Card) -> Card) -> Deck {
        Deck(cards.map(transform))
    }
}

func convertToQueenOfDiamonds(_ : Card) -> Card {
    Card(rank: .queen, suit: .diamonds)
}

func changeCard(to card: Card) -> (Card) -> Card {
    {_ in card}
}

let toAceOfClubs
    = changeCard(to: Card(rank: .ace,
                          suit: .clubs))


//var deck = Deck().map(convertToQueenOfDiamonds)

//var deck = Deck().map(toAceOfClubs)

var deck
    = Deck()
        .map(changeCard(to: Card(rank: .ace,
                                 suit: .clubs)))


//: More setup code below

struct TableView: View {
    var body: some View {
        List(deck.cards){card in
            Text(card.description)
                .foregroundColor(card.suit.color)
        }.frame(width: 100,
                height: 800,
                alignment: .center)
    }
}

PlaygroundPage.current.setLiveView(TableView())
