//: [Previous](@previous)

let (yourCard, remainingCards)
    = freshDeck
        .selectCard(at: 24)

yourCard

let theDeck
    = remainingCards
        .topped(with: yourCard)

//let topCard = theDeck[0]

let topCard = theDeck.topCard

topCard
    |> ripped
    |> burned
    |> covered

let this
    = topCard
        |> ripped
        |> burned
        |> covered
        |> revealed

this == yourCard

let that
    = theDeck
        .topCard

that == yourCard

let (removedCard, deck)
    = theDeck
        .selectTopCard

removedCard
deck

let coveredDeck
    = deck
        |> covered


let coveredCard
    = removedCard
        |> ripped
        |> burned
        |> covered


let coveredCombination
    = combine(coveredCard,
              and: coveredDeck)

let revealedDeck
    = revealed(coveredCombination)

let thisCard = revealedDeck.topCard

thisCard == yourCard



//: [Next](@next)
