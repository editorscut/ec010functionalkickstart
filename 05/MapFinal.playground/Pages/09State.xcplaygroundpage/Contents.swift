//: [Previous](@previous)

let deck
    = freshDeck
        .shuffle(cutDepth: 26)
        .shuffle(cutDepth: 23)
        .shuffle(cutDepth: 24)
        .shuffle(cutDepth: 23)
        .cut(17)

struct State<S, A> {
    let run: (S) -> (A, S)
    
    func callAsFunction(_ s: S) -> (A, S) {
        run(s)
    }
}

extension State {
    func map<Output>(_ transform: @escaping (A) -> Output)
                                            -> State<S, Output> {
        State<S, Output> {state in
            let (nextA, nextS) = self.run(state)
            return (transform(nextA), nextS)
        }
    }
}

func deal(from deck: Deck) -> (Card, Deck) {
    (deck[0], Deck(deck[1...]))
}

let result = deal(from: deck)
result.0
result.1

//let dealer
//    = State{deck in
//        (deck[0], Deck(deck[1...]))
//      }

let dealer = State(run: deal)

let (topCard1, deck1) = dealer.run(deck)
topCard1
deck1

let (topCard2, deck2) = dealer.run(deck1)
topCard2
deck2

dealer(deck)

let dealFrom = State(run: deal)

let (card1, deckAfter1) = dealFrom(deck)
card1
deckAfter1

let (card2, deckAfter2) = dealFrom(deckAfter1)
card2
deckAfter2

enum Coin: String {
    case heads
    case tails
}

func toCoin(_ card: Card) -> Coin {
    card.color == .red ? .heads : .tails
}

let coinFlipper = dealFrom.map(toCoin)

let (flip1, stillADeck1)
    = coinFlipper(deck)
flip1
stillADeck1

let (flip2, stillADeck2)
    = coinFlipper(stillADeck1)
flip2

let (flip3, stillADeck3)
    = coinFlipper(stillADeck2)
flip3

func toInt(_ card: Card) -> Int {
    (ranks.firstIndex(of: card.rank) ?? 0) % 10
}

let notSoRandomNumberGenerator
    = dealFrom.map(toInt)

let (number1, d1) = notSoRandomNumberGenerator(deck)
number1
d1

let (number2, d2) = notSoRandomNumberGenerator(d1)
number2
d2

let (number3, d3) = notSoRandomNumberGenerator(d2)
number3
d3
deck
//: [Next](@next)
