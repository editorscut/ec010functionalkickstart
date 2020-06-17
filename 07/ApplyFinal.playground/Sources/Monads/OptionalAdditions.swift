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

extension Optional {
    public func apply<Output>(_ transform: ((Wrapped) -> Output)?)
                                                          -> Output? {
        guard let transform = transform,
            let self = self else {return nil}
        return transform(self)
    }
}

public func <*> <Input, Output>(fs: ((Input) -> Output)?,
                                xs: Input?) -> Output? {
    xs.apply(fs)
}

extension Optional {
    public func mapWithFlatMap<Output>(_ transform: (Wrapped) -> Output) -> Output? {
        flatMap{x in Optional<Output>(just: transform(x))}
    }
}

extension Optional {
    public func mapWithApply<Output>(_ transform: @escaping (Wrapped) -> Output) -> Output? {
        apply(Optional<(Wrapped) -> Output>.just(transform))
    }
}

extension Optional {
    public func applyWithFlatMap<Output>(_ transform: ((Wrapped) -> Output)?) -> Output? {
        transform.flatMap{f in self.map{x in f(x)}}
    }
}
