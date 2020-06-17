public enum Validated<Valid, Invalid> where Invalid: Monoid {
    case valid(Valid)
    case invalid(Invalid)
}

extension Validated {
    public init(just element: Valid) {
        self = .valid(element)
    }
    
    public static func just(_ element: Valid) -> Self {
        .valid(element)
    }
}


extension Validated {
    public func map<Output>(_ transform: (Valid) -> Output) -> Validated<Output, Invalid> {
        switch self {
        case .invalid(let problem):
            return .invalid(problem)
        case .valid(let value):
            return .valid(transform(value))
        }
    }
}

public func <^> <Input, Output, Invalid: Monoid>(xs: Validated<Input, Invalid>,
                                                 f: (Input) -> Output) -> Validated<Output, Invalid> {
    xs.map(f)
}

extension Validated {
    public func apply<Output>(_ transform: Validated<(Valid) -> Output, Invalid>) -> Validated<Output, Invalid> {
        switch (transform, self) {
        case (.valid(let f), .valid(let x)):
            return Validated<Output, Invalid>.valid(f(x))
        case(.invalid(let functionError), .valid):
            return .invalid(functionError)
        case(.valid, .invalid(let valueError)):
            return .invalid(valueError)
        case(.invalid(let functionError), .invalid(let valueError)):
            return .invalid(functionError <> valueError)
        }
    }
}

public func <*> <Input, Output, Invalid: Monoid>(f: Validated<(Input) -> Output, Invalid>,
                                x: Validated<Input, Invalid>) -> Validated<Output, Invalid> {
    x.apply(f)
}
