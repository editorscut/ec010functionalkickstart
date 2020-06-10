//: [Previous](@previous)

origin

moveRight(origin)

moveDown(moveRight(origin))

let pointWriter = Writer(origin,
    log: "")

pointWriter
    .map(moveRight)


pointWriter
    .map(moveRight)
    .map(moveDown)

func loggingMoveRight(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
                  log: "Moved right from \(point) to \(movedPoint) \n")
}

func loggingMoveDown(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
                  log: "Moved down from \(point) to \(movedPoint) \n")
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
    = movedRight.log
        + movedDownValue.log
        + movedDownValue.value.log

let movedDown = Writer(movedDownValue.value.value,
                       log: movedDownLog)

pointWriter
    .flatMap(loggingMoveRight)

pointWriter
    .flatMap(loggingMoveRight)
    .flatMap(loggingMoveDown)
    .flatMap(loggingMoveDown)

pointWriter
    >=> loggingMoveRight

pointWriter
    >=> loggingMoveRight
    >=> loggingMoveDown
    >=> loggingMoveDown

func numberOfCharacters(in string: String) -> Writer<Int> {
    Writer<Int>(string.count,
                log: "There are \(string.count) characters in \(string) \n")
}

let hello = Writer("hello",
                   log: "You had me at 'hello'")

hello
    .flatMap(numberOfCharacters)

func emphasize(_ string: String) -> Writer<String> {
    Writer<String>(string.uppercased() + "!",
                   log: "Uppercased and added '!' \n")
}

hello
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)

func cutDeck(to index: Int) -> (Deck) -> Writer<Deck> {
{deck in
    Writer<Deck>(deck.cut(index),
                 log: "Cut the top \(index) cards off the deck \n")
    }
}

func shuffleDeck(to index: Int) -> (Deck) -> Writer<Deck> {
      {deck in
        Writer<Deck>(deck.shuffle(cutDepth: index),
                     log: "Shuffle deck to \(index) \n")
    }
}

let newDeck = Writer<Deck>(freshDeck,
                           log: "")

newDeck
    .flatMap(shuffleDeck(to: 17))
    .flatMap(cutDeck(to: 24))
    .flatMap(shuffleDeck(to: 27))
    .flatMap(cutDeck(to: 25))

hello >=> numberOfCharacters

newDeck
    >=> shuffleDeck(to: 17)
    >=> cutDeck(to: 24)
    >=> shuffleDeck(to: 27)
    >=> cutDeck(to: 25)

//: [Next](@next)
