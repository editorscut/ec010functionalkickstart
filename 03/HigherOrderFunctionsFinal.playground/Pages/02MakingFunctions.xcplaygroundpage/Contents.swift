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


func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    func yValue(x: Int) -> Int {
        let y = m * x + b
        return y
    }
    return yValue
}

let threeXPlusTwo
    = line(slope: 3,
           intercept: 2)

threeXPlusTwo(4)

threeXPlusTwo(5)

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

changeEveryOtherCard(to: Card(.queen,
                              of: .hearts),
                     in: freshDeck)

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

let alternateQueens = changeAlternateCards(to: Card(.queen, of: .hearts))

let alternateJacks = changeAlternateCards(to: Card(.jack, of: .diamonds))

alternateQueens(freshDeck)
alternateJacks(freshDeck)

alternateQueens(freshDeck).reversed().description

alternateJacks(
    alternateQueens(freshDeck)
        .reversed()
)

//: [Next](@next)
