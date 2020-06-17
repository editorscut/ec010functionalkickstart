public func <^> <Input, Output>(xs: [Input],
                                f: (Input) -> Output) -> [Output] {
    xs.map(f)
}

public func >=> <Input, Output>(xs: [Input],
                                f: (Input) -> [Output]) -> [Output] {
    xs.flatMap(f)
}

extension Array {
    public init(just element: Element) {
        self = [element]
    }
    
    public static func just(_ element: Element) -> Self {
        [element]
    }
}

