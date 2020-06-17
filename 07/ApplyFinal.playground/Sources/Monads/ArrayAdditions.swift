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

extension Array {
    public func mapWithFlatMap<Output>(_ transform: (Element) -> Output) -> [Output] {
        flatMap{x in Array<Output>(just: transform(x))}
    }
}
extension Array {
    public func mapWithApply<Output>(_ transform: @escaping (Element) -> Output) -> [Output] {
        apply(Array<(Element) -> Output>.just(transform))
    }
}

extension Array {
    public func applyWithFlatMap<Output>(_ transforms: [(Element) -> Output]) -> [Output] {
        transforms.flatMap{f in self.map{x in f(x)}}
    }
}

extension Array {
    public func altApply<Output>(_ transforms: [(Element) -> Output]) -> [Output] {
        zip(transforms, self).map{(f, x) in f(x)}
    }
}
