//: [Previous](@previous)
import Foundation
import SwiftUI

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
    }
    var color: Color {
        switch suit {
        case .diamonds, .hearts:
            return .red
        case .clubs, .spades:
            return .black
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

let topCard0 = freshDeck.first!

//: End setup

typealias Deck = [Card]

var deck = freshDeck


func cut(_ depth: Int) -> (Deck) -> (Card, Deck) {
    {deck in
        let cutCards = deck[depth...] + deck[..<depth]
        let reassembledCards = Deck(cutCards)
        guard let first = reassembledCards.first else {fatalError("Empty Deck")}
        return (first, reassembledCards)
    }
}

let cut27 = cut(27)

let (topCard, cutDeck) = cut27(freshDeck)

topCard



struct State<S, A> {
    let run: (S) -> (A, S)
    
    func callAsFunction(_ s: S) -> (A, S) {
        run(s)
    }
}



//let cardCutter: State<Deck, Card> = State{cards in
//    cut(15)(cards)
//}

let cardCutter: State<Deck, Card> = State(run: cut(15))



//let (topCard1, cutDeck1) = cardCutter.run(freshDeck)
let (topCard1, cutDeck1) = cardCutter(freshDeck)
topCard1

Int.random(in: 1...10)


let (topCard2, cutDeck2) = cardCutter.run(cutDeck1)
topCard2


let (topCard3, cutDeck3) = cardCutter.run(cutDeck2)
topCard3

enum Coin: String {
    case heads
    case tails
}


extension State {
    func map<Output>(_ transform: @escaping (A) -> Output) -> State<S, Output> {
        return State<S, Output> {state in
            let (nextA, nextS) = self.run(state)
            return (transform(nextA), nextS)
        }
    }
}

func toCoin(_ card: Card) -> Coin {
    card.color == .red ? .heads : .tails
}


let coinFlipper: State<Deck, Coin>
    = cardCutter.map(toCoin)


let (coinFlip1, deck1) = coinFlipper(freshDeck)
coinFlip1

let (coinFlip2, deck2) = coinFlipper(deck1)
coinFlip2

let (coinFlip3, deck3) = coinFlipper(deck2)
coinFlip3

func toInt(_ card: Card) -> Int {
    guard let number
        = freshDeck.firstIndex(of: card) else {
        fatalError("Card is not in the deck")
    }
    return number % 10
}

let notSoRandomNumberGenerator: State<Deck, Int>
    = cardCutter.map(toInt)

let (number1, d1) = notSoRandomNumberGenerator(freshDeck)
number1

let (number2, d2) = notSoRandomNumberGenerator(d1)
number2

let (number3, d3) = notSoRandomNumberGenerator(d2)
number3
