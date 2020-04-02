public struct Covered<T> {
    public let item: T
}

extension Covered: CustomStringConvertible {
    public var description: String {
        "Covered \(item)"
    }
}
