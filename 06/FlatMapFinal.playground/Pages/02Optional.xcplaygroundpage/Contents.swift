//: [Previous](@previous)



maggie.contact.map(\.email)

annabelle.contact.map(\.email)

//print(annabelle.contact.map(\.location))
//
//print(daniel.contact.map(\.location))

//print(daniel.contact.map(\.location).map(\.street))

//print(daniel.contact.flatMap(\.location).flatMap(\.street))
//print(kimberli.contact.map(\.location).map(\.street))

kimberli.contact?.email.prefix


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

let emptyTrunk = ShinyTrunk<Deck>()

let trunkWithCards = ShinyTrunk(containing: freshDeck)

func mix(_ deck: Deck) -> Deck {
    deck.shuffle(cutDepth: 24).cut(25).shuffle(cutDepth: 26)
}

emptyTrunk.map(mix).map(mix)
trunkWithCards.map(mix).map(mix)

func mixAndHide(_ deck: Deck) -> ShinyTrunk<Deck> {
    ShinyTrunk(containing: deck.shuffle(cutDepth: 24).cut(25).shuffle(cutDepth: 26))
}

extension ShinyTrunk {
    func flatMap<Output>(_ transform: (WhatsInside) -> ShinyTrunk<Output>)
        -> ShinyTrunk<Output> {
            switch self {
            case .empty:
                return ShinyTrunk<Output>()
            case .containing(let whatsInside):
                return transform(whatsInside)
            }
    }
}

emptyTrunk.map(mixAndHide)//.map(mixAndHide)

trunkWithCards.map(mixAndHide)//.map(mixAndHide)

emptyTrunk.flatMap(mixAndHide).flatMap(mixAndHide)

trunkWithCards.flatMap(mixAndHide).flatMap(mixAndHide)

//: [Next](@next)
