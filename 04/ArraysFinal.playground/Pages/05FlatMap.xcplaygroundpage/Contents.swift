//: [Previous](@previous)

let words = ["my", "dog", "is", "not", "very", "smart"]


func score(for character: Character) -> Int {
    switch character.lowercased() {
    case "a", "e", "i", "o", "u", "y":
        return 2
    case "d", "m", "n", "r", "s", "t":
        return 3
    case "b", "c", "f", "g", "h", "l":
        return 4
    default:
        return 5
    }
}

func characters(in string: String) -> [Character] {
    Array(string)
}

characters(in: "Annabelle")

characters(in: "Annabelle")
    .map(score)

extension Array where Element == Int {
    var sum: Int {
        var total = 0
        for element in self {
            total += element
        }
        return total
    }
}

characters(in: "Annabelle")
    .map(score)
    .sum

words
    .map(characters)

words
    .flatMap(characters)

words
    .flatMap(characters)
    .map(score)

words
    .flatMap(characters)
    .map(score)
    .sum

extension Array {
    func myFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        for element in self {
            let newArray = transform(element)
            result.append(contentsOf: newArray)
        }
        return result
    }
}

words
    .myFlatMap(characters)
    .map(score)
    .sum

//: [Next](@next)
