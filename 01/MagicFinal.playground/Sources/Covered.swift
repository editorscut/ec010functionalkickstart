public struct Covered<T> {
    public let item: T
}

extension Covered: CustomStringConvertible {
    public var description: String {
        "Covered \(item)"
    }
}

public func covered<T>(_ item: T) -> Covered<T> {
    Covered(item: item)
}

public func revealed<T>(_ covered: Covered<T> ) -> T {
    covered.item
}

public func revealed<T: CardCarrying>(_ covered: Covered<T> ) -> Card {
    covered.item.card
}

