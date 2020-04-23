//: [Previous](@previous)
var result = freshDeck

typealias Trick = (Deck) -> Deck

struct TrickDeck {
    let trick: Trick
}

extension TrickDeck {
    func performTrick(with deck: Deck) -> Deck {
        trick(deck)
    }
}

func bringFourOfSpadesToTheTop(_ deck: Deck) -> Deck {
    var deck = deck
    if let index = deck.firstIndex(of: Card(.four,
                                            of: .spades))  {
        deck.remove(at: index)
    }
    return deck.topped(with: Card(.four,
                                  of: .spades))
}

func alternatingQueenOfHearts(_ deck: Deck) -> Deck {
    var newDeck = Deck()
    for (index, card) in deck.enumerated() {
        newDeck
            .append(index.isMultiple(of: 2)
                ? Card(.queen, of: .hearts)
                : card)
    }
    return newDeck
}


bringFourOfSpadesToTheTop(freshDeck)

alternatingQueenOfHearts(freshDeck)

alternatingQueenOfHearts(bringFourOfSpadesToTheTop(freshDeck))

bringFourOfSpadesToTheTop(alternatingQueenOfHearts(freshDeck))

let fourOnTop = bringFourOfSpadesToTheTop(freshDeck)

alternatingQueenOfHearts(fourOnTop)

let risingFour = TrickDeck(trick: bringFourOfSpadesToTheTop)
let manyQueens = TrickDeck(trick: alternatingQueenOfHearts)
let rotatingSuits = TrickDeck(trick: rotateSuits)

risingFour.performTrick(with: freshDeck)

manyQueens.performTrick(with: freshDeck)

rotatingSuits.performTrick(with: freshDeck)

manyQueens
    .performTrick(with: risingFour
        .performTrick(with: freshDeck)
)

let fourUp = risingFour.performTrick(with: freshDeck)
manyQueens.performTrick(with: fourUp)

result = rotatingSuits.performTrick(with: freshDeck)

extension Deck {
    func performTrick(in trickDeck: TrickDeck) -> Deck {
        trickDeck.trick(self)
    }
}

freshDeck.performTrick(in: risingFour)

freshDeck.performTrick(in: manyQueens)

freshDeck.performTrick(in: rotatingSuits)

result
    = freshDeck
        .performTrick(in: rotatingSuits)

freshDeck
    .performTrick(in: risingFour)
    .performTrick(in: manyQueens)
    .performTrick(in: rotatingSuits)

result
    = freshDeck
        .performTrick(in: risingFour)
        .performTrick(in: manyQueens)
        .performTrick(in: rotatingSuits)

import PlaygroundSupport
PlaygroundPage.current.setLiveView(DeckView(of: result))
//: [Next](@next)
