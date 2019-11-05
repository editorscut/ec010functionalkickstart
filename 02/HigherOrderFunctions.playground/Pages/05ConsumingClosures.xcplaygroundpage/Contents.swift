//: [Previous](@previous)

let threeXPlusTwo = {x in 3 * x + 2}

threeXPlusTwo(4)

func evaluate(_ x: Int,
              using f: (Int) -> Int) -> Int {
    f(x)
}

evaluate(4,
         using: threeXPlusTwo)

evaluate(4,
         using: {x in threeXPlusTwo(x)})

evaluate(4,
         using: {x in 3 * x + 2})

evaluate(4){x in 3 * x + 2}

evaluate(4){3 * $0 + 2}


//: [Next](@next)
