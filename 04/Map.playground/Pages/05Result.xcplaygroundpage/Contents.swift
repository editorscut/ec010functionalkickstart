//: [Previous](@previous)
let rawFive = "5"
let rawSix = "six"

func emphasize(_ string: String) -> String {
    string.uppercased() + "!"
}

func numberOfCharacters(in string: String) -> Int {
    string.count
}

//: End setup


let five = Int("5")
let six = Int("six")

// example of how Result might be implemented
enum MyResult<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}

extension MyResult {
    func map<Output>(_ transform: (Success) -> Output)
        -> MyResult<Output, Failure> {
            switch self {
            case .success(let success):
                return .success(transform(success))
            case .failure(let failure):
                return .failure(failure)
            }
    }
}

struct IsEmpty: Error, CustomDebugStringConvertible {
    var debugDescription: String {
        return "This is empty."
    }
}

//let emptyTrunk = Result<String, IsEmpty>.failure(IsEmpty())
//let helloTrunk = Result<String, IsEmpty>.success("Hello")

typealias Trunk<Success> = Result<Success, IsEmpty>

//let emptyTrunk = Trunk<String>.failure(IsEmpty())
//let helloTrunk = Trunk.success("Hello")

extension Result where Failure == IsEmpty {
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




//: [Next](@next)
