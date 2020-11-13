//: [Previous](@previous)

struct StringFunction<A> {
  let f: (String) -> A
  
  func callAsFunction(_ string: String) -> A {
      f(string)
  }
}

extension StringFunction {
  func map<B>(_ transform: @escaping (A) -> B)
                                         -> StringFunction<B> {
    StringFunction<B>{x in transform(self.f(x))}
  }
}

let exclaim = StringFunction{string in string + "!"}

exclaim.f("Hello")

let count = StringFunction{string in string.count}

count.f("Hello")

let bonusSizeOf
    = exclaim.map{string in string.count}

bonusSizeOf.f("Hello")

let boolFrom
    = exclaim
        .map{string in string.count}
        .map{int in int.isMultiple(of: 2) ? false : true}

boolFrom.f("Hello")

exclaim("Hello")
bonusSizeOf("Hello")
boolFrom("Hello")


//: [Next](@next)
