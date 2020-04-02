//: [Previous](@previous)

freshDeck

freshDeck[22]

var numbers = ["zero", "one", "two", "three"]

let removed = numbers.remove(at: 1)

numbers

let result
    = freshDeck
        .selectCard(at: 200)

result.0

result.1

let (yourCard, remainingCards)
      = freshDeck
        .selectCard(at: 2)

yourCard

remainingCards

let preparedDeck
    = remainingCards
        .topped(with: yourCard)

//: [Next](@next)
