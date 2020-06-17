public func moveRight(_ point: Point) -> Point {
    Point(x: point.x + 10,
          y: point.y)
}

public func moveDown(_ point: Point) -> Point {
    Point(x: point.x,
          y: point.y + 10)
}

public func movingRightInTrunk(_ point: Point) -> ShinyTrunk<Point> {
    let movedPoint = Point(x: point.x + 10, y: point.y)
    if movedPoint.x <= 20 {
        return ShinyTrunk(just: movedPoint)
    } else {
        return ShinyTrunk<Point>.empty
    }
}

public func movingDownInTrunk(_ point: Point) -> ShinyTrunk<Point> {
    let movedPoint = Point(x: point.x, y: point.y + 10)
    if movedPoint.y <= 10 {
        return ShinyTrunk(just: movedPoint)
    } else {
        return ShinyTrunk<Point>.empty
    }
}

public func numberOfCharacters(in string: String) -> Int {
    string.count
}

public func uniqueCharacters(in string: String) -> Int {
    Set(string).count
}


