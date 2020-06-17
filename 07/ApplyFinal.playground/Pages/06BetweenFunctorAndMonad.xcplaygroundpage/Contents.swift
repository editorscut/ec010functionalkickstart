//: [Previous](@previous)

let strings = ["exploring", "monads", "and", "functors"]

strings
    .map(numberOfCharacters)

strings
    .mapWithFlatMap(numberOfCharacters)

strings
    .mapWithApply(numberOfCharacters)

let noString: String? = nil
let helloString: String? = Optional(just: "Hello")

let noFunction: ((String) -> Int)? = nil
let countFunction: ((String) -> Int)? = Optional(just: numberOfCharacters)

noString
    .apply(noFunction)

noString
    .apply(countFunction)

helloString
    .apply(noFunction)

helloString
    .apply(countFunction)

noString
    .applyWithFlatMap(noFunction)

noString
    .applyWithFlatMap(countFunction)

helloString
    .applyWithFlatMap(noFunction)

helloString
    .applyWithFlatMap(countFunction)

noString
    .map(numberOfCharacters)

noString
    .mapWithFlatMap(numberOfCharacters)

noString
    .mapWithApply(numberOfCharacters)

helloString
    .map(numberOfCharacters)

helloString
    .mapWithFlatMap(numberOfCharacters)

helloString
    .mapWithApply(numberOfCharacters)

struct IsEmpty: Error {}

let failureString: Result<String, IsEmpty> = .failure(IsEmpty())
let successString: Result<String, IsEmpty> = .success("Hello")

failureString
    .map(numberOfCharacters)

failureString
    .mapWithFlatMap(numberOfCharacters)

successString
    .map(numberOfCharacters)

successString
    .mapWithFlatMap(numberOfCharacters)

let fs = [numberOfCharacters, uniqueCharacters]

strings
    .apply(fs)

strings
    .applyWithFlatMap(fs)

//: [Next](@next)
