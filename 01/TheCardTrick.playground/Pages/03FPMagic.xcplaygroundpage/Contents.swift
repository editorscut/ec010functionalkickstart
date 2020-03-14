//: [Previous](@previous)

let threeOfClubs = Card(.three,
                        of: .clubs)

//: End Setup


func changeSuit(of card: Card,
                to suit: Suit) -> Card {
    Card(card.rank,
         of: suit)
}

changeSuit(of: threeOfClubs,
           to: .diamonds)

threeOfClubs

//let threeOfSpades = changeSuit(of: changeSuit(of: threeOfClubs,
//                                              to: .diamonds),
//                               to: .spades)

let threeOfDiamonds = changeSuit(of: threeOfClubs,
                                 to: .diamonds)

let threeOfSpades = changeSuit(of: threeOfDiamonds,
                               to: .spades)

extension Card {
    func changed(to rank: Rank,
                 of suit: Suit) -> Card {
        Card(rank, of: suit)
    }
}

threeOfSpades.changed(to: .queen,
                      of: .hearts)
threeOfSpades

//: [Next](@next)
