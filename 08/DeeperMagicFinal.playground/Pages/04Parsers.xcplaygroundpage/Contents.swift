//: [Previous](@previous)

struct Parser<A> {
  let parse:  (Substring) -> (A, Substring)?
}

func character(condition: @escaping (Character) -> Bool)
                                       -> Parser<Character> {
  Parser{stream in
    guard let char = stream.first,
          condition(char) else {return nil}
    return (char, stream.dropFirst())
  }
}

let vowelParser
  = character{char in ["a", "e", "i", "o", "u"].contains(char)}

let numberParser = character(condition: \.isNumber)

vowelParser.parse("abc")
numberParser.parse("abc")
numberParser.parse("4g Sourdough Starter")

//: [Next](@next)
