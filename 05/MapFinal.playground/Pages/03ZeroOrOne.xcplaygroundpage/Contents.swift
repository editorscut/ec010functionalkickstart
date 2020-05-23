//: [Previous](@previous)

struct DustyTrunk<WhatsInside> {
    private let whatsInside: [WhatsInside]
    
    init(){
        self.whatsInside = []
    }
    
    init(containing whatsInside: WhatsInside) {
        self.whatsInside = [whatsInside]
    }
}

extension DustyTrunk {
    func map<Output>(_ transform: (WhatsInside) -> Output)
                                                 -> DustyTrunk<Output> {
       guard let whatsInside = whatsInside.first else {
           return DustyTrunk<Output>()
       }
       return DustyTrunk<Output>(containing: transform(whatsInside))    }
}

extension DustyTrunk: CustomStringConvertible {
    public  var description: String {
        let type = WhatsInside.self
        guard let whatsInside = whatsInside.first else {
            return "Trunk with no \(type)"
        }
        return "Trunk containing the \(type): \(whatsInside)"
    }
}

let seventeenTrunk = DustyTrunk(containing: 17)
let helloTrunk = DustyTrunk(containing: "Hello")
let emptyTrunk = DustyTrunk<String>()

emphasize("Hello")
numberOfCharacters(in: "HELLO!")

helloTrunk
    .map(emphasize)

emptyTrunk
    .map(emphasize)

numberOfCharacters(in: emphasize("Hello"))

helloTrunk
    .map(emphasize)
    .map(numberOfCharacters)

emptyTrunk
    .map(emphasize)
    .map(numberOfCharacters)

seventeenTrunk
    .map(cardFromFreshDeck)

seventeenTrunk
    .map(cardFromFreshDeck)
    .map(increment)

helloTrunk
    .map(emphasize)
    .map(numberOfCharacters)


//: [Next](@next)
