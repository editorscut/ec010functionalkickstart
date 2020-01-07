//: [Previous](@previous)

func yFor(slope m: Int,
          intercept b: Int,
          x: Int) -> Int {
     m * x + b
}


func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

yFor(slope: 3, intercept: 2, x: 4)

line(slope: 3, intercept: 2)(4)

func add(_ x: Int, and y: Int) -> Int {
    x + y
}

//: End setup

add(5, and: 3)


func add(_ x: Int) -> (Int) -> Int {
    {y in x + y}
}

add(5)(3)

func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    {x in {y in f(x, y)}}
}

let curriedAdd = curry(add)
curriedAdd(5)(3)

func greet(_ name: String, numberOfTimes: Int) -> String {
    var greeting = ""
    for _ in 1...numberOfTimes {
        greeting += "Hello, \(name)! \n"
    }
    return greeting
}

let curriedGreet = curry(greet)

curriedGreet("Swift")(3)


//: [Next](@next)
