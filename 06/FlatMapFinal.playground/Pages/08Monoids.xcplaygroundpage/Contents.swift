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
    = WriterM<Point, String>(just: origin)

func loggingMoveRight(_ point: Point) -> WriterM<Point, String> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return WriterM(movedPoint,
                  log: "Moved right from \(point) to \(movedPoint) \n")
}

func loggingMoveDown(_ point: Point) -> WriterM<Point, String> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return WriterM(movedPoint,
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
    = WriterM<Point, [Point]>(just: origin)



func loggingMoveRightArray(_ point: Point) -> WriterM<Point, [Point]> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return WriterM(movedPoint,
                  log: [movedPoint])
}

func loggingMoveDownArray(_ point: Point) -> WriterM<Point, [Point]> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return WriterM(movedPoint,
                  log: [movedPoint])
}

pointWriterArray
    .flatMap(loggingMoveRightArray)
    .flatMap(loggingMoveDownArray)

func loggingCurrentLocationArray(_ point: Point) -> WriterM<Point, [Point]> {
    return WriterM(point,
                  log: [point])
}

pointWriterArray
    .flatMap(loggingCurrentLocationArray)
    .flatMap(loggingMoveRightArray)
    .flatMap(loggingMoveDownArray)


//: [Next](@next)
