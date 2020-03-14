//: [Previous](@previous)

let threeOfClubs = Card(.three,
                        of: .clubs)
//: End setup

func change(_ : Card, into card: Card ) -> Card {
    card
}

let functionTrick = change(threeOfClubs, into: Card(.queen, of: .diamonds))

threeOfClubs

//extension Card {
//    mutating func change(into card: Card) {
//        self.rank = card.rank
//        self.suit = card.suit
//    }
//}

extension Card {
    func change(into card: Card) -> Card {
        card
    }
}

let methodTrick = threeOfClubs.change(into: Card(.queen, of: .diamonds))
threeOfClubs

//: [Next](@next)
