//: [Previous](@previous)
freshDeck

freshDeck[22]

var mutableDeck = freshDeck

let removedCard
    = mutableDeck
        .remove(at: 2)

removedCard
mutableDeck

mutableDeck.insert(removedCard,
                   at: 0)

mutableDeck
freshDeck


func selectedCard(at index: Int,
                from deck: Deck) -> (Card, Deck) {
    guard deck.indices.contains(index) else {
        if index < 0 {
            fatalError("You can't have \(index) cards in a deck")
        } else {
            fatalError("The deck has fewer than \(index + 1) cards")
        }
    }
    var deck = deck
    let card = deck.remove(at: index)
    return (card, deck)
}

//let (yourCard, remainingCards) = selectedCard(at: -2,
//                                              from: freshDeck)
//let (yourCard, remainingCards) = selectedCard(at: 200,
//                                              from: freshDeck)
let (yourCard, remainingCards) = selectedCard(at: 2,
                                              from: freshDeck)
yourCard
remainingCards


func placed(_ card: Card,
            onTopOf deck: Deck) -> Deck {
    [card] + deck
}

let preparedDeck = placed(yourCard,
                          onTopOf: remainingCards)



let (yourCard2, remainingCards2) = freshDeck.selectedCard(at: 2)

let preparedDeck2 = remainingCards2.topped(with: yourCard2)



let topCard = preparedDeck2.topCard
topCard



//: [Next](@next)
