//: [Previous](@previous)


let emptyTrunk: Point? = nil

let trunkWithPoint: Point? = origin

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

func movingRightInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    if movedPoint.x <= 20 {
        return movedPoint
    } else {
        return nil
    }
}

func movingDownInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    if movedPoint.y <= 10 {
        return movedPoint
    } else {
        return nil
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


func emphasize(_ string: String) -> String? {
    
    string.uppercased() + "!"
}

func numberOfCharacters(in string: String) -> Int? {
    string.count
}

let hello: String? = "hello"

hello
    .flatMap(emphasize)


hello
    .flatMap(emphasize)
    .flatMap(numberOfCharacters)


func cutDeck(to index: Int) -> (Deck) -> Deck? {
{deck in
    guard index < deck.count && index >= 0 else {return nil}
    return deck.cut(index)
    }
}

func shuffleDeck(to index: Int) -> (Deck) -> Deck? {
      {deck in
        guard index < deck.count && index >= 0 else {return nil}
        return deck.shuffle(cutDepth: index)
    }
}

let deckInTrunk: Deck? = freshDeck

deckInTrunk.flatMap(cutDeck(to: -5))
deckInTrunk.flatMap(shuffleDeck(to: 100))

deckInTrunk
    .flatMap(shuffleDeck(to: 17))
    .flatMap(cutDeck(to: 24))
    .flatMap(shuffleDeck(to: 27))
    .flatMap(cutDeck(to: 25))



//: [Next](@next)
