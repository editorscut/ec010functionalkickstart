//: [Previous](@previous)
struct ImmutableCard {
    let rank: Rank
    let suit: Suit
    
    init(_ rank: Rank,
         of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension ImmutableCard: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}

let threeOfClubs = ImmutableCard(.three,
                                 of: .clubs)

//func changeRank(of card: ImmutableCard,
//                to rank: Rank) {
//    var card = card
//    card.rank = rank
//}
//
//threeOfClubs
//
//changeRank(of: threeOfClubs,
//           to: .queen)

threeOfClubs

//: End Setup

func changingRank(of card: ImmutableCard,
                  to rank: Rank) -> ImmutableCard {
    ImmutableCard(rank,
                  of: card.suit)
}

changingRank(of: threeOfClubs,
             to: .queen)

var position = ranks.firstIndex(of: threeOfClubs.rank)!

extension ImmutableCard {
    func changedRank() -> ImmutableCard {
        position = (position + 1) % ranks.count
        return ImmutableCard(ranks[position], of: suit)
    }
}

threeOfClubs.changedRank()
threeOfClubs.changedRank()
threeOfClubs.changedRank()

let queenOfClubs = ImmutableCard(.queen, of: .clubs)

changingRank(of: changingRank(of: threeOfClubs,
                              to: .queen),
             to: .king)

changingRank(of: queenOfClubs,
             to: .king)


//threeOfClubs
//
//threeOfClubs = changingRank(of: threeOfClubs,
//                            to: .five)
//
//threeOfClubs
//
//threeOfClubs = ImmutableCard(.seven,
//                             of: .diamonds)
//
//threeOfClubs = changingRank(of: threeOfClubs,
//                            to: .five)



//: [Next](@next)
