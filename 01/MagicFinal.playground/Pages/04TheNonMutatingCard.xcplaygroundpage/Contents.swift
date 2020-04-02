//: [Previous](@previous)

let yourCard = ImmutableCard(.three,
                             of: .clubs)

//func changeRank(of card: ImmutableCard,
//                to rank: Rank) {
//    var card = card
//    card.rank = rank
//}
//
//yourCard
//
//changeRank(of: yourCard,
//           to: .queen)
//
yourCard

func changingRank(of card: ImmutableCard,
                  to rank: Rank) -> ImmutableCard {
    ImmutableCard(rank,
                  of: card.suit)
}

changingRank(of: yourCard,
             to: .queen)

yourCard

//yourCard = changingRank(of: yourCard,
//                        to: .queen)
//
//yourCard = ImmutableCard(.five,
//                         of: .diamonds)

import Foundation

func changeRank() -> Rank {
    let double = Date().timeIntervalSince1970 * 100_000
    let int = Int(double) % numberOfRanks
    return ranks[int]
}

changeRank()
changeRank()
changeRank()
changeRank()
changeRank()
changeRank()

let queenOfClubs = ImmutableCard(.queen,
                                 of: .clubs)
changingRank(of: changingRank(of: yourCard,
                              to: .queen),
             to: .king)

changingRank(of: queenOfClubs,
             to: .king)


//: [Next](@next)



