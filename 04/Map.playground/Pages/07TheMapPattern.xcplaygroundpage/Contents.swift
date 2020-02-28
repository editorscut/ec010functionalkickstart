//: [Previous](@previous)

func compose<A, B, C>(_ f: @escaping (A) -> B,
                      with g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

func identity<A>(_ x: A) {
    x
}


func emphasize(_ string: String) -> String {
    if string.isEmpty {return ""} else {
        return string.uppercased() + "!"
    }
}

func numberOfCharacters(in string: String) -> Int {
    string.count
}

let stringArray = ["I", "love", "functional", "Swift"]
//: End setup

extension Array {
    func map<Output>(_ transform: (Element) -> Output) -> [Output] {
        var result = [Output]()
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}

stringArray
    .map(emphasize)

stringArray
    .map(emphasize)
    .map(numberOfCharacters)

stringArray
    .map(compose(emphasize,
                 with: numberOfCharacters))



//: [Next](@next)
