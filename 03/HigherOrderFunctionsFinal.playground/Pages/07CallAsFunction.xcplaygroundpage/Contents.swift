//: [Previous](@previous)

func line(m: Int,
          b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

line(m: 3, b: 2)(4)

let threeXplusTwo = line(m: 3, b: 2)
threeXplusTwo(4)

struct Line {
    let m: Int
    let b: Int
    
    func callAsFunction(x: Int) -> Int {
        m * x + b
    }
}

let fiveXPlusFour = Line(m: 5, b: 4)

fiveXPlusFour.callAsFunction(x: 3)

fiveXPlusFour(x: 3)

extension Deck {
    func callAsFunction(swap card1: Card, with card2: Card) -> Deck {
        guard let card1Location = self.firstIndex(of: card1),
            let card2Location = self.firstIndex(of: card2) else {return self}
        var deck = self
        deck[card1Location] = card2
        deck[card2Location] = card1
        return deck
    }
}

freshDeck(swap: Card(.two,
                     of: .spades),
          with: Card(.five,
                     of: .spades))

//: [Next](@next)
