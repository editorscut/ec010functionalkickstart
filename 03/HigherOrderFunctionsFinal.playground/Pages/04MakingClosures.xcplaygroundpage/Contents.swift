//: [Previous](@previous)

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

func line(slope m: Int,
          intercept b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

let threeXPlusTwo = line(slope: 3, intercept: 2)

threeXPlusTwo(4)

line(slope: 3, intercept: 2)(4)

//func curriedLine(_ m: Int) -> (Int) -> (Int) -> Int {
//    {b in
//        {x in
//            m * x + b
//        }
//    }
//}

let curriedLine: (Int) -> (Int) -> (Int) -> Int
= {m in
        {b in
            {x in
                m * x + b
            }
        }
   }

curriedLine(3)(5)(4)





//func line(slope m: Int,
//          intercept b: Int) -> (Int) -> Int {
//    {m * $0 + b}
//}

//: [Next](@next)
