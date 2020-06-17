infix operator <> : AdditionPrecedence


// Note id is the identity.
// For any x in Self
// identity <> x == x <> identity == x

// <> is a binary operator which must be associative
// (a <> b) <> c == a <> (b <> c)

public protocol Monoid {
    static var identity: Self {get}
    static func <> (lhs: Self, rhs: Self) -> Self
}


extension String: Monoid {
    public static var identity: String {""}
    public static func <>(lhs: String, rhs: String) -> String {
        lhs + rhs
    }
}

extension Array: Monoid {
    public static var identity: Array {Self()}
    public static func <>(lhs: Array, rhs: Array) -> Array {
        lhs + rhs
    }
}
