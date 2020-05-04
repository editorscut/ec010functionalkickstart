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
//: [Next](@next)
