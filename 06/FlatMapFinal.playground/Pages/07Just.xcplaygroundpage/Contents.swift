//: [Previous](@previous)

//Array(5)
//Array("five")

[5]
["five"]

extension Array {
    static func just(_ element: Element) -> Self {
        [element]
    }
}

Array.just(5)
Array.just("five")

extension Array {
    init (just element: Element) {
        self = [element]
    }
}

Array(just: 5)
Array(just: "five")

extension Array {
    init (_ element: Element) {
        self = [element]
    }
}

Array(5)
Array("five")

extension Optional {
    static func just(_ wrapped: Wrapped) -> Self {
        .some(wrapped)
    }
}

Optional.just(5)
Optional.just("five")

extension Optional {
    init (_ wrapped: Wrapped) {
        self = .some(wrapped)
    }
}

Optional.init(5)
Optional.init("five")

func f(_ string: String) -> Int {
    string.count
}

strings.map(f)


func g(_ string: String) -> [Int] {
    [string.count]
}

strings.map(g)
strings.flatMap(g)

strings.map(f) == strings.flatMap(g)

strings.map(f)
    == strings.flatMap{Array.just(f($0))}

g("Hello") == ["Hello"].flatMap(g)

g("Hello") == "Hello" >=> g

let strings = ["Swift", "is", "fun"]


strings.flatMap(Array.just) == strings


func h(_ int: Int) -> [Double] {
    [Double(int), Double(int) * 9 / 5 + 32]
}

strings.flatMap(g).flatMap(h)

strings.flatMap(g).flatMap(h)
    == strings.flatMap{x in g(x).flatMap(h)}

strings >=> g >=> h

strings >=> g >=> h
    == strings >=> {x in g(x) >=> h}





//: [Next](@next)
