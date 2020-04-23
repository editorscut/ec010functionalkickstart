//: [Previous](@previous)

func yFor(slope m: Int,
          intercept b: Int,
          x: Int) -> Int {
    let y = m * x + b
    return y
}

func numberOfCharacters(_ string: String) -> Int {
    string.count
}

yFor(slope: 3,
     intercept: 2,
     x: 4)

numberOfCharacters("Hello")

func changeAlternateCards(to newCard: Card)
                                      -> (Deck) -> Deck {
    func alternateCards(in deck: Deck) -> Deck  {
        var newDeck = Deck()
        for (index, card) in deck.enumerated() {
            newDeck
                .append(index.isMultiple(of: 2) ?
                    newCard : card)
        }
        return newDeck
    }
    return alternateCards
}

//: [Next](@next)
