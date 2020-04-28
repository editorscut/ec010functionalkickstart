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

extension Array where Element == Int {
    var sum: Int {
        var total = 0
        for element in self {
            total += element
        }
        return total
    }
}

func characters(in string: String) -> [Character] {
    Array(string)
}

words
    .flatMap(characters)
    .map(score)
    .sum

//: [Next](@next)
