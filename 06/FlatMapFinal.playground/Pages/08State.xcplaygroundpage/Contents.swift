//: [Previous](@previous)

func deal(from deck: Deck) -> (Card, Deck) {
    (deck[0], Deck(deck[1...]))
}

let dealer = State(run: deal)

let (card1, deck1) = dealer.run(shuffledDeck)
card1

let (card2, deck2) = dealer.run(deck1)
card2

let (card3, deck3) = dealer.run(deck2)
card3

let (card4, deck4) = dealer.run(deck3)
card4

let (card5, deck5) = dealer.run(deck4)
card5

let colorPicker = dealer.map{card in card.color}

let (color1, _) = colorPicker.run(deck5)
color1


extension State where S == Deck, A == Card {
    func deal(_ count: Int,
              hand: Hand = Hand()) -> State<Deck, Hand> {
        guard count > 0 else {return State<Deck, Hand>.just(hand)}
        return self.flatMap{card in
            return self.deal(count - 1, hand: hand + [card])
        }
    }
}

let fiveCardDealer = dealer.deal(5)

let (nextFiveCards, remainingDeck)
    = fiveCardDealer.run(shuffledDeck)
nextFiveCards
remainingDeck.count

extension State {
    func next(_ count: Int,
              accumulator: [A] = [A]()) -> State<S, [A]> {
        flatMap{a in
            guard count > 0 else {return State<S, [A]>.just(accumulator)}
            return self.next(count - 1, accumulator: accumulator + [a])
        }
    }
}

let tenTosses
    = dealer
        .map{card in card.color == .red}
        .map{bool in bool ? "H" : "T"}
        .next(10)

let (nextTenTosses, _) = tenTosses.run(shuffledDeck)
nextTenTosses
    .description

extension State where S == Deck, A == Card {
    func next(where condition: @escaping (A) -> Bool) -> Self {
        flatMap{card in
            if condition(card) {
                return State<S, A>.just(card)
            } else {
                print(card)
                return self.next(where: condition)
            }
        }
    }
}

let nextJackFinder = dealer.next(where: {$0.rank == .jack})
let (nextJack, _) = nextJackFinder.run(shuffledDeck)
nextJack

extension State  {
    func next(where condition: @escaping (A) -> Bool) -> Self {
        flatMap{a in
            if condition(a) {
                return State<S, A>.just(a)
            } else {
                print(a)
                return self.next(where: condition)
            }
        }
    }
}

let faceCardFinder = dealer.next(where: {$0.rank > .ten})
let (firstFaceCard, remainder) = faceCardFinder.run(shuffledDeck)
firstFaceCard

let (nextFaceCard, _) = faceCardFinder.run(remainder)
nextFaceCard

// Bonus endless random number generator for numbers between 0 and 9

let noFaceCards = shuffledDeck.filter{$0.rank < .jack}

func dealAndReplace(from deck: Deck) -> (Int, Deck) {
    var deck = deck
    let topCard = deck.remove(at: 0)
    let index = ranks.firstIndex(of: topCard.rank) ?? 0
    deck.insert(topCard, at: deck.count - index)
    return (index, deck)
}

let endlessDealer = State(run:  dealAndReplace)


let (number, deck) = endlessDealer.run(noFaceCards)
number


let (numbers, _)
    = endlessDealer
//        .next(where: {$0.isMultiple(of: 2)}) uncomment for evens only
        .next(60)
        .run(noFaceCards)
numbers

//: [Next](@next)
