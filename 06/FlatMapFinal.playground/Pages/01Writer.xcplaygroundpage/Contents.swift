//: [Previous](@previous)

origin

moveRight(origin)

moveDown(moveRight(origin))

let pointWriter = Writer(origin,
                         log: "Starting at (0,0)")

pointWriter
    .map(moveRight)


pointWriter
    .map(moveRight)
    .map(moveDown)

func loggingMoveRight(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
                  log: "Moved right to \(movedPoint)")
}

func loggingMoveDown(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
                  log: "Moved down to \(movedPoint)")
}

loggingMoveRight(origin)

//loggingMoveDown(loggingMoveRight(origin))
//
//loggingMoveRight(pointWriter)


pointWriter.map(loggingMoveRight)

let movedRight
    = pointWriter
        .map(loggingMoveRight)

let movedDownValue
    = movedRight
        .value
        .map(loggingMoveDown)

let movedDownLog
    = movedRight.log + "\n"
        + movedDownValue.log + "\n"
        + movedDownValue.value.log

let movedDown = Writer(movedDownValue.value.value,
                       log: movedDownLog)

extension Writer {
    func flatMap<Output>(_ transform: (Value) -> Writer<Output>)
        -> Writer<Output> {
            let newWriter = transform(value)
            let newLog = log + "\n" + newWriter.log
            return Writer<Output>(newWriter.value,
                                  log: newLog)
    }
}

pointWriter
    .flatMap(loggingMoveRight)

pointWriter
    .flatMap(loggingMoveRight)
    .flatMap(loggingMoveDown)
    .flatMap(loggingMoveDown)

func numberOfCharacters(in string: String) -> Writer<Int> {
    Writer<Int>(string.count,
                log: "There are \(string.count) characters in \(string)")
}

let hello = Writer("hello",
                   log: "You had me at 'hello'")

hello
    .flatMap(numberOfCharacters)

func emphasize(_ string: String) -> Writer<String> {
    Writer<String>(string.uppercased() + "!",
                   log: "Uppercased and added '!'")
}

hello
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)

func cutDeck(to index: Int) -> (Deck) -> Writer<Deck> {
{deck in
    Writer<Deck>(deck.cut(index),
                 log: "Cut the top \(index) cards off the deck")
    }
}

func shuffleDeck(to index: Int) -> (Deck) -> Writer<Deck> {
      {deck in
        Writer<Deck>(deck.shuffle(cutDepth: index),
                     log: "Shuffle deck to \(index)")
    }
}

let newDeck = Writer<Deck>(freshDeck,
                           log: "Start with a fresh deck")

newDeck
    .flatMap(shuffleDeck(to: 17))
    .flatMap(cutDeck(to: 24))
    .flatMap(shuffleDeck(to: 27))
    .flatMap(cutDeck(to: 25))

//: [Next](@next)
