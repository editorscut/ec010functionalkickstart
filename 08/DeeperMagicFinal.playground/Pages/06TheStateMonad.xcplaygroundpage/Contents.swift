//: [Previous](@previous)

struct State<S, A> {
  let run: (S) -> (A, S)
  
  func callAsFunction(_ s: S) -> (A, S) {
    run(s)
  }
}

extension State {
  static func just(_ a: A) -> Self {
    Self{s in (a,s)}
  }
  
  init(just a: A) {
    run = {s in (a, s)}
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

extension State {
  func flatMap<B>(_ transform: @escaping (A) -> State<S, B>) -> State<S, B> {
    State<S, B> {s in
      let (nextA, nextS) = self.run(s)
      return transform(nextA).run(nextS)
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



let diamondAceDealer = State<Deck, Card>.just(Card(.ace, of: .diamonds))
let clubAceDealer = State<Deck, Card>(just: Card(.ace, of: .clubs))

diamondAceDealer.run(deck)
diamondAceDealer.run(freshDeck)

clubAceDealer.run(deck)
clubAceDealer.run(freshDeck)

//extension State where S == Deck, A == Card {
//  func deal(_ count: Int,
//            hand: [Card] = []) -> State<Deck, [Card]> {
//    guard count > 0 else {
//      return State<Deck, [Card]>(just: hand)
//    }
//    return self.flatMap{card in
//      self.deal(count - 1, hand: hand + [card])
//    }
//  }
//}

extension State where S == Deck, A == Card {
  func deal(_ count: Int,
            hand: [Card] = []) -> State<Deck, [Card]> {
    flatMap {card in
      guard count > 0 else {return State<Deck, [Card]>(just: hand)}
      return self.deal(count - 1, hand: hand + [card])
    }
  }
}

let fiveCardDealer = dealer.deal(5)
fiveCardDealer.run(deck)

let (nextFiveCards, remainingDeck)
    = fiveCardDealer.run(deck)
    
nextFiveCards

let (secondHand, _) = fiveCardDealer.run(remainingDeck)
secondHand

extension State {
  func next(_ count: Int,
            accumulator: [A] = [A]()) -> State<S, [A]> {
    flatMap{a in
      guard count > 0 else {return State<S, [A]>(just: accumulator)}
      return self.next(count - 1, accumulator: accumulator + [a])
    }
  }
}

let (firstFive, _) = dealer.next(5).run(deck)
firstFive


let tenTosses
  = dealer
  .map{card in card.color == .red}
  .map{bool in bool ? "H" : "T"}
  .next(10)

let (nextTenTosses, _) = tenTosses.run(deck)
nextTenTosses

extension State  {
  func next(where condition: @escaping (A) -> Bool) -> Self {
    flatMap{a in
      if condition(a) {
        return State<S, A>(just: a)
      } else {
        print(a)
        return self.next(where: condition)
      }
    }
  }
}

let aceFinder = dealer.next(where: {$0.rank == .ace})
let (firstAce, remainder) = aceFinder.run(deck)
firstAce

//: [Next](@next)
