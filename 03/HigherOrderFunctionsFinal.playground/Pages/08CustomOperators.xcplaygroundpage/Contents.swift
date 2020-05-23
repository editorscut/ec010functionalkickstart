//: [Previous](@previous)

func threeXPlusTwo(x: Int) -> Int {
    3 * x + 2
}

func squared(x: Int) -> Int {
    x * x
}

func reverse(_ deck: Deck) -> Deck {
    return Array(deck.reversed())
}

func alternatingJackOfDiamonds(_ deck: Deck) -> Deck {
    var newDeck = Deck()
    for (index, card) in deck.enumerated() {
        newDeck
            .append(index.isMultiple(of: 2)
                ? Card(.jack, of: .diamonds)
                : card)
    }
    return newDeck
}

func changeAlternateCards(to newCard: Card) -> Deck {
    var newDeck = Deck()
    for (index, card) in freshDeck.enumerated() {
        newDeck
            .append(index.isMultiple(of: 2) ?
                newCard : card)
    }
    return newDeck
}

func evaluate<Input, Output>(_ x: Input,
                             using f: (Input) -> Output) -> Output {
    f(x)
}

precedencegroup Evaluate {
    associativity: left
}

infix operator |> : Evaluate


func |> <Input, Output>(x: Input,
                        f: (Input) -> Output) -> Output {
    f(x)
}

precedencegroup Compose {
    associativity: left
    higherThan: Evaluate
}

infix operator >>> : Compose

func >>> <A, B, C>(f: @escaping (A) -> B,
                   g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

4 |> threeXPlusTwo

4 |> threeXPlusTwo |> squared

4 |> (threeXPlusTwo >>> squared)


Card(.king,
     of: .clubs)
    |> changeAlternateCards
    |> reverse
    |> alternatingJackOfDiamonds

let trick
    = changeAlternateCards
        >>> reverse
        >>> alternatingJackOfDiamonds

Card(.king, of: .clubs) |> trick


func add(_ int1: Int,
         and int2: Int) -> Int {
    int1 + int2
}

extension Int {
    func add(_ y: Int) -> Int {
        self + y
    }
}

add(3, and: 5)

(3, 5) |> add

3.add(5)
//: [Next](@next)
