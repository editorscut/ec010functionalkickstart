//: [Previous](@previous)


//: End setup



struct StringFunction<Range> {
    let f: (String) -> Range
    
    func callAsFunction(_ string: String) -> Range {
        f(string)
    }
}

//let emphasize
//    = StringFunction(f: {string in
//                            string + "!"
//                    })

let emphasize = StringFunction{string in string + "!"}

//let emphasize = StringFunction{$0 + "!"}


emphasize
    .f("Hello")

extension StringFunction {
    func map<Output>(_ transform: @escaping (Range) -> Output)
                                    -> StringFunction<Output> {
        StringFunction<Output>{x in transform(self(x))}
    }
}



let sizeOf
    = emphasize
        .map{$0.count}
        
sizeOf
    .f("Hello")


let boolFrom
    = emphasize
        .map{string in string.count}
        .map{int in int.isMultiple(of: 2) ? false : true}
        
boolFrom
    .f("Hello")

emphasize("Hello")
sizeOf("Hello")
boolFrom("Hello")


//: [Next](@next)




