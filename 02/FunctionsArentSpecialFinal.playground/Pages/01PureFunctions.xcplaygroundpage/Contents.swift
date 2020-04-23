//: [Previous](@previous)

var result = freshDeck

let queenOfHearts = Card(.queen,
                         of: .hearts)

let fourOfSpades = Card(.four,
                        of: .spades)

freshDeck.contains(Card(.two, of: .spades))

func make(the card: Card,
          riseToTheTopOfThe deck: Deck) -> Deck {
    var deck = deck
    if let index = deck.firstIndex(of: card)  {
        deck.remove(at: index)
    }
    return deck.topped(with: card)
}

let queenFirstDeck = make(the: queenOfHearts,
                          riseToTheTopOfThe: freshDeck)
queenFirstDeck.count

let fourFirstDeck = make(the: fourOfSpades,
                         riseToTheTopOfThe: queenFirstDeck)

result = fourFirstDeck

extension Deck {
    func moveToTheTop(the card: Card) -> Deck {
        var deck = self
        if let index = deck.firstIndex(of: card)  {
            deck.remove(at: index)
        }
        return deck.topped(with: card)
    }
}

result
    = freshDeck
        .moveToTheTop(the: queenOfHearts)
        .moveToTheTop(the: fourOfSpades)

extension Deck {
    func changeEveryOtherCard(to newCard: Card) -> Deck {
        var deck = Deck()
        for (index, card) in self.enumerated() {
            deck.append(index.isMultiple(of: 2) ? newCard : card)
        }
        return deck
    }
}

result = freshDeck.changeEveryOtherCard(to: queenOfHearts)

import PlaygroundSupport
PlaygroundPage.current.setLiveView(DeckView(of: result))

//: [Next](@next)

