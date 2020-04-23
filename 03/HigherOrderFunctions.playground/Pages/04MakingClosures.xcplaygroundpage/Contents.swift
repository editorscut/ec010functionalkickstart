//: [Previous](@previous)

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    func yValue(x: Int) -> Int {
        let y = m * x + b
        return y
    }
    return yValue
}

//: [Next](@next)
