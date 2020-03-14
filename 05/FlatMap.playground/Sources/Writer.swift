public struct Writer<Value> {
    public let value: Value
    public let log: String
}

extension Writer: CustomStringConvertible {
    public var description: String {
        "(value: \(value), \n log: \(log))"
    }
}

extension Writer {
    public func map<Output>(_ transform: (Value) -> Output)
        -> Writer<Output> {
            Writer<Output>(value: transform(value),
                           log: log)
    }
}


