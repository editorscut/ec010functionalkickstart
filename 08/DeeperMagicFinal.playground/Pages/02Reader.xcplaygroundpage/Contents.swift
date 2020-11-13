//: [Previous](@previous)

struct Reader<E, A> {
  let f: (E) -> A
}

extension Reader {
  func map<B>(_ transform: @escaping (A) -> B) -> Reader<E, B> {
    Reader<E, B>{e in transform(self.f(e))}
  }
}

typealias StringFunction<A> = Reader<String, A>

let exclaim = StringFunction{string in string + "!"}
exclaim.f("Hello")

let count = StringFunction{string in string.count}
count.f("Hello")

let bonusSizeOf
  = exclaim.map{string in string.count}

bonusSizeOf.f("Hello")

let card17
  = Reader<Deck, Card>{deck in deck[17 % deck.count]}

card17.f(freshDeck)

let faceCards
  = freshDeck
  .filter{card in [Rank.jack, .queen, .king].contains(card.rank)}

card17.f(faceCards)

let rank17AsString
  = card17
  .map{card in card.rank}
  .map{rank in rank.description}

rank17AsString.f(freshDeck)
rank17AsString.f(faceCards)

let rank17AsStringWithKeypath
  = card17
  .map(\.rank)
  .map(\.description)

rank17AsStringWithKeypath.f(freshDeck)
rank17AsStringWithKeypath.f(faceCards)

//: [Next](@next)
