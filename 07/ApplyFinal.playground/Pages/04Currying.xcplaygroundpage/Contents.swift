//: [Previous](@previous)

func stringToFahrenheit(_ string: String,
                        using f: (String) -> Int) -> Double {
    toFahrenheit(f(string))
}

func stringToFahrenheit(_ f: @escaping (String) -> Int)
                                        -> (String) -> Double {
    {string in toFahrenheit(f(string))}
}


helloToFahrenheit(numberOfCharacters)

stringToFahrenheit("Hello",
                   using: numberOfCharacters)

let strings = ["Currying", "is", "fundamental"]

strings
    .map(numberOfCharacters)

strings
    .map(numberOfCharacters)
    .map(toFahrenheit)

//strings
//    .map(stringToFahrenheit)

strings
    .map{string in stringToFahrenheit(string,
                                      using: numberOfCharacters)}

strings
    .map(numberOfCharacters >>> toFahrenheit)

stringToFahrenheit(numberOfCharacters)("Hello")

let stringToDouble = stringToFahrenheit(numberOfCharacters)

stringToDouble("Hello")

[stringToFahrenheit]
    <*> [numberOfCharacters]
    <*> ["Hello"]

[stringToFahrenheit]
    <*> [numberOfCharacters, uniqueCharacters]
    <*> ["This", "is", "amazing"]

func compose<A, B, C> (_ f: @escaping (A) -> B,
                       with g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

let composedStringToDouble = compose(numberOfCharacters,
                                     with: toFahrenheit)

composedStringToDouble("Hello")

strings.map(composedStringToDouble)

[composedStringToDouble] <*> strings

func compose<A, B, C> (_ g: @escaping (B) -> C) ->
    (@escaping (A) -> B) -> (A) -> C {
        {(f: @escaping (A) -> B) in {x in g(f(x))}}
}

[compose]
    <*> [toFahrenheit]
    <*> [numberOfCharacters, uniqueCharacters]
    <*> strings

[numberOfCharacters, uniqueCharacters] <*> strings


[toFahrenheit]
    <*> ([numberOfCharacters, uniqueCharacters] <*> strings)


//: [Next](@next)
