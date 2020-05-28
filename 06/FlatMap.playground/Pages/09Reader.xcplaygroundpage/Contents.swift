//: [Previous](@previous)
let trunkWithPoint: Point? = origin

func movingRightInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x + 10,
                           y: point.y)
    if movedPoint.x <= 20 {
        return movedPoint
    } else {
        return nil
    }
}

func movingDownInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x,
                           y: point.y + 10)
    if movedPoint.y <= 10 {
        return movedPoint
    } else {
        return nil
    }
}

trunkWithPoint
    .flatMap(movingRightInTrunk)
    .flatMap(movingDownInTrunk)

trunkWithPoint
    .flatMap(movingRightInTrunk)
    .flatMap(movingDownInTrunk)
    .flatMap(movingDownInTrunk)


//: [Next](@next)
