//: [Previous](@previous)

var yourCard = ImmutableCard(.three,
                           of: .clubs)

func changeRank(of card: ImmutableCard,
                to rank: Rank) {
    card.rank = rank
}

changeRank(of: yourCard,
           to: .queen)

yourCard

//: [Next](@next)
