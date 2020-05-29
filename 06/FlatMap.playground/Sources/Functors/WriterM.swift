public struct WriterM<Value> {
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

extension WriterM {
    public func map<Output>(_ transform: (Value) -> Output)
        -> WriterM<Output> {
            WriterM<Output>(transform(value),
                                log: log)
    }
}

extension WriterM {
    public func flatMap<Output>(_ transform: (Value) -> WriterM<Output>)
        -> WriterM<Output> {
            let newWriter = transform(value)
            let newLog = log + newWriter.log
            return WriterM<Output>(newWriter.value,
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
