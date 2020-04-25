//: [Previous](@previous)

var result = freshDeck

typealias Trick = (Deck) -> Deck

precedencegroup Evaluate {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator |>: Evaluate


public func |> <Input, Output>(x: Input,
                        f: (Input) -> Output) -> Output {
    f(x)
}

extension Deck {
    func perform(_ trick: Trick) -> Deck {
        trick(self)
    }
}

func replaceCardEvery(_ frequency: Int)
                        -> (Card) -> (Deck) -> Deck {
    {newCard in
        {deck in
            var newDeck = Deck()
            for (index, card) in deck.enumerated() {
                newDeck
                    .append(index.isMultiple(of: frequency)
                        ? newCard
                        : card)
            }
            return newDeck
        }
    }
}

func alternating(_ newCard: Card) -> (Deck) -> Deck {
    replaceCardEvery(2)(newCard)
}

func alternatingQueens(_ deck: Deck) -> Deck {
    alternating(Card(.queen, of: .hearts))(deck)
}

result = freshDeck.perform(alternatingQueens)




let alternatingFives = alternating(Card(.five,
                                        of: .diamonds))

result = freshDeck.perform(alternatingFives)

result
    = freshDeck
        .perform(alternating(Card(.jack,
                                  of: .spades)))


let allAces
    = replaceCardEvery(1)(Card(.ace,
                               of: .spades))

result = freshDeck.perform(allAces)

result = freshDeck.perform(replaceCardEvery(3)(Card(.ace, of: .hearts)))

//func double(_ int: Int) -> Int {
//    int * 2
//}
//
//let ten = 5 |> double
//
//result = alternatingQueens |> freshDeck.perform
//
//result
//    = Card(.jack,
//           of: .hearts)
//    |> alternating
//    |> freshDeck.perform


import PlaygroundSupport
PlaygroundPage.current.setLiveView(DeckView(of: result))
//: [Next](@next)

