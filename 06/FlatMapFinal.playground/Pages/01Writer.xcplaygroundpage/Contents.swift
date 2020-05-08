//: [Previous](@previous)

origin

moveRight(origin)

let pointWriter = Writer(origin,
                         log: "Starting at (0,0)")

pointWriter.map(moveRight)

func right(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
           log: "Moved right 10 to \(movedPoint)")
}

pointWriter.map(right)

extension Writer {
    func flatMap<Output>(_ transform: (Value) -> Writer<Output>)
                                                 -> Writer<Output> {
        let newWriter = transform(value)
        let newLog = log + "\n" + newWriter.log
        return Writer<Output>(newWriter.value,
                              log: newLog)
    }
}

pointWriter.flatMap(right)

func up(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
           log: "Moved up 10 to \(movedPoint)")
}

pointWriter
    .flatMap(right)
    .flatMap(up)
    .flatMap(right)
    .flatMap(up)
    .flatMap(up)

func cutDeck(to index: Int) -> (Deck) -> Writer<Deck> {
    {deck in
        Writer<Deck>(deck.cut(index),
                     log: "Cut the top \(index) cards off the deck")
    }
}

let shuffleDeck: (Deck) -> Writer<Deck>
    =  {deck in
        Writer<Deck>(deck.shuffle(cutDepth: 26),
                     log: "Shuffle deck")
}

let newDeck = Writer<Deck>(freshDeck,
                           log: "Start with a fresh deck")

newDeck
    .flatMap(shuffleDeck)
    .flatMap(cutDeck(to: 23))
    .flatMap(shuffleDeck)
    .flatMap(cutDeck(to: 17))

//: [Next](@next)
