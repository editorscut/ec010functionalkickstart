//: [Previous](@previous)

func yFor(slope m: Int,
          intercept b: Int,
          x: Int) -> Int {
    let y = m * x + b
    return y
}

yFor(slope: 3,
     intercept: 2,
     x: 4)

yFor(slope: 3,
     intercept: 2,
     x: 5)

func changeEveryOtherCard(to newCard: Card,
                          in deck: Deck) -> Deck {
    var newDeck = Deck()
    for (index, card) in deck.enumerated() {
        newDeck
            .append(index.isMultiple(of: 2) ?
                newCard : card)
    }
    return newDeck
}


//: [Next](@next)
