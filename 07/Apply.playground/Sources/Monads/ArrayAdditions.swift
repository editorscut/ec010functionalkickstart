public func <^> <Input, Output>(xs: Array<Input>,
                        f: (Input) -> Output) -> Array<Output> {
    xs.map(f)
}

public func >=> <Input, Output>(xs: Array<Input>,
                        f: (Input) -> Array<Output>) -> Array<Output> {
    xs.flatMap(f)
}
