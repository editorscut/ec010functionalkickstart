//: [Previous](@previous)

func emphasize(_ string: String) -> String {
    if string.isEmpty {return ""} else {
        return string.uppercased() + "!"
    }
}

func numberOfCharacters(in string: String) -> Int {
    string.count
}

//: End setup

struct Writer<Value> {
    let value: Value
    let log: String
}

extension Writer: CustomStringConvertible {
    var description: String {
        """
        value: \(value)
        log: \(log)
        """
    }
}

let emptyTrunk = Writer(value: "",
                        log: "Initially contains an empty String")

let helloTrunk = Writer(value: "Hello",
                        log: "Initially contains the String: 'Hello'")

extension Writer {
    func map<Output>(_ transform: (Value) -> Output)
        -> Writer<Output> {
            Writer<Output>(value: transform(value),
                           log: log)
    }
}

helloTrunk
    .map(emphasize)

helloTrunk
    .map(emphasize)
    .map(numberOfCharacters)

emptyTrunk
    .map(emphasize)

emptyTrunk
    .map(emphasize)
    .map(numberOfCharacters)






//: [Next](@next)
