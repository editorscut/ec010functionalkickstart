//: [Previous](@previous)

let pointWriter = Writer(origin,
    log: "")

func loggingMoveRight(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    return Writer(movedPoint,
                  log: "Moved right from \(point) to \(movedPoint) \n")
}

func loggingMoveDown(_ point: Point) -> Writer<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    return Writer(movedPoint,
                  log: "Moved down from \(point) to \(movedPoint) \n")
}

//: [Next](@next)
