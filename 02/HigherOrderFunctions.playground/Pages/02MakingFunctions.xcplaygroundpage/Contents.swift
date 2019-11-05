//: [Previous](@previous)

func yFor(slope m: Int,
          intercept b: Int,
          x: Int) -> Int {
    let y = m * x + b
    return y
}

yFor(slope: 3, intercept: 2, x: 4)
yFor(slope: 3, intercept: 2, x: 5)

//: End setup

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    func yValue(x: Int) -> Int {
        let y = m * x + b
        return y
    }
    return yValue
}

let threeXPlusTwo = line(slope: 3, intercept: 2)
threeXPlusTwo(4)
line(slope: 3, intercept: 2)(4)


//: [Next](@next)
