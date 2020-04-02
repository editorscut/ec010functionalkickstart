//: [Previous](@previous)

let yourCard = Card(.ace,
                    of: .hearts)

let myCard = Card(.three,
                  of: .clubs)

func changed(_: Card,
             to rank: Rank,
             of suit: Suit) -> Card {
    Card(rank, of: suit)
}

changed(myCard,
        to: .seven,
        of: .hearts)

func makeCard(the rank: Rank,
                of suit: Suit) -> Card {
    Card(rank, of: suit)
}

makeCard(the: .seven,
           of: .hearts)

let this = myCard.changed(to: yourCard.rank,
                          of: yourCard.suit)

this == yourCard

let that = myCard.changed(to: yourCard)

that == yourCard

let theFinalCard = that.changed(to: myCard)

theFinalCard == myCard


//: [Next](@next)
