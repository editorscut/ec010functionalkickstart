//: [Previous](@previous)

func threeXPlusTwo(x: Int) -> Int {
    3 * x + 2
}

func squared(x: Int) -> Int {
    x * x
}

func evaluate<Input, Output>(_ x: Input,
                             using f: (Input) -> Output) -> Output {
    f(x)
}

func compose<A, B, C>(_ f: @escaping (A) -> B,
                      with g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}
//: End setup

precedencegroup Evaluate {
    associativity: left
}

precedencegroup Compose {
    associativity: left
    higherThan: Evaluate
}

infix operator |>: Evaluate

infix operator >>>: Compose

func |> <Input, Output>(x: Input,
                        f: (Input) -> Output) -> Output {
    f(x)
}

func >>> <A, B, C>(f: @escaping (A) -> B,
                   g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}

4 |> threeXPlusTwo

4 |> threeXPlusTwo |> squared

4 |> threeXPlusTwo >>> squared

4 |> {x in
    x * x - 1}

//: [Next](@next)
