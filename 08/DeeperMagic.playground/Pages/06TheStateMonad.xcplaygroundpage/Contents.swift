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

let dealer = State(run: deal)

//: [Next](@next)
