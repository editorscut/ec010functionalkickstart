//: [Previous](@previous)

struct Reader<E, A> {
  let f: (E) -> A
}

extension Reader {
  func map<B>(_ transform: @escaping (A) -> B) -> Reader<E, B> {
    Reader<E, B>{e in transform(self.f(e))}
  }
}

 
//: [Next](@next)
