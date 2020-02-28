

//: End setup

struct DustyTrunk<WhatsInside> {
    private let whatsInside: [WhatsInside]
    
    init() {
        whatsInside = []
    }
    
    init(containing whatsInside: WhatsInside) {
        self.whatsInside = [whatsInside]
    }
}

extension DustyTrunk {
    func map<Output>(_ transform: (WhatsInside) -> Output) -> DustyTrunk<Output> {
        guard let whatsInside = whatsInside.first else {
            return DustyTrunk<Output>()
        }
        return DustyTrunk<Output>(containing: transform(whatsInside))
    }
}



extension DustyTrunk: CustomStringConvertible {
    var description: String {
        let type = WhatsInside.self
        guard let whatsInside = whatsInside.first else {
            return "Trunk with no \(type)"
        }
        return "Trunk containing the \(type): \(whatsInside)"
    }
}


//: [Next](@next)

let helloTrunk = DustyTrunk(containing: "Hello")
let emptyTrunk = DustyTrunk<String>()

func emphasize(_ string: String) -> String {
    string.uppercased() + "!"
}

emphasize("Hello")

func numberOfCharacters(in string: String) -> Int {
    string.count
}

numberOfCharacters(in: "HELLO!")

numberOfCharacters(in: emphasize("Hello"))



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

func compose<A, B, C>(_ f: @escaping (A) -> B,
                      with g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

let chain = compose(emphasize,
                    with: numberOfCharacters)

chain("Hello")

helloTrunk
    .map(compose(emphasize,
                 with: numberOfCharacters))

emptyTrunk
    .map(compose(emphasize,
                 with: numberOfCharacters))


