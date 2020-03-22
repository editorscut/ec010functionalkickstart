//: [Previous](@previous)

let yourCard = Card(.ace,
                    of: .hearts)


let myCard = Card(.three,
                  of: .clubs)

//func changed(_ : Card,
//             to rank: Rank,
//             of suit: Suit) -> Card {
//    Card(rank, of: suit)
//}
//
//let queenOfClubs = changed(myCard,
//                           to: .queen,
//                           of: myCard.suit)
//
//
//let this = changed(myCard,
//                   to: yourCard.rank,
//                   of: yourCard.suit)

func changed(_ : Card,
             to newCard: Card) -> Card {
    newCard
}

let this = changed(myCard,
                   to: yourCard)

this == yourCard

let that = changed(myCard,
                   to: myCard)

that == myCard

//: [Next](@next)
