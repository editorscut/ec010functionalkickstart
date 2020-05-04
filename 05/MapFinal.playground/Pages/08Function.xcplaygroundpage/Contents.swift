//: [Previous](@previous)

struct StringFunction<FunctionRange> {
    let f: (String) -> FunctionRange
    
    func callAsFunction(_ string: String) -> FunctionRange {
        f(string)
    }
}

extension StringFunction {
    func map<Output>(_ transform: @escaping (FunctionRange) -> Output)
                                    -> StringFunction<Output> {
        StringFunction<Output>{x in transform(self.f(x))}
    }
}

let exclaim
    = StringFunction{string in string + "!"}

exclaim
    .f("Hello")

let countCharacters
    = StringFunction{string in string.count}

countCharacters
    .f("Hello")

let bonusSizeOf
    = exclaim
        .map{string in string.count}

bonusSizeOf
    .f("Hello")

let boolFrom
    = exclaim
        .map{string in string.count}
        .map{int in int.isMultiple(of: 2) ? false : true}


boolFrom
    .f("Hello")

exclaim("Hello")

bonusSizeOf("Hello")

boolFrom("Hello")

//: [Next](@next)
