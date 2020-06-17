//: [Previous](@previous)

let strings = ["Apply", "is", "amazing"]

strings
    .apply([numberOfCharacters])

[numberOfCharacters] <*> strings

Array<(String) -> Int>(just: numberOfCharacters) <*> strings

let functions = [numberOfCharacters, uniqueCharacters]

strings.apply(functions)

functions <*> strings


func identity<T>(_ x: T) -> T {
    x
}

identity(5)

identity("hello")

["Apply", "is", "fun"].apply([identity]) == ["Apply", "is", "fun"]

[identity] <*> ["Apply", "is", "fun"] == ["Apply", "is", "fun"]

["hello"].apply([numberOfCharacters]) == [numberOfCharacters(in: "hello")]

[numberOfCharacters] <*> ["hello"] == [numberOfCharacters(in: "hello")]





//: [Next](@next)
