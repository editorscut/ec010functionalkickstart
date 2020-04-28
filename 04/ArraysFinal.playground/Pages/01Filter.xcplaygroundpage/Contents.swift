//: [Previous](@previous)

var words = ["my", "dog", "is", "not", "very", "smart"]



words
    .filter{word in
        word.count > 2}

words
    .filter{word in
        word.contains("y")}

words
    .filter{$0.contains("y")}

words
    .filter({$0.contains("y")})

words
    .filter(){$0.contains("y")}

func containsY(_ string: String) -> Bool {
    string.contains("y")
}

words
    .filter(containsY)

extension Array {
    func myFilter(_ isIncluded: (Element) -> Bool) -> Self {
        var result = Self()
        for element in self where isIncluded(element) {
            result.append(element)
        }
        return result
    }
}

words
    .myFilter(containsY)

extension String {
    var containsM: Bool {
        contains("m")
    }
}

words
    .filter{word
        in word.containsM}

words
    .filter{$0.containsM}

words
    .filter(\.containsM)




let hearts
    = freshDeck
        .filter{card in
            card.suit == .hearts
}

let aces
    = freshDeck
        .filter{card in
            card.rank == .ace
}

let faceCards
    = freshDeck
        .filter{card in
            card.rank > .ten
}

import PlaygroundSupport
//PlaygroundPage.current.setLiveView(DeckView(of: faceCards))

PlaygroundPage.current.setLiveView(FilterView())
//: [Next](@next)
