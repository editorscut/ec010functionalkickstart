//: [Previous](@previous)

struct Reader<E, A> {
  let f: (E) -> A
}

extension Reader {
  static func just(_ a: A) -> Self {
      Self{_ in a}
  }
  
  init(just a: A) {
    f = {_ in a}
  }
}

extension Reader {
  func map<B>(_ transform: @escaping (A) -> B) -> Reader<E, B> {
    Reader<E, B>{e in transform(self.f(e))}
  }
}

extension Reader {
  func flatMap<B>(_ transform: @escaping (A) -> Reader<E, B>)
                                             -> Reader<E, B> {
    Reader<E, B>{e in transform(self.f(e)).f(e)}
  }
}

struct Trunk {
  let width: Int
  let height: Int
  let stepSize: Int
}


let standardTrunk
  = Trunk(width: 20,
          height: 10,
          stepSize: 10)

let exerciseTrunk
  = Trunk(width: 100,
          height: 100,
          stepSize: 1)

let originReader
  = Reader<Trunk, Point?>.just(origin)

originReader.f(standardTrunk)

let tenTenReader
  = Reader<Trunk, Point?>(just: Point(x: 10, y: 10))

tenTenReader.f(exerciseTrunk)

func movedRight(_ point: Point?) -> Reader<Trunk, Point?> {
  guard let point = point else {
    return Reader<Trunk, Point?>{_ in nil}
  }
  return Reader<Trunk, Point?>{trunk in
    let movedPoint = Point(x: point.x + trunk.stepSize,
                           y: point.y)
    guard movedPoint.x <= trunk.width else {
      return nil
    }
    return movedPoint
  }
}


func movedDown(_ point: Point?) -> Reader<Trunk, Point?> {
  guard let point = point else {
    return Reader<Trunk, Point?>{_ in nil}
  }
  return Reader<Trunk, Point?>{trunk in
    let movedPoint = Point(x: point.x,
                           y: point.y + trunk.stepSize)
    guard movedPoint.y <= trunk.height else {
      return nil
    }
    return movedPoint
  }
}


originReader
  .flatMap(movedRight)
  .f(standardTrunk)

originReader
  .flatMap(movedRight)
  .flatMap(movedDown)
  .f(standardTrunk)

originReader
  .flatMap(movedRight)
  .f(exerciseTrunk)

originReader
  .flatMap(movedRight)
  .flatMap(movedDown)
  .f(exerciseTrunk)

originReader
  .flatMap(movedRight)
  .flatMap(movedDown)
  .flatMap(movedDown)
  .f(exerciseTrunk)

originReader
  .flatMap(movedRight)
  .flatMap(movedDown)
  .flatMap(movedDown)
  .f(standardTrunk)




//: [Next](@next)
