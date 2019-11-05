//: [Previous](@previous)

//func evaluate(_ x: Int,
//              using f: (Int) -> Int) -> Int {
//    f(x)
//}
//
//evaluate(4){x in 3 * x + 2}

//: End setup

func evaluate<Input, Output>(_ x: Input,
                             using f: (Input) -> Output) -> Output {
    f(x)
}

func compose<A, B, C>(_ f: @escaping (A) -> B,
                      with g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

evaluate("Hello"){string in
    string.count
}

let a = evaluate(4){x in
    3 * x + 2
}

let b = evaluate(3.5){x in
    3 * x + 2
}

let c = evaluate(4){(x: Double) in
    3 * x + 2
}

let h = compose({x in 3 * x + 2},
                with: {y in y * y})

h(4)

//: [Next](@next)
