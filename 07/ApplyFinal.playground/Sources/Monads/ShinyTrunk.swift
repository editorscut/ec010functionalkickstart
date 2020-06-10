public enum ShinyTrunk<WhatsInside> {
    case empty
    case containing(WhatsInside)
    
    public init() {
        self = .empty
    }
    
    public init(just whatsInside: WhatsInside) {
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
                return ShinyTrunk<Output>(just: transform(whatsInside))
            }
    }
}

public func <^> <Input, Output>(xs: ShinyTrunk<Input>,
                        f: (Input) -> Output) -> ShinyTrunk<Output> {
    xs.map(f)
}

extension ShinyTrunk {
    public func flatMap<Output>(_ transform: (WhatsInside) -> ShinyTrunk<Output>)
        -> ShinyTrunk<Output> {
            switch self {
            case .empty:
                return ShinyTrunk<Output>()
            case .containing(let whatsInside):
                return transform(whatsInside)
            }
    }
}

public func >=> <Input, Output>(xs: ShinyTrunk<Input>,
                        f: (Input) -> ShinyTrunk<Output>) -> ShinyTrunk<Output> {
    xs.flatMap(f)
}


extension ShinyTrunk {
    public func apply<Output>(_ transform: ShinyTrunk<(WhatsInside) -> Output>)
                                                        -> ShinyTrunk<Output> {
        switch (self, transform) {
        case let (.containing(point), .containing(f)):
            return ShinyTrunk<Output>(just: f(point))
        default:
            return ShinyTrunk<Output>()
        }
    }
}

public func <*> <Input, Output>(
    f: ShinyTrunk<(Input) -> Output>, x: ShinyTrunk<Input>)
                                          -> ShinyTrunk<Output> {
    x.apply(f)
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


