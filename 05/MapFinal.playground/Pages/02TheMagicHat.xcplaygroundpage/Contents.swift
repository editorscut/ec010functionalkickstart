//: [Previous](@previous)

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


let magicHatContainingThreeOfClubs
    = MagicHat(contents: threeOfClubs)

magicHatContainingThreeOfClubs
    .map(increment)

cardFromFreshDeck(at: 17)

let magicHatContaining17
    = MagicHat(contents: 17)

magicHatContaining17
    .map(cardFromFreshDeck)

struct Rabbit{}
struct InfiniteScarf{}

let bunnyInMagicHat
    = MagicHat(contents: Rabbit())

func disappearingBunnyTrick(_ bunny: Rabbit) -> InfiniteScarf {
    InfiniteScarf()
}

bunnyInMagicHat
    .map(disappearingBunnyTrick)

do {
    try safeCardFromFreshDeck(at: 17)
}
catch {
    print(error)
}

do {
    try safeCardFromFreshDeck(at: 100)
}
catch {
    print(error)
}

do {
    try magicHatContaining17
        .map(safeCardFromFreshDeck)
}
catch {
    print(error)
}

let userMessingWithUs = MagicHat(contents: 100)

do {
    try userMessingWithUs.map(safeCardFromFreshDeck)
}
catch {
    print(error)
}

//: [Next](@next)
