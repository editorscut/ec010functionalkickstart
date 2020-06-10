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
    .debugDescription

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


func abbreviate(_ string: String) -> String? {
    guard let firstLetter = string.first else {return nil}
    return firstLetter.uppercased() + "."
}


let hello: String? = "hello"

hello
    .map(abbreviate).debugDescription


hello
    .flatMap(abbreviate)?.debugDescription


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

deckInTrunk
    >=> shuffleDeck(to: 17)
    >=> cutDeck(to: 24)
    >=> shuffleDeck(to: 27)
    >=> cutDeck(to: 25)

extension Deck {
    func cutDeck(to index: Int) -> Deck? {
        guard index < count && index >= 0 else {return nil}
        return cut(index)
    }
    
    func shuffleDeck(to index: Int) -> Deck? {
        guard index < count && index >= 0 else {return nil}
        return shuffle(cutDepth: index)
    }
}

deckInTrunk?.shuffleDeck(to: 17)

deckInTrunk?
    .shuffleDeck(to: 17)?
    .cutDeck(to: 24)?
    .shuffleDeck(to: 27)?
    .cutDeck(to: 25)



//: [Next](@next)
