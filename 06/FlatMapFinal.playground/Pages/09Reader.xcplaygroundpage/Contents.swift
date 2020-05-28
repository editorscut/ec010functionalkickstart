//: [Previous](@previous)

let trunkWithPoint: Point? = origin

//let deltaX = 10
//let deltaY = 10
//let width = 20
//let height = 10

enum Environment {
    static let width = 20 //: Int { 20 }
    static let height = 10 //: Int { 10 }
    static let deltaX = 10 //: Int { 10 }
    static let deltaY = 10 //: Int { 10 }
}

//struct Environment {
//    let width: Int
//    let height: Int
//    let deltaX: Int
//    let deltaY: Int
//}

//func movingRightInTrunk(_ point: Point) -> Point? {
//    let movedPoint = Point(x: point.x + Environment.deltaX,
//                           y: point.y)
//    if movedPoint.x <= Environment.width {
//        return movedPoint
//    } else {
//        return nil
//    }
//}
//
//func movingDownInTrunk(_ point: Point) -> Point? {
//    let movedPoint = Point(x: point.x,
//                           y: point.y + Environment.deltaY)
//    if movedPoint.y <= Environment.height {
//        return movedPoint
//    } else {
//        return nil
//    }
//}

struct Trunk {
    let width: Int
    let height: Int
    let deltaX: Int
    let deltaY: Int
}

let trunk = Trunk(width: 20,
                  height: 10,
                  deltaX: 10,
                  deltaY: 10)


func movingRightInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x + trunk.deltaX,
                           y: point.y)
    if movedPoint.x <= trunk.width {
        return movedPoint
    } else {
        return nil
    }
}

func movingRight(_ point: Point, in trunk: Trunk) -> Point? {
    let movedPoint = Point(x: point.x + trunk.deltaX,
                           y: point.y)
    if movedPoint.x <= trunk.width {
        return movedPoint
    } else {
        return nil
    }
}

func movingDownInTrunk(_ point: Point) -> Point? {
    let movedPoint = Point(x: point.x,
                           y: point.y + trunk.deltaY)
    if movedPoint.y <= trunk.height {
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



func movingRightReader(_ point: Point?) -> Reader<Trunk, Point?> {
    guard let point = point else {
        return Reader<Trunk, Point?>{_ in nil}
    }
    return Reader<Trunk, Point?>{trunk in
        let movedPoint = Point(x: point.x + trunk.deltaX,
                               y: point.y)
        guard movedPoint.x <= trunk.width else {
            return nil
        }
        return movedPoint
    }
}


func movingDownReader(_ point: Point?) -> Reader<Trunk, Point?> {
    guard let point = point else {
        return Reader<Trunk, Point?>{_ in nil}
    }
    return Reader<Trunk, Point?>{trunk in
        let movedPoint = Point(x: point.x,
                               y: point.y + trunk.deltaY)
        guard movedPoint.y <= trunk.height else {
            return nil
        }
        return movedPoint
    }
}

func currentLocationReader(_ point: Point?) -> Reader<Trunk, Point?> {
    guard let point = point else {
        return Reader<Trunk, Point?>{_ in nil}
    }
    return Reader<Trunk, Point?>{trunk in
        guard point.x <= trunk.width &&
              point.y <= trunk.height else {
                return nil
        }
        return point
    }
}


let originReader
    = Reader<Trunk, Point?>(just: origin)

originReader
    .flatMap(currentLocationReader)
    .f(trunk)

originReader
    .flatMap(currentLocationReader)
    .flatMap(movingRightReader)
    .f(trunk)

originReader
    .flatMap(currentLocationReader)
    .flatMap(movingRightReader)
    .flatMap(movingDownReader)
    .f(trunk)

originReader
    .flatMap(currentLocationReader)
    .flatMap(movingRightReader)
    .flatMap(movingDownReader)
    .flatMap(movingDownReader)
    .f(trunk)



//: [Next](@next)
