public struct Writer<Value, Log: Monoid> {
    public let value: Value
    public let log: Log
    
    public init(_ value: Value, log: Log) {
        self.value = value
        self.log = log
    }
    
    public init(just value: Value) {
        self.value = value
        log = Log.identity
    }
}

extension Writer {
    public func map<Output>(_ transform: (Value) -> Output)
        -> Writer<Output, Log> {
            Writer<Output, Log>(transform(value),
                                log: log)
    }
}

extension Writer {
    public func flatMap<Output>(_ transform: (Value) -> Writer<Output, Log>)
        -> Writer<Output, Log> {
            let newWriter = transform(value)
            let newLog = log <> newWriter.log
            return Writer<Output, Log>(newWriter.value,
                                       log: newLog)
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
