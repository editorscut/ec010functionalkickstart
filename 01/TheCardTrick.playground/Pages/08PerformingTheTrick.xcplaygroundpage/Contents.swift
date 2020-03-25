//: [Previous](@previous)

let (yourCard, remainingCards) = Deck().selectedCard(at: 24)

let theDeck = remainingCards.topped(with: yourCard)

let topCard = theDeck.topCard

topCard
    |> ripped
    |> burned
    |> covered

let this = theDeck.topCard

this == yourCard

//: [Next](@next)
