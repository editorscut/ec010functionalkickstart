
public func <^> <Input, Output, Failure: Error>(xs: Result<Input, Failure>,
                                                 f: (Input) -> Output) -> Result<Output, Failure> {
    xs.map(f)
}

public func >=> <Input, Output, Failure>(xs: Result<Input, Failure>,
                                         f: (Input) -> Result<Output, Failure>) -> Result<Output, Failure> {
    xs.flatMap(f)
}

extension Result {
    public init(just element: Success) {
        self = .success(element)
    }
    
    public static func just(_ element: Success) -> Self {
        .success(element)
    }
}

extension Result {
    public func apply<Output>(_ transform: Result<(Success) -> Output, Failure>) -> Result<Output, Failure> {
        switch (transform, self) {
        case (.success(let f), .success(let x)):
            return Result<Output, Failure>.success(f(x))
        case(.failure(let functionError), _):
            return .failure(functionError)
        case(_, .failure(let valueError)):
            return .failure(valueError)
        }
    }
}

public func <*> <Input, Output, Failure: Error>(f: Result<(Input) -> Output, Failure>,
                                x: Result<Input, Failure>) -> Result<Output, Failure> {
    x.apply(f)
}

extension Result {
    public func mapWithFlatMap<Output>(_ transform: (Success) -> Output)
        -> Result<Output, Failure> {
            flatMap{x in Result<Output, Failure>(just: transform(x))}
    }
}

extension Result {
    public func mapWithApply<Output>(_ transform: @escaping (Success) -> Output) -> Result<Output, Failure> {
        apply(Result<(Success) -> Output, Failure>.just(transform))
    }
}

extension Result {
    public func applyWithFlatMap<Output>(_ transform: Result<(Success) -> Output, Failure>) -> Result<Output, Failure> {
        transform.flatMap{f in self.map{x in f(x)}}
    }
}

