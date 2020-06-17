
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

