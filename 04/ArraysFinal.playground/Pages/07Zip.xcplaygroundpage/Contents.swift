//: [Previous](@previous)
import Foundation

let oneToTen = Array(1...10)
let vowels = ["a", "e", "i", "o", "u"]

func replicate(_ letter: String,
               times: Int ) -> String {
    var letters = ""
    guard times > 0 else {return letters}
    for _ in 1...times {
        letters += letter
    }
    return letters
}

let phrase1 = "My dog is not very smart."
let phrase2 = "Madam, in Eden, I'm Adam."

func isLetter(_ char: Character) -> Bool {
    guard let unicodeScalar
        = char.unicodeScalars.first else {return false}
    return !CharacterSet.punctuationCharacters
                .contains(unicodeScalar)
            && !CharacterSet.whitespaces
                .contains(unicodeScalar)
}

let result = zip(oneToTen, vowels)

Array(result)
Array(result).description

extension Array {
    func myZip<T>(_ otherArray: [T])
                        -> Zip2Sequence<[Element], [T]> {
        zip(self, otherArray)
    }
}

vowels.myZip(oneToTen)

Array(vowels.myZip(oneToTen)).description


zip(vowels, oneToTen)
    .map(replicate)

func map2<S, T, Output>(_ array1: [S],
                        _ array2: [T],
                        with f: (S, T) -> Output) -> [Output] {
    zip(array1, array2).map(f)
}

func zip<S, T, Output>(_ array1: [S],
                        _ array2: [T],
                        with f: (S, T) -> Output) -> [Output] {
    zip(array1, array2).map(f)
}

zip(vowels, oneToTen, with: replicate)
map2(vowels, oneToTen, with: replicate)

func isPalindrome(_ string: String) -> Bool {
    let cleanedUpString
        = string
            .filter(isLetter)
            .lowercased()
    
    return zip(cleanedUpString, cleanedUpString.reversed())
            .map{(first, second) in first == second}
            .reduce(true)
                {(finalResult, pairIsEqual) in
                    finalResult && pairIsEqual
                }
}

isPalindrome(phrase1)
isPalindrome(phrase2)

//: [Next](@next)
