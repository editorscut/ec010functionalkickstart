//: [Previous](@previous)
extension String: Monoid {
    public static var identity: String {
        ""
    }
    public static func <>(lhs: String, rhs: String) -> String {
        lhs + rhs
    }
}


let pointWriter
    = Writer<Point, String>(just: origin)

func loggingMoveRight(_ point: Point) -> Writer<Point, String> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
                  log: "Moved right from \(point) to \(movedPoint) \n")
}

func loggingMoveDown(_ point: Point) -> Writer<Point, String> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
                  log: "Moved down from \(point) to \(movedPoint) \n")
}

pointWriter
    .flatMap(loggingMoveRight)
    .flatMap(loggingMoveDown)

extension Array: Monoid {
    public static var identity: Array {
        Array()
    }
    public static func <>(lhs: Array, rhs: Array) -> Array {
        lhs + rhs
    }
}


let pointWriterArray
    = Writer<Point, [Point]>(just: origin)



func loggingMoveRightArray(_ point: Point) -> Writer<Point, [Point]> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
                  log: [movedPoint])
}

func loggingMoveDownArray(_ point: Point) -> Writer<Point, [Point]> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
                  log: [movedPoint])
}

pointWriterArray
    .flatMap(loggingMoveRightArray)
    .flatMap(loggingMoveDownArray)

func loggingCurrentLocationArray(_ point: Point) -> Writer<Point, [Point]> {
    return Writer(point,
                  log: [point])
}

pointWriterArray
    .flatMap(loggingCurrentLocationArray)
    .flatMap(loggingMoveRightArray)
    .flatMap(loggingMoveDownArray)


//: [Next](@next)
