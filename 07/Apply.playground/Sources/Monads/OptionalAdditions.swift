public func <^> <Input, Output>(xs: Input?,
                        f: (Input) -> Output) -> Output? {
    xs.map(f)
}

public func >=> <Input, Output>(xs: Input?,
                        f: (Input) -> Output?) -> Output? {
    xs.flatMap(f)
}

extension Optional {
    public init(just element: Wrapped) {
        self = .some(element)
    }
    
    public static func just(_ element: Wrapped) -> Self {
        .some(element)
    }
}

