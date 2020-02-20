var twos = [18, 8, 4, 10, 20, 12, 16, 2, 6, 14]

let threes = ["three", "six", "nine",
              "twelve", "eighteen", "fifteen"]

//: End setup

//twos.sort()
//
//twos

twos.sorted()
twos

//twos = twos.sorted()
//twos

twos.sort(by: >)

twos

threes.sorted()

let lengthSortedThrees
    = threes.sorted(by: {$0.count < $1.count})

lengthSortedThrees


//: [Next](@next)
