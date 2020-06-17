//: [Previous](@previous)

["Hello"].apply([numberOfCharacters])

[numberOfCharacters] <*> ["Hello"]

numberOfCharacters(in: "Hello")

func hello(_ f: (String) -> Int) -> Int {
    f("Hello")
}

[hello] <*> [numberOfCharacters]

[hello(numberOfCharacters)]

[numberOfCharacters] <*> ["Hello"]
== [{f in f("Hello")}] <*> [numberOfCharacters]


[helloToFahrenheit] <*> [numberOfCharacters]

[helloToFahrenheit] <*> [uniqueCharacters]

func stringToFahrenheit(_ f: @escaping (String) -> Int)
                                        -> (String) -> Double {
     {string in toFahrenheit(f(string))}
}

[stringToFahrenheit] <*> [numberOfCharacters]

[stringToFahrenheit]
    <*> [numberOfCharacters]
    <*> ["Hello"]


[stringToFahrenheit]
    <*> [numberOfCharacters]
    <*> ["This", "is", "amazing"]

[stringToFahrenheit]
    <*> [numberOfCharacters, uniqueCharacters]
    <*> ["This", "is", "amazing"]


//: [Next](@next)
