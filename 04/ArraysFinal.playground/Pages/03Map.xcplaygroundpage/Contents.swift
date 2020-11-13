//: [Previous](@previous)

let words = ["my", "dog", "is", "not", "very", "smart"]

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self {
            let newElement = transform(element)
            result.append(newElement)
        }
        return result
    }
}

func numberOfCharacters(in string: String) -> Int {
    string.count
}

words
    .myMap(numberOfCharacters)

words
    .map(numberOfCharacters)


words
    .map{word
        in numberOfCharacters(in: word)}

words
    .map{numberOfCharacters(in: $0)}

words
    .map{word
        in word.count}

words
    .map{$0.count}

words.map(\.count)

words.myMap(\.count)

words
    .map(\.count)
    .map{count in count - 1}
    .map{adjustedCount in adjustedCount * adjustedCount}
    .map{finalScore in Double(finalScore) * 0.05}

words
    .map{$0.count}
    .map{$0 - 1}
    .map{$0 * $0}
    .map{Double($0) * 0.05}

func subtractOne(_ x: Int) -> Int {
    x - 1
}

func square(_ x: Int) -> Int {
    x * x
}

func payFiveCentsPerPoint(_ x: Int) -> Double {
    Double(x) * 0.05
}

words
    .map(\.count)
    .map(subtractOne)
    .map(square)
    .map(payFiveCentsPerPoint)

//extension Array where Element == String {
//    fileprivate func countCharacters() -> [Int] {
//        self.map(\.count)
//    }
//}
//
//extension Array where Element == Int {
//    fileprivate func calculatePoints() -> [Int] {
//        self.map(subtractOne).map(square)
//    }
//
//    fileprivate func determineValue() -> [Double] {
//        self.map(payFiveCentsPerPoint)
//    }
//}
//
//words
//    .countCharacters()
//    .calculatePoints()
//    .determineValue()

extension Array where Element == String {
    fileprivate var countCharacters: [Int] {
        self.map(\.count)
    }
}

extension Array where Element == Int {
    fileprivate var calculatePoints: [Int] {
        self.map(subtractOne).map(square)
    }
    
    fileprivate var determineValue: [Double] {
        self.map(payFiveCentsPerPoint)
    }
}

words
    .countCharacters
    .calculatePoints
    .determineValue

//: [Next](@next)
