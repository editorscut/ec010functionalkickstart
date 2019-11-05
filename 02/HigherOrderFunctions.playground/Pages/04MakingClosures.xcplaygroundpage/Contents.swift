//: [Previous](@previous)


//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    func yValue(x: Int) -> Int {
//        let y = m * x + b
//        return y
//    }
//    return yValue
//}

//: End setup

//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    func yValue(x: Int) -> Int {
//        let y = m * x + b
//        return y
//    }
//    return yValue
//}

//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    func yValue(x: Int) -> Int {
//        m * x + b
//    }
//    return yValue
//}

//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    let yValue = {(x: Int) -> Int in
//        m * x + b
//    }
//    return yValue
//}

//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    {(x: Int) -> Int in
//        m * x + b
//    }
//}

//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    {x in m * x + b}
//}

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    {m * $0 + b}
}



//: [Next](@next)
