//: [Previous](@previous)

class MutableCard {
    var rank: Rank
    var suit: Suit
    
    init(_ rank: Rank,
         of suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

extension MutableCard: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}

var threeOfClubs = MutableCard(.three,
                               of: .clubs)


func changeRankOf(_ card: MutableCard,
                  to rank: Rank) {
    card.rank = rank
}

threeOfClubs

changeRankOf(threeOfClubs,
             to: .queen)

threeOfClubs

extension MutableCard {
    func changeRank(to rank: Rank) {
        self.rank = rank
    }
}

threeOfClubs

threeOfClubs.changeRank(to: .five)

threeOfClubs


threeOfClubs.suit = .diamonds



changeRankOf(threeOfClubs,
             to: .queen)

threeOfClubs

var position = ranks.firstIndex(of: threeOfClubs.rank)!

extension MutableCard {
    func changeRank() {
        position = (position + 1) % ranks.count
        rank = ranks[position]
    }
}

threeOfClubs
threeOfClubs.changeRank()
threeOfClubs
threeOfClubs.changeRank()
threeOfClubs
threeOfClubs.changeRank()
threeOfClubs

//: [Next](@next)
