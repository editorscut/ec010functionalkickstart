//: [Previous](@previous)
func emphasize(_ string: String) -> String {
    string.uppercased() + "!"
}

func numberOfCharacters(in string: String) -> Int {
    string.count
}

//: End setup

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


extension ShinyTrunk {
    func map<Output>(_ transform: (WhatsInside) -> Output) -> ShinyTrunk<Output> {
        switch self {
        case .empty:
            return ShinyTrunk<Output>()
        case .containing(let whatsInside):
            return ShinyTrunk<Output>(containing: transform(whatsInside))
        }
    }
}

//let helloTrunk = ShinyTrunk.containing("Hello")
//let emptyTrunk = ShinyTrunk<String>.empty

//let helloTrunk = ShinyTrunk(containing: "Hello")
//let emptyTrunk = ShinyTrunk<String>()

let emptyTrunk: String? = .none
let helloTrunk: String? = "Hello"


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

// example of how Optional might be implemented
enum MyOptional<Wrapped> {
    case none
    case some(Wrapped)
}

extension MyOptional {
    func map<Output>(_ transform: (Wrapped) -> Output) -> Output? {
        switch self {
        case .none:
            return Optional<Output>.none
        case .some(let value):
            return Optional.some(transform(value))
        }
    }
}


//: [Next](@next)
