//: [Previous](@previous)

func toF(_ c: Int) -> Double {
    Double(c) * 9 / 5 + 32
}

public func compose<A, B, C> (g: @escaping (B) -> C) ->
                           (@escaping (A) -> B) -> (A) -> C {
                            {(f: @escaping (A) -> B) in {x in g(f(x))}}
}

[compose] <*> [toF] <*> [numberOfCharacters] <*> ["Hello"]

[toF] <*> ([numberOfCharacters] <*> ["Hello"])

[numberOfCharacters] <*> ["Hello"]

[{f in
    f("Hello")}] <*> [numberOfCharacters]

//: [Next](@next)
