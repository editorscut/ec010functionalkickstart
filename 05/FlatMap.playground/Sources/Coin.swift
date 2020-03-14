public enum Coin: String {
    case heads
    case tails
}

extension Coin: CustomStringConvertible {
    public var description: String {
        rawValue.uppercased()
    }
    
    
}
