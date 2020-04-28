//: [Previous](@previous)

let twos = [2, 4, 6, 8, 10]
let fours = [4: "four", 8: "eight"]

fours[2]
fours[4]

fours[4]?.count

func lookInFours(for key: Int) -> String? {
    fours[key]
}

lookInFours(for: 2)
lookInFours(for: 4)

twos
    .map(lookInFours)

twos
    .map(lookInFours)
    .filter{possibleString in possibleString != nil}

twos
    .map(lookInFours)
    .filter{possibleString in possibleString != nil}
    .map{nonNilOptional in nonNilOptional!}


twos
    .compactMap(lookInFours)

extension Array {
    func myCompactMap<T>(_ transform: (Element) -> T?) -> [T] {
        var result = [T]()
        for element in self {
            if let newElement = transform(element) {
                result.append(newElement)
            }
        }
        return result
    }
}

twos
    .myCompactMap(lookInFours)
//: [Next](@next)
