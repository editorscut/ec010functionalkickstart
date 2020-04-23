//: [Previous](@previous)

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

func fiveXMinusSeven(_ x: Int) -> Int {
    5 * x - 7
}

let threeXPlusTwo = {x in 3 * x + 2}

func evaluate(_ x: Int,
              using f: (Int) -> Int) -> Int {
    f(x)
}

fiveXMinusSeven(10)

evaluate(10,
         using: fiveXMinusSeven)

evaluate(4,
         using: threeXPlusTwo)

evaluate(10,
         using: {x in fiveXMinusSeven(x)})

evaluate(10,
         using: {x in threeXPlusTwo(x)})

evaluate(10,
         using: {x in 3 * x + 2})

evaluate(4, using: line(slope: 3,
                        intercept: 2))


//: [Next](@next)
