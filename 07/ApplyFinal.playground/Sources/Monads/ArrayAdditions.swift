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
}

extension Array {
    public func apply<Output>(_ transforms: [(Element) -> Output])
                                                          -> [Output] {
        var result = [Output]()
        for transform in transforms {
            for element in self {
                result.append(transform(element))
            }
        }
        return result
    }
}

public func <*> <Input, Output>(fs: [(Input) -> Output],
                                xs: [Input]) -> [Output] {
    xs.apply(fs)
}
