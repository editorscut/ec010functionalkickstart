//: [Previous](@previous)

func line(m: Int,
          b: Int) -> (Int) -> Int {
    {x in m * x + b}
}

line(m: 3, b: 2)(4)

let threeXplusTwo = line(m: 3, b: 2)
threeXplusTwo(4)



//: [Next](@next)
