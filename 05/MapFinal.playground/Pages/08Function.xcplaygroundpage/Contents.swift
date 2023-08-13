//: [Previous](@previous)

struct StringFunction<FunctionRange> {
    let f: (String) -> FunctionRange
    
    func callAsFunction(_ string: String) -> FunctionRange {
        f(string)
    }
}

extension StringFunction {
    func map<Output>(_ transform: @escaping (FunctionRange) -> Output)
        -> StringFunction<Output> {
            StringFunction<Output>{x in transform(self.f(x))}
    }
}

let exclaim
    = StringFunction{string in string + "!"}

exclaim
    .f("Hello")

let countCharacters
    = StringFunction{string in string.count}

countCharacters
    .f("Hello")

let bonusSizeOf
    = exclaim
        .map{string in string.count}

bonusSizeOf
    .f("Hello")

let boolFrom
    = exclaim
        .map{string in string.count}
        .map{int in int.isMultiple(of: 2) ? false : true}


boolFrom
    .f("Hello")

exclaim("Hello")

bonusSizeOf("Hello")

boolFrom("Hello")

struct Reader<E, A> {
    let f: (E) -> A
    
    func callAsFunction(_ base: E) -> A {
        f(base)
    }
}

extension Reader {
    func map<Output>(_ transform: @escaping (A) -> Output)
        -> Reader<E, Output> {
            Reader<E, Output>{x in transform(self.f(x))}
    }
}

let shout
    = Reader<String, String>{string in
        string.uppercased() + "!"
}

let amount = shout.map{string in string.count}

shout.f("hello")
shout("hello")

amount.f("hello")
amount("hello")

import UIKit

struct DataReader<DataType> {
    let read: (Data) -> DataType?
}

let stringReader
    = DataReader<String>{data in
        String(data: data,
               encoding: .utf8)
        }

let imageReader
    = DataReader<UIImage>{data in
        UIImage(data: data)
        }

func data(from file: String,
          withExtension ext: String) -> Data {
    guard let dataFile
        = Bundle.main.url(forResource: file,
                          withExtension: ext),
        let data = try? Data(contentsOf: dataFile) else {return Data()}
    return data
}

stringReader.read(data(from: "Title",
                       withExtension: "txt"))

stringReader.read(data(from: "Cover",
                       withExtension: "png"))

imageReader.read(data(from: "Cover",
                      withExtension: "png"))

//: [Next](@next)
