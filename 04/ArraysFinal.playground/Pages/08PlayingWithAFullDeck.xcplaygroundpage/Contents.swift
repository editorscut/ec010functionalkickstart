//: [Previous](@previous)


var result = freshDeck

extension Deck {
    func perfectShuffle() -> Deck {
        let topHalf = self[0..<26]
        let bottomHalf = self[26...]
        let tuples = zip(topHalf, bottomHalf)
        return tuples.reduce(Deck()){(deckSoFar, pair) in
            deckSoFar + [pair.0, pair.1]
        }
    }
}

let perfectlyShuffled
    = freshDeck
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()
        .perfectShuffle()

perfectlyShuffled == freshDeck

result = perfectlyShuffled

extension Deck {
    func shuffle(cutDepth index: Int) -> Deck {
        let topHalf = self[0..<index]
        let bottomHalf = self[index...]
        let tuples = zip(topHalf, bottomHalf)
        let shuffledPart
            = tuples.reduce(Deck()){(deckSoFar, pair) in
                deckSoFar + [pair.0, pair.1]
        }
        return shuffledPart
            + ((index < count/2 )
                ?  self[(index * 2)...]
                : self[(count - index)..<index])
    }
}

let shuffled = freshDeck.shuffle(cutDepth: 45)

shuffled.count

result = shuffled

let numberedCards
    = freshDeck.filter{card in
        card.rank < .jack
            && card.rank > .ace
}

numberedCards.count

result = numberedCards

let shuffledNumbers
    = numberedCards
        .shuffle(cutDepth: 18)
        .shuffle(cutDepth: 17)
        .shuffle(cutDepth: 19)
        .shuffle(cutDepth: 18)

result = shuffledNumbers

let hand = result.deal(20).hand


let finalHand
    = hand
        .sorted{$0.rank < $1.rank}
        .sorted{$0.suit < $1.suit}


import PlaygroundSupport
PlaygroundPage.current
    .setLiveView(HandView(of: finalHand))



//: [Next](@next)
