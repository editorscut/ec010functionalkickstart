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

func add(_ x: Int, and y: Int) -> Int {
    x + y
}

extension Int {
    func add(_ y: Int) -> Int {
        self + y
    }
}

add(3, and: 5)
(3, 5) |> add
3.add(5)

evaluate((3, 5), using: add)






//: [Next](@next)
