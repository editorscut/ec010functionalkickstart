public struct Writer<Value> {
    public let value: Value
    public let log: String
    
    public init(_ value: Value, log: String) {
        self.value = value
        self.log = log
    }
    
    public init(just value: Value) {
        self.value = value
        log = ""
    }
}

extension Writer {
    public func map<Output>(_ transform: (Value) -> Output)
        -> Writer<Output> {
            Writer<Output>(transform(value),
                                log: log)
    }
}

public func <^> <Input, Output>(xs: Writer<Input>,
                        f: (Input) -> Output) -> Writer<Output> {
    xs.map(f)
}

extension Writer {
    public func flatMap<Output>(_ transform: (Value) -> Writer<Output>)
        -> Writer<Output> {
            let newWriter = transform(value)
            let newLog = log + newWriter.log
            return Writer<Output>(newWriter.value,
                                       log: newLog)
    }
}

public func >=> <Input, Output>(x: Writer<Input>,
                        f: (Input) -> Writer<Output>) -> Writer<Output> {
    x.flatMap(f)
}
extension Writer: CustomStringConvertible {
    public var description: String {
        """
        value: \(value)
        log: \(log)
        """
    }
}
