//: [Previous](@previous)
struct State<S, A> {
  let run: (S) -> (A, S)
  
  func callAsFunction(_ s: S) -> (A, S) {
    run(s)
  }
}

extension State {
  func map<B>(_ transform: @escaping (A) -> B) -> State<S, B> {
    State<S, B> {s in
      let (nextA, nextS) = self.run(s)
      return (transform(nextA), nextS)
    }
  }
}

let deck
  = freshDeck
  .shuffled().shuffled()
  .shuffled().shuffled().shuffled()

func deal(from deck: Deck) -> (Card, Deck) {
  (deck[0], Deck(deck[1...]))
}

let (dealtCard0, remainingDeck0) = deal(from: deck)
dealtCard0
remainingDeck0
remainingDeck0.count

let (dealtCard1, remainingDeck1) = deal(from: remainingDeck0)
dealtCard1
remainingDeck1
remainingDeck1.count

let dealer = State(run: deal)

let (card0, deck0) = dealer.run(deck)
card0
deck0

let (card1, deck1) = dealer.run(deck0)
card1
deck1

let dealFrom = State(run: deal)

let (card2, deck2) = dealFrom(deck1)
card2
deck2


enum Coin: String {
  case heads
  case tails
}

func toCoin(_ card: Card) -> Coin {
  card.color == .red ? .heads : .tails
}

let coinFlipper = dealFrom.map(toCoin)

let (flip0, stillADeck0) = coinFlipper(deck)
    
flip0
stillADeck0

let (flip1, stillADeck1) = coinFlipper(stillADeck0)
flip1
stillADeck1

let (flip2, stillADeck2) = coinFlipper(stillADeck1)
flip2
stillADeck2

//: [Next](@next)
