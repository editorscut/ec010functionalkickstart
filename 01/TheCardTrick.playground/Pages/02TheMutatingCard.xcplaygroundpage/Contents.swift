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
let originalRank = threeOfClubs.rank

func changeRank(of card: MutableCard,
                  to rank: Rank) {
    card.rank = rank
}

threeOfClubs

changeRank(of: threeOfClubs,
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



changeRank(of: threeOfClubs,
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

threeOfClubs.changeRank(to: originalRank)

let numbers = ["zero", "one", "two", "three", "four"]

//func switchElements(in array: [String],
//                    at firstIndex: Int,
//                    and secondIndex: Int) -> [String] {
//    var array = array
//    let first = array[firstIndex]
//    array[firstIndex] = array[secondIndex]
//    array[secondIndex] = first
//    return array
//}

func switchElements(in array: [String],
                    at firstIndex: Int,
                    and secondIndex: Int) -> [String] {
    var newArray = array
    newArray[firstIndex] = array[secondIndex]
    newArray[secondIndex] = array[firstIndex]
    return newArray
}


switchElements(in: numbers,
               at: 1, and: 3)

//: [Next](@next)
