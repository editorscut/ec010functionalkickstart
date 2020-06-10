//: [Previous](@previous)

struct IsEmpty: Error {}

let emptyTrunk
    = Result<Point, IsEmpty>
        .failure(IsEmpty())

let trunkWithPoint
    = Result<Point, IsEmpty>
        .success(origin)

emptyTrunk
    .map(moveRight)

emptyTrunk
    .map(moveRight)
    .map(moveDown)

trunkWithPoint
    .map(moveRight)

trunkWithPoint
    .map(moveRight)
    .map(moveDown)

func movingRightInTrunk(_ point: Point) -> Result<Point, IsEmpty> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    if movedPoint.x <= 20 {
        return .success(movedPoint)
    } else {
        return .failure(IsEmpty())
    }
}

func movingDownInTrunk(_ point: Point) -> Result<Point, IsEmpty> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    if movedPoint.y <= 10 {
        return .success(movedPoint)
    } else {
        return .failure(IsEmpty())
    }
}

trunkWithPoint
    .map(movingRightInTrunk)

emptyTrunk
    .flatMap(movingRightInTrunk)

emptyTrunk
    .flatMap(movingRightInTrunk)
    .flatMap(movingDownInTrunk)

trunkWithPoint
    .flatMap(movingRightInTrunk)

trunkWithPoint
    .flatMap(movingRightInTrunk)
    .flatMap(movingDownInTrunk)

trunkWithPoint
    .flatMap(movingRightInTrunk)
    .flatMap(movingDownInTrunk)
    .flatMap(movingDownInTrunk)

trunkWithPoint
    >=> movingRightInTrunk
    >=> movingDownInTrunk


func emphasize(_ string: String) -> Result<String, Never> {
    
    .success(string.uppercased() + "!")
}

func numberOfCharacters(in string: String) -> Result<Int, Never> {
    .success(string.count)
}

let hello = Result<String, Never>.success("hello")

hello
    .flatMap(emphasize)


hello
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)

enum CutIsOutOfBounds: Error {
    case cutIsNegativeNumber
    case cutIsTooBig
}


func cutDeck(to index: Int) -> (Deck) -> Result<Deck, CutIsOutOfBounds> {
{deck in
    if index < 0 { return .failure(CutIsOutOfBounds.cutIsNegativeNumber)}
    guard index < deck.count else {return .failure(CutIsOutOfBounds.cutIsTooBig)}
    return .success(deck.cut(index))
    }
}

func shuffleDeck(to index: Int) -> (Deck) -> Result<Deck, CutIsOutOfBounds> {
      {deck in
        if index < 0 { return .failure(CutIsOutOfBounds.cutIsNegativeNumber)}
        guard index < deck.count else {return .failure(CutIsOutOfBounds.cutIsTooBig)}
        return .success(deck.shuffle(cutDepth: index))
    }
}

let deckInTrunk = Result<Deck, CutIsOutOfBounds>.success(freshDeck)

deckInTrunk.flatMap(cutDeck(to: -5))
deckInTrunk.flatMap(shuffleDeck(to: 100))

deckInTrunk
    .flatMap(shuffleDeck(to: 17))
    .flatMap(cutDeck(to: 24))
    .flatMap(shuffleDeck(to: 27))
    .flatMap(cutDeck(to: 25))



//: [Next](@next)
