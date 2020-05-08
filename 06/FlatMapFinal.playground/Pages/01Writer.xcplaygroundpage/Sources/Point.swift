public let origin = Point(x: 0, y: 0)

public struct Point {
    public let x, y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Point: CustomStringConvertible {
    public var description: String {
        "(\(x), \(y))"
    }
}

public func moveRight(_ point: Point) -> Point {
    Point(x: point.x + 10, y: point.y)
}
