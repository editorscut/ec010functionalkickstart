public enum Trunk<WhatsInside> {
    case empty
    case containing(WhatsInside)
}

extension Trunk: CustomStringConvertible {
    public var description: String {
        let type = WhatsInside.self
        switch (self) {
        case .empty:
            return "Trunk with no \(type)"
        case .containing(let whatsInside):
            return "Trunk containing the \(type): \(whatsInside)"
        }
    }
}


extension Trunk {
    public func map<Output>(_ transform: (WhatsInside) -> Output) -> Trunk<Output> {
        switch self {
        case .empty:
            return Trunk<Output>.empty
        case .containing(let whatsInside):
            return Trunk<Output>.containing(transform(whatsInside))
        }
    }
}

