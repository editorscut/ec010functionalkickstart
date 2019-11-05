//: [Previous](@previous)

//func yFor(slope m: Int,
//          intercept b: Int,
//          x: Int) -> Int {
//    let y = m * x + b
//    return y
//}

//func numberOfCharacters(_ string: String) -> Int {
//    string.count
//}

//yFor(slope: 3, intercept: 2, x: 4)
//numberOfCharacters("Hello")

//: End setup

//func numberOfCharacters(_ string: String) -> Int {
//    string.count
//}

//let numberOfCharacters = {(string: String) -> Int in
//    string.count
//}

let numberOfCharacters: (String) -> Int

//numberOfCharacters = {string in
//    string.count
//}

numberOfCharacters = {
    $0.count
}

numberOfCharacters("Hello")

//func printAction() {
//    print("I was called")
//}

let printAction = { print("I was called") }

printAction()

//func yFor(slope m: Int,
//          intercept b: Int,
//          x: Int) -> Int {
//    let y = m * x + b
//    return y
//}

//let yFor = {(m: Int, b: Int, x: Int) -> Int in
//    let y = m * x + b
//    return y
//}

let yFor: (Int, Int, Int) -> Int

yFor = {
    let y = $0 * $2 + $1
    return y
}

yFor(3, 2, 4)

//: [Next](@next)
