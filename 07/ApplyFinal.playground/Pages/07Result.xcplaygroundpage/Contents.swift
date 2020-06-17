//: [Previous](@previous)

extension String: Error {}

let successString: Result<String, String> = .success("Hello")
let failureString: Result<String, String> = .failure("No string")

let successFunction: Result<(String) -> Int, String> = .success(numberOfCharacters)
let failureFunction: Result<(String) -> Int, String> = .failure("No function")


successString
    .applyWithFlatMap(successFunction)

successString
    .applyWithFlatMap(failureFunction)

failureString
    .applyWithFlatMap(successFunction)

failureString
    .applyWithFlatMap(failureFunction)

successString
    .apply(successFunction)

successString
    .apply(failureFunction)

failureString
    .apply(successFunction)

failureString
    .apply(failureFunction)

successString
    .mapWithApply(numberOfCharacters)

failureString
    .mapWithApply(numberOfCharacters)


//: [Next](@next)
