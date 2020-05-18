public typealias Deck = [Card]
public typealias Hand = Deck


extension Deck {
    public func selectCard(at index: Int) -> (Card, Deck) {
        guard index < count else {
            fatalError("The deck has fewer than \(index + 1) cards.")
        }
        var deck = self
        let card = deck.remove(at: index)
        return (card, deck)
    }
}

extension Deck {
    public func topped(with card: Card) -> Deck {
        [card] + self
    }
}

extension Deck {
    public var topCard: Card {
        self[0]
    }
    
    public var selectTopCard: (Card, Deck) {
        selectCard(at: 0)
    }
}


public let freshDeck: Deck = {
    let suits = Suit.allCases
    let ranks = Rank.allCases
    
    var freshDeck = Deck()
    for suit in suits {
        for rank in ranks {
            freshDeck.append(Card(rank,
                                  of: suit))
        }
    }
    return freshDeck
}()

public let shuffledDeck
    = freshDeck
        .shuffle(cutDepth: 26)
        .shuffle(cutDepth: 23)
        .shuffle(cutDepth: 24)
        .shuffle(cutDepth: 23)
        .cut(17)

extension Array: CustomPlaygroundDisplayConvertible
                                    where Element == Card {
     public var playgroundDescription: Any {
        self.description
    }
}

extension Deck {
    public func fauxDeal(_ numberOfCards: Int = 5,
                     startingWith seed: Int = 0,
                     jumpingBy delta: Int = 1) -> Hand {
        var index = (seed * seed.signum()) % 52
        var hand = Hand()
        while hand.count < numberOfCards {
            let newCard = self[index]
            if !hand.contains(newCard) {
                hand.append(newCard)
            }
            index = (index + delta) % 52
        }
        return hand
    }
    
    public func deal(_ numberOfCards: Int) -> (hand: Hand, remainingCards: Deck) {
        var hand = Hand()
        var deck = self
        
        guard numberOfCards <= count else {return (hand, self)}
        hand = Array(deck[..<numberOfCards])
        deck.removeFirst(numberOfCards)
        return (hand, deck)
    }
}

extension Deck: Identifiable {
    public var id: String {
        description
    }
}

extension Deck {
    public func cut(_ index: Int) -> Deck {
        let topHalf = self[0..<index]
        let bottomHalf = self[index...]
        return Deck(bottomHalf + topHalf)
    }
    
    public func shuffle(cutDepth index: Int) -> Deck {
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

