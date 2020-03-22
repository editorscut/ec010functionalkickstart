//: [Previous](@previous)

//: End Setup

typealias Deck = [Card]

let freshDeck: Deck = {
    let suits = Suit.allCases
    let ranks = Rank.allCases
    
    var freshDeck = Deck()
    for suit in suits {
        for rank in ranks {
            freshDeck.append(Card(rank,
                                  of: suit))
        }
    }
    return freshDeck
}()

//func selectedCard(at index: Int,
//                from deck: Deck) -> (Card, Deck) {
//    guard deck.indices.contains(index) else {
//        fatalError("The deck has fewer than \(index + 1) cards")
//    }
//    var deck = deck
//    let card = deck.remove(at: index)
//    return (card, deck)
//}
//
//func placed(_ card: Card,
//            onTopOf deck: Deck) -> Deck {
//    [card] + deck
//}
//
//let (yourCard, shortDeck) = selectedCard(at: 24, from: freshDeck)
//yourCard
//
//let preparedDeck = placed(yourCard, onTopOf: shortDeck)
extension Deck {
    func selectCard(at index: Int) -> (Card, Deck) {
        guard indices.contains(index) else {
            fatalError("The deck has fewer than \(index + 1) cards")
        }
        var deck = self
        let card = deck.remove(at: index)
        return (card, deck)
    }
}

extension Card {
    func placed(onTopOf deck: Deck) -> Deck {
        [self] + deck
    }
}

let (yourCard, shortDeck) = freshDeck.selectCard(at: 24)
yourCard

let preparedDeck = yourCard.placed(onTopOf: shortDeck)

extension Deck {
    var topCard: Card {
        guard let firstCard = self.first else {
            fatalError("There are no cards in the deck.")
        }
        return firstCard
    }
}

let topCard = preparedDeck.topCard
topCard



//: [Next](@next)
