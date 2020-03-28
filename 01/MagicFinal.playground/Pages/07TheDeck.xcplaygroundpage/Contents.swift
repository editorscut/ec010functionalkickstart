//: [Previous](@previous)

freshDeck

freshDeck[22]

var numbers = ["zero", "one", "two", "three"]

let removed = numbers.remove(at: 1)

numbers

let (yourCard, remainingCards)
      = freshDeck
        .selectedCard(at: 2)

yourCard

remainingCards

let preparedDeck
    = remainingCards
        .topped(with: yourCard)

//: [Next](@next)
