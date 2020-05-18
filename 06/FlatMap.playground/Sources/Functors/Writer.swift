public struct Writer<Value> {
    public let value: Value
    public let log: String
    
    public init(_ value: Value, log: String) {
        self.value = value
        self.log = log
    }
}

extension Writer {
    public func map<Output>(_ transform: (Value) -> Output)
                                   -> Writer<Output> {
        Writer<Output>(transform(value),
               log: log)
    }
}

extension Writer: CustomStringConvertible {
    public var description: String {
        """
        value: \(value)
        log: \(log)
        """
    }
}
