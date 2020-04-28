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

extension Array where Element == Character {
    var points: Int {
        var total = 0
        for element in self {
            total += score(for: element)
        }
        return total
    }
}


words
    .flatMap(characters)
    .points

extension Array  {
    func myReduce<T>(_ initialValue: T,
                   _ update: (T, Element) -> T) -> T {
        var total = initialValue
        for element in self {
            total = update(total, element)
        }
        return total
    }
}

words
    .flatMap(characters)
    .map(score)
    .myReduce(0){(total, element) -> Int in
                    total + element
                }

words
    .flatMap(characters)
    .map(score)
    .reduce(0){(total, element) -> Int in
                total + element
              }

words
    .flatMap(characters)
    .map(score)
        .reduce(0, +)

words
    .flatMap(characters)
        .reduce(0){ (runningTotal, element) -> Int in
                    runningTotal + score(for: element)
                  }

words
    .reduce([Int]()){ (pointsPerWord, element) -> [Int] in
        pointsPerWord + [characters(in: element).map(score).sum]
}

func raise(_ base: Int,
           toThe exponent: Int) -> Int {
    Array(repeating: base, count: exponent)
        .reduce(1) {(product, element) -> Int in
            product * element
    }
}

raise(3,
      toThe: 2)

raise(2,
      toThe: 5)
//: [Next](@next)
