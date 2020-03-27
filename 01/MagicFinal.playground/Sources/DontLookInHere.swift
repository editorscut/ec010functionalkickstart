// We'll explain this later so there's no need to look in here now

precedencegroup AndThen {
    associativity: left
    higherThan: ComparisonPrecedence
}

infix operator |>: AndThen

public func |><Input, Output>(x: Input,
                              f: (Input) -> Output) -> Output {
    f(x)
}
