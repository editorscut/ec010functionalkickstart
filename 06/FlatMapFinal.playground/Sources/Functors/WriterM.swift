public struct WriterM<Value, Log: Monoid> {
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

extension WriterM {
    public func map<Output>(_ transform: (Value) -> Output)
        -> WriterM<Output, Log> {
            WriterM<Output, Log>(transform(value),
                                log: log)
    }
}

extension WriterM {
    public func flatMap<Output>(_ transform: (Value) -> WriterM<Output, Log>)
        -> WriterM<Output, Log> {
            let newWriter = transform(value)
            let newLog = log <> newWriter.log
            return WriterM<Output, Log>(newWriter.value,
                                       log: newLog)
    }
}
extension WriterM: CustomStringConvertible {
    public var description: String {
        """
        value: \(value)
        log: \(log)
        """
    }
}
