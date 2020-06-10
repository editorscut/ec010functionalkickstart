//: [Previous](@previous)

optionalCardFromFreshDeck(at: 17)
optionalCardFromFreshDeck(at: 100)

let card17 = resultCardFromFreshDeck(at: 17)
let card100 = resultCardFromFreshDeck(at: 100)

card17
    .map(increment)

card100
    .map(increment)

struct IsEmpty: Error, CustomDebugStringConvertible {
    var debugDescription: String {
        "This is empty"
    }
}

typealias Trunk<Success> = Result<Success, IsEmpty>

extension Trunk where Failure == IsEmpty {
    init() {
        self = .failure(IsEmpty())
    }
    init(_ whatsInside: Success) {
        self = .success(whatsInside)
    }
}

let emptyTrunk = Trunk<String>()
let helloTrunk = Trunk("Hello")

emptyTrunk
    .map(emphasize)

emptyTrunk
    .map(emphasize)
    .map(numberOfCharacters)

helloTrunk
    .map(emphasize)

helloTrunk
    .map(emphasize)
    .map(numberOfCharacters)

helloTrunk
    <^> emphasize
    <^> numberOfCharacters
//: [Next](@next)
