//: [Previous](@previous)

func threeXPlusTwo(x: Int) -> Int {
    3 * x + 2
}

func squared(x: Int) -> Int {
    x * x
}

func reverse(_ deck: Deck) -> Deck {
    return Array(deck.reversed())
}

func alternatingJackOfDiamonds(_ deck: Deck) -> Deck {
    var newDeck = Deck()
    for (index, card) in deck.enumerated() {
        newDeck
            .append(index.isMultiple(of: 2)
                ? Card(.jack, of: .diamonds)
                : card)
    }
    return newDeck
}

func changeAlternateCards(to newCard: Card) -> Deck {
        var newDeck = Deck()
        for (index, card) in freshDeck.enumerated() {
            newDeck
                .append(index.isMultiple(of: 2) ?
                    newCard : card)
        }
        return newDeck
}

func evaluate<Input, Output>(_ x: Input,
                             using f: (Input) -> Output) -> Output {
    f(x)
}

//: [Next](@next)
