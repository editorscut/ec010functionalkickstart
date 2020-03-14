//: [Previous](@previous)

struct Card: Equatable, CustomStringConvertible {
    let rank: Rank
    let suit: Suit
    
    enum Rank: String {
        case ace, two, three, four, five
        case six, seven, eight, nine, ten
        case jack, queen, king
    }
    
    enum Suit: String {
        case diamonds, clubs, hearts, spades
    }
    
    var description: String {
        "\(rank) of \(suit)"
    }
}

let threeOfClubs = Card(rank: .three,
                        suit: .clubs)

let queenOfDiamonds = Card(rank: .queen,
                           suit: .diamonds)


//: End setup

func cardTrick(_ card: Card) -> Card {
    queenOfDiamonds
}

cardTrick(threeOfClubs)

//struct MagicHat: CustomStringConvertible {
//    let contents: Card
//
//    func map(_ transform: (Card) -> Card) -> MagicHat {
//        MagicHat(contents: transform(contents))
//    }
//}
//
//extension CustomStringConvertible {
//
//    var description: String {
//        "Magic hat containing \(contents)"
//    }
//}

struct MagicHat<Contents> {
    let contents: Contents
    
    func map<Output>(_ transform: (Contents) throws -> Output) rethrows -> MagicHat<Output> {
        MagicHat<Output>(contents: try transform(contents))
    }
}
extension MagicHat: CustomStringConvertible {
    var description: String {
        "Magic hat containing \(contents)"
    }
}

let startingMagicHat = MagicHat(contents: threeOfClubs)

let endingMagicHat = startingMagicHat.map(cardTrick)

struct Rabbit{}
struct Scarf{}

func disappearingBunnyTrick(_ rabbit: Rabbit) -> Scarf {
    Scarf()
}

let bunnyInMagicHat = MagicHat(contents: Rabbit())
let scarfInMagicHat = bunnyInMagicHat.map(disappearingBunnyTrick)

extension String: Error{}

func throwingCardTrick(_ card: Card) throws -> Card {
    guard card == threeOfClubs else {throw "not the threeOfClubs"}
    return queenOfDiamonds
}

try? startingMagicHat.map(throwingCardTrick)
try? endingMagicHat.map(throwingCardTrick)
//: [Next](@next)
