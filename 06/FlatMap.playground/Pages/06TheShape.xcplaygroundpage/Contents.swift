//: [Previous](@previous)

extension Array {
    func myMap<Output>(_ transform: (Element) -> Output) -> [Output] {
        var result = [Output]()
        for element in self {
            result.append(transform(element))
        }
        return result
    }
    
    func myFlatMap<Output>(_ transform: (Element) -> [Output]) -> [Output]{
        var result = [Output]()
        for element in self {
            result.append(contentsOf: transform(element))
        }
        return result
    }
}

extension Optional {
    func myMap<Output>(_ transform: (Wrapped) -> Output) -> Output? {
        switch self {
        case .none: return .none
        case .some(let value): return .some(transform(value))
        }
    }
    func myFlatMap<Output>(_ transform: (Wrapped) -> Output?) -> Output? {
        switch self {
        case .none: return .none
        case .some(let value): return transform(value)
        }
    }
}


//: [Next](@next)
