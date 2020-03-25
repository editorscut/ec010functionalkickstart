//: [Previous](@previous)

let theDeck = MagicDeck()

let yourCard = theDeck.selectCard(at: 22)

theDeck.top(with: yourCard)

let topCard = theDeck.topCard

let rippedCard = rip(topCard)

let burnedCard = burn(rippedCard)

let coveredCard = cover(burnedCard)


let this = theDeck.tapThreeTimes.topCard

this == yourCard



//: [Next](@next)
