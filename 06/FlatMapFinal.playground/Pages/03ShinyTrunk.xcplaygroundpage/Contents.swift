//: [Previous](@previous)

let emptyTrunk = ShinyTrunk<Point>()

let trunkWithPoint = ShinyTrunk(containing: origin)

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

func movingRightInTrunk(_ point: Point) -> ShinyTrunk<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    if movedPoint.x <= 20 {
        return ShinyTrunk(containing: movedPoint)
    } else {
        return ShinyTrunk<Point>.empty
    }
}

func movingDownInTrunk(_ point: Point) -> ShinyTrunk<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    if movedPoint.y <= 10 {
        return ShinyTrunk(containing: movedPoint)
    } else {
        return ShinyTrunk<Point>.empty
    }
}

movingRightInTrunk(origin)

emptyTrunk
    .map(movingRightInTrunk)

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

func emphasize(_ string: String) -> ShinyTrunk<String> {
    ShinyTrunk<String>(containing: string.uppercased() + "!")
}

func numberOfCharacters(in string: String) -> ShinyTrunk<Int> {
    ShinyTrunk<Int>(containing: string.count)
}

let emptyString = ShinyTrunk<String>()

let hello = ShinyTrunk(containing: "hello")

emptyString
    .flatMap(emphasize)

emptyString
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)

hello
    .flatMap(emphasize)


hello
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)

// don't do the following

hello
    .map(emphasize)

hello
    .map(emphasize)
    .flatMap{shinyTrunkString in shinyTrunkString}

hello
    .map(emphasize)
    .flatMap{$0}

func cutDeck(to index: Int) -> (Deck) -> ShinyTrunk<Deck> {
{deck in
    ShinyTrunk<Deck>(containing: deck.cut(index))
    }
}

func shuffleDeck(to index: Int) -> (Deck) -> ShinyTrunk<Deck> {
      {deck in
        ShinyTrunk<Deck>(containing: deck.shuffle(cutDepth: index))
    }
}

let deckInTrunk = ShinyTrunk<Deck>(containing: freshDeck)

deckInTrunk
    .flatMap(shuffleDeck(to: 17))
    .flatMap(cutDeck(to: 24))
    .flatMap(shuffleDeck(to: 27))
    .flatMap(cutDeck(to: 25))

//: [Next](@next)
