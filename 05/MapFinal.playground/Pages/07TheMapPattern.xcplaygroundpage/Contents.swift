//: [Previous](@previous)

extension Array {
    func map<Output>(_ transform: (Element) -> Output) -> [Output] {
        var result = [Output]()
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}

func diamonds(from card: Card) -> Card {
    Card(card.rank,
         of: .diamonds)
}

let stringArray = ["I", "love", "functional", "Swift"]

stringArray
    .map(emphasize)

stringArray
    .map(emphasize)
    .map(numberOfCharacters)

freshDeck
    .map(diamonds)

identity(stringArray)

stringArray.map(identity)

stringArray.map(identity) == identity(stringArray)


stringArray
    .map(emphasize)
    .map(numberOfCharacters)

stringArray
    .map(emphasize >>> numberOfCharacters)


stringArray
    <^> emphasize
    <^> numberOfCharacters

stringArray
    <^> emphasize
    >>> numberOfCharacters


(stringArray <^> emphasize <^> numberOfCharacters)

    ==

(stringArray <^> emphasize >>> numberOfCharacters)




//: [Next](@next)
