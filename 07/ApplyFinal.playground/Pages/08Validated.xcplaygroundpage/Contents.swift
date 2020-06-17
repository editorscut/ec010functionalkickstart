//: [Previous](@previous)

let validString: Validated<String, String>
    = Validated(just: "Press Here")

let invalidString: Validated<String, String>
    = .invalid("No string ")


validString
    .map(numberOfCharacters)

invalidString
    .map(numberOfCharacters)

let validFunction: Validated<(String) -> Int, String>
    = Validated(just: numberOfCharacters)
let invalidFunction: Validated<(String) -> Int, String>
    = .invalid("No function ")

validFunction <*> validString

invalidFunction <*> validString

validFunction <*> invalidString

invalidFunction <*> invalidString

let buttonMaker: Validated<(String) -> (@escaping () -> Void)
                                                     -> SimpleButton, [String]>
    = Validated(just: simpleButton)

let validMessage: Validated<String, [String]>
    = Validated(just: "Press Here")

let invalidMessage: Validated<String, [String]>
    = .invalid(["No title"])

let validAction: Validated<() -> Void, [String]>
    = Validated(just: {print("Tapped")})

let invalidAction: Validated<() -> Void, [String]>
    = .invalid(["No function"])

buttonMaker <*> validMessage <*> validAction

buttonMaker <*> invalidMessage <*> validAction

buttonMaker <*> validMessage <*> invalidAction

buttonMaker <*> invalidMessage <*> invalidAction

let fs = [numberOfCharacters, uniqueCharacters]
let strings = ["A", "variation", "on", "apply"]

strings.apply(fs)

strings.applyWithFlatMap(fs)

strings.altApply(fs)


//: [Next](@next)
