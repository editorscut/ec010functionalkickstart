//: [Previous](@previous)

//func evaluate(_ x: Int,
//              using f: (Int) -> Int) -> Int {
//    f(x)
//}

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

func evaluate<Input, Output>(_ x: Input,
                             using f: (Input) -> Output) -> Output {
    f(x)
}

evaluate(4,
         using: {x in 3 * x + 2})

evaluate(4){x in 3 * x + 2}

func cutFreshDeck(to index: Int) -> Deck {
    let topPart = freshDeck[..<index]
    let bottomPart = freshDeck[index...]
    return Array(bottomPart + topPart)
}

cutFreshDeck(to: 9)

evaluate(9,
         using: cutFreshDeck)

evaluate(Card(.queen,
              of: .hearts),
         using: changeAlternateCards)

let alternatingQueens
    = evaluate(Card(.queen,
                    of: .hearts),
               using: changeAlternateCards)

alternatingQueens(freshDeck)

evaluate(Card(.queen,
              of: .hearts),
         using: changeAlternateCards)(freshDeck)


//: [Next](@next)
