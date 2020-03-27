//: [Previous](@previous)

var yourCard = MutableCard(.three,
                           of: .clubs)

let originalValue = yourCard
let originalRank = yourCard.rank

func changeRank(of card: MutableCard,
                to rank: Rank) {
    card.rank = rank
}

changeRank(of: yourCard,
           to: .queen)

yourCard

extension MutableCard {
    func changeRank(to rank: Rank) {
        self.rank = rank
    }
}

yourCard.changeRank(to: .five)

yourCard

yourCard.suit = .diamonds

changeRank(of: yourCard,
           to: .queen)

yourCard

func incrementRank() -> Rank {
    if var index
        = ranks.firstIndex(of: yourCard.rank) {
        index = (index + 1) % numberOfRanks
        changeRank(of: yourCard,
                   to: ranks[index])
    }
    return yourCard.rank
}

yourCard
incrementRank()
yourCard
incrementRank()
yourCard
incrementRank()
yourCard

yourCard.changeRank(to: originalValue.rank)
yourCard.changeRank(to: originalRank)
//: [Next](@next)
