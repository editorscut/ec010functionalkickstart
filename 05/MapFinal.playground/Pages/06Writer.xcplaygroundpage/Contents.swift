//: [Previous](@previous)

struct Writer<Value> {
    let value: Value
    let log: String
}

extension Writer {
    func map<Output>(_ transform: (Value) -> Output)
                                   -> Writer<Output> {
        Writer<Output>(value: transform(value),
               log: log)
    }
}

extension Writer: CustomStringConvertible {
    var description: String {
        """
        value: \(value)
        log: \(log)
        """
    }
}

let helloTrunk
    = Writer(value: "Hello",
             log: "Initially contains the String: 'Hello'")

let emptyTrunk
    = Writer(value: "",
             log: "Initially contains an empty String")

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
