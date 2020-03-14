public struct MagicHat<Contents> {
    let contents: Contents
}
extension MagicHat: CustomStringConvertible {
    public var description: String {
        "Magic hat containing \(contents)"
    }
}

extension MagicHat {
    public func map<Output>(_ transform: (Contents) -> Output)
                                            -> MagicHat<Output> {
        MagicHat<Output>(contents: transform(contents))
    }
}
