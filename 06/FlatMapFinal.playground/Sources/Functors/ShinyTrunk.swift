public enum ShinyTrunk<WhatsInside> {
    case empty
    case containing(WhatsInside)
    
    public init() {
        self = .empty
    }
    
    public init(containing whatsInside: WhatsInside) {
        self = .containing(whatsInside)
    }
}

extension ShinyTrunk {
    public func map<Output>(_ transform: (WhatsInside) -> Output)
        -> ShinyTrunk<Output> {
            switch self {
            case .empty:
                return ShinyTrunk<Output>()
            case .containing(let whatsInside):
                return ShinyTrunk<Output>(containing: transform(whatsInside))
            }
    }
}

extension ShinyTrunk: CustomStringConvertible {
    public var description: String {
        let type = WhatsInside.self
        switch (self) {
        case .empty:
            return "Empty ShinyTrunk<\(type)>"
        case .containing(let whatsInside):
            return "ShinyTrunk<\(type)> containing \(whatsInside)"
        }
    }
}
