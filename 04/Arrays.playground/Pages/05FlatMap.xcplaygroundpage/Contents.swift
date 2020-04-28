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
//: [Next](@next)
