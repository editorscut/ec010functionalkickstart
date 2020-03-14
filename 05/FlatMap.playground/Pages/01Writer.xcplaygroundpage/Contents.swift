//: [Previous](@previous)

struct Writer<Value> {
    let value: Value
    let log: String
}

extension Writer: CustomStringConvertible {
    var description: String {
        "(value: \(value), \n log: \(log))"
    }
}

func emphasize(_ string: String) -> String {
    if string.isEmpty {return ""} else {
        return string.uppercased() + "!"
    }
}

func count(in string: String) -> Int {
    string.count
}

let emptyTrunk = Writer(value: "",
                        log: "Initially contains an empty String")

let helloTrunk = Writer(value: "Hello",
                        log: "Initially contains the String: 'Hello'")

extension Writer {
    func map<Output>(_ transform: (Value) -> Output)
        -> Writer<Output> {
            Writer<Output>(value: transform(value),
                           log: log)
    }
}

helloTrunk
    .map(emphasize)

helloTrunk
    .map(emphasize)
    .map(count)

emptyTrunk
    .map(emphasize)

emptyTrunk
    .map(emphasize)
    .map(count)

//: End setup

func emphasizePlus(_ string: String) -> Writer<String> {
    if string.isEmpty {
        return Writer(value: "", log: "Made no changes")
    } else {
        return Writer(value: string.uppercased() + "!",
                      log: "Uppercased string and appended '!'")
    }
}

func countPlus(in string: String) -> Writer<Int> {
    return Writer(value: string.count,
                  log: "Calculated length of string")
}


let mistake
    = helloTrunk
        .map(emphasizePlus)



// can't
//helloTrunk
//    .map(emphasizePlus)
//    .map(countPlus)

helloTrunk
    .map(emphasizePlus)
    .value
    .map(countPlus)


//extension Writer {
//    func flatMap<Output>(_ transform: (Value) -> Writer<Output>) -> Writer<Output> {
//        return transform(value)
//    }
//}

extension Writer {
    func flatMap<Output>(_ transform: (Value) -> Writer<Output>) -> Writer<Output> {
        let newWriter =  transform(value)
        let adjustedLog = log + "\n \t  * " + newWriter.log
        return Writer<Output>(value: newWriter.value,
                      log: adjustedLog)
    }
}


helloTrunk
    .flatMap(emphasizePlus).description

print(helloTrunk
.flatMap(emphasizePlus)
.flatMap(countPlus).description)

//: [Next](@next)
