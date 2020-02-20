//: [Previous](@previous)

let phrase1 = "My dog is not very smart."
let phrase2 = "Madam, in Eden, I'm Adam."

let oneToTen = Array(1...10)
let vowels = ["a", "e", "i", "o", "u"]

func outPunctuationAndWhiteSpace(_ char: Character) -> Bool {
    guard let unicodeScalar
        = char.unicodeScalars.first else {return false}
    return !CharacterSet.punctuationCharacters
                .contains(unicodeScalar)
            && !CharacterSet.whitespaces
                .contains(unicodeScalar)
}
//: End setup

let result = zip(oneToTen, vowels)
Array(result)

zip(oneToTen, vowels)
    .map{(int, letter) -> String in
        var letters = ""
        guard int > 0 else {return letters}
        for _ in 1...int {
            letters += letter
        }
        return letters
}

import Foundation

func isPalindrome(_ string: String) -> Bool {
    let cleanedUpString
        = string
            .filter(outPunctuationAndWhiteSpace)
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
