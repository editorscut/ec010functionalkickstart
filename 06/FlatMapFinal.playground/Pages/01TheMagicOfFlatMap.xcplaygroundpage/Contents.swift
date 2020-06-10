//: [Previous](@previous)


func cardInFreshDeck(at index: Int) -> Card {
    let number = (index * index.signum()) % freshDeck.count
    return freshDeck[number]
}

func incrementRank(of card: Card) -> Card {
    Card(card.rank + 1, of: card.suit)
}

cardInFreshDeck(at: 5)
cardInFreshDeck(at: -1)
cardInFreshDeck(at: 100)

incrementRank(of: cardInFreshDeck(at: 5))

5 |> cardInFreshDeck

5 |> cardInFreshDeck |> incrementRank


let ints = [1, -49, 38, 125, 24]

ints.map(cardInFreshDeck)

ints.map(cardInFreshDeck).map(incrementRank)

ints <^> cardInFreshDeck

ints <^> cardInFreshDeck <^> incrementRank

func maybeCardInFreshDeck(at index: Int) -> Card? {
    guard freshDeck.indices.contains(index) else {return nil}
    return freshDeck[index]
}

func maybeIncrementRank(of card: Card) -> Card? {
    guard card.rank < .king else {return nil}
    return Card(card.rank + 1, of: card.suit)
}

ints
    .map(maybeCardInFreshDeck)
//ints.map(maybeCardInFreshDeck).map(incrementRank)

ints
    .map(maybeCardInFreshDeck)
    .map{card in card.map(incrementRank)}

ints.compactMap(maybeCardInFreshDeck)
ints
    .compactMap(maybeCardInFreshDeck)
    .compactMap(maybeIncrementRank)

let hand = ints.map(cardInFreshDeck)

func threeInARow(from card: Card) -> Hand {
    [card,
     incrementRank(of: card),
     incrementRank(of: incrementRank(of: card))]
}

threeInARow(from: Card(.two,
                       of: .spades))

hand.map(threeInARow)

hand.map(threeInARow)
    .flatMap{$0}

hand.flatMap(threeInARow)

hand >=> threeInARow

ints.map(cardInFreshDeck)
    .flatMap(threeInARow)

ints
    <^> cardInFreshDeck
    >=> threeInARow

import PlaygroundSupport

PlaygroundPage.current
    .setLiveView(FlexibleHandView(of: hand.flatMap(threeInARow)))

//: [Next](@next)
