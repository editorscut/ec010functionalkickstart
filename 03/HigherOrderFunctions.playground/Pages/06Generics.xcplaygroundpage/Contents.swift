//: [Previous](@previous)

func evaluate(_ x: Int,
              using f: (Int) -> Int) -> Int {
    f(x)
}

func changeAlternateCards(to newCard: Card)
                                      -> (Deck) -> Deck {
    {deck in
        var newDeck = Deck()
        for (index, card) in deck.enumerated() {
            newDeck
                .append(index.isMultiple(of: 2) ?
                    card : newCard)
        }
        return newDeck
    }
}

//: [Next](@next)
