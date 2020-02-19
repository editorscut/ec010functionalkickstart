//: [Previous](@previous)

func line(m: Int,
          b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

line(m: 3, b: 2)(4)

let threeXplusTwo = line(m: 3, b: 2)
threeXplusTwo(4)

struct Line {
    let m: Int
    let b: Int
    
    func callAsFunction(x: Int) -> Int {
        m * x + b
    }
}

let fiveXplusFour = Line(m: 5, b: 4)
//fiveXplusFour.yForX(3)

fiveXplusFour.callAsFunction(x: 3)

fiveXplusFour(x: 3)

func sum(_ x: Int) -> (Int) -> Int {
    {y in x + y}
}

let fivePlus = sum(5)
fivePlus(3)

let eight = sum(5)(3)

//struct Sum {
//    let addend: Int
//    
//    func callAsFunction(_ x: Int) -> Int {
//        x + addend
//    }
//}
//
//let fourPlus = Sum(addend: 4)
//fourPlus(7)

struct Sum {
    func callAsFunction(_ x: Int, _ y: Int) -> Int {
        x + y
    }
}

let sum = Sum()
sum(5, 3)

//: [Next](@next)
