//: [Previous](@previous)
var twos = [18, 8, 4, 10, 20, 12, 16, 2, 6, 14]

let threes = ["three", "six", "nine",
              "twelve", "eighteen", "fifteen"]

//twos.sort()
twos.sorted()
twos = twos.sorted()

twos

let sortedThrees = threes.sorted()

threes

twos.sort(by: >)
twos

let lengthSortedThrees
    = threes.sorted(by: {$0.count < $1.count})

lengthSortedThrees

var result = freshDeck

result = freshDeck.sorted(by: >)

result = freshDeck.sorted{ $0 > $1 }


result
    = freshDeck
        .sorted{$0.rank < $1.rank}

func comparingRanks(of card1: Card,
                    to card2: Card) -> Bool {
    card1.rank < card2.rank
}

func comparingSuits(of card1: Card,
                    to card2: Card) -> Bool {
    card1.suit < card2.suit
}

result = freshDeck.sorted(by: comparingRanks)

result = freshDeck.sorted(by: comparingSuits)

let yourHand
    = freshDeck.fauxDeal(10,
                         startingWith: 7,
                         jumpingBy: 19)

result = yourHand

result
    = yourHand
        .sorted(by: comparingRanks)

result
    = yourHand
        .sorted(by: comparingRanks(of:to:))

result
    = yourHand
        .sorted(by: comparingSuits)

result = yourHand.sorted{
    if $0.suit == $1.suit {
        return $0.rank < $1.rank
    }
    return $0.suit < $1.suit
}


result = yourHand
    .sorted{$0.rank < $1.rank}
    .sorted{$0.suit < $1.suit}


result
    = yourHand
        .sorted(by: comparingRanks)
        .sorted(by: comparingSuits)


//result = result.sorted(by: comparingRanks).sorted(by: comparingSuits)



import PlaygroundSupport
//PlaygroundPage.current.setLiveView(DeckView(of: result))
PlaygroundPage.current.setLiveView(HandView(of: result))


//: [Next](@next)
