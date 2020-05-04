//: [Previous](@previous)

enum ShinyTrunk<WhatsInside> {
    case empty
    case containing(WhatsInside)
    
    init() {
        self = .empty
    }
    
    init(containing whatsInside: WhatsInside) {
        self = .containing(whatsInside)
    }
}

extension ShinyTrunk {
    func map<Output>(_ transform: (WhatsInside) -> Output)
        -> ShinyTrunk<Output> {
            switch self {
            case .empty:
                return ShinyTrunk<Output>()
            case .containing(let whatsInside):
                return ShinyTrunk<Output>(containing: transform(whatsInside))
            }
    }
}

extension ShinyTrunk: CustomStringConvertible {
    var description: String {
        let type = WhatsInside.self
        switch (self) {
        case .empty:
            return "Trunk with no \(type)"
        case .containing(let whatsInside):
            return "Trunk containing the \(type): \(whatsInside)"
        }
    }
}

//let helloTrunk = ShinyTrunk.containing("Hello")
//let emptyTrunk = ShinyTrunk<String>.empty

let helloTrunk = ShinyTrunk(containing: "Hello")
let emptyTrunk = ShinyTrunk<String>()

helloTrunk
    .map(emphasize)

emptyTrunk
    .map(emphasize)

helloTrunk
    .map(emphasize)
    .map(numberOfCharacters)

emptyTrunk
    .map(emphasize)
    .map(numberOfCharacters)

ShinyTrunk(containing: 17)
    .map(cardFromFreshDeck)

let anotherHelloTrunk: String? = "Hello"
let anotherEmptyTrunk: String? = .none
let another17Trunk: Int? = 17

anotherHelloTrunk
    .map(emphasize)

anotherEmptyTrunk
    .map(emphasize)

anotherHelloTrunk
    .map(emphasize)
    .map(numberOfCharacters)

anotherEmptyTrunk
    .map(emphasize)
    .map(numberOfCharacters)

another17Trunk
    .map(cardFromFreshDeck)

//: [Next](@next)
