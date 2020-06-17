precedencegroup Evaluate {
    associativity: left
    higherThan: ComparisonPrecedence
}

infix operator |> : Evaluate


public func |> <Input, Output>(x: Input,
                        f: (Input) -> Output) -> Output {
    f(x)
}

precedencegroup Compose {
    associativity: left
    higherThan: Evaluate
}

infix operator >>> : Compose

public func >>> <A, B, C> (f: @escaping (A) -> B,
                           g: @escaping (B) -> C) -> (A) -> C {
    {x in g(f(x))}
}



infix operator <^> : Evaluate  // map

infix operator >=> : Evaluate  // flatMap

infix operator <*> : Evaluate  // apply
