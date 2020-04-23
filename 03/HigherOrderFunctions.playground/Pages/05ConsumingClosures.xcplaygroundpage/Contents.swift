//: [Previous](@previous)

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

func fiveXMinusSeven(_ x: Int) -> Int {
    5 * x - 7
}

let threeXPlusTwo = {x in 3 * x + 2}

//: [Next](@next)
