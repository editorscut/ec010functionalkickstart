//: [Previous](@previous)

func yFor(slope m: Int,
          intercept b: Int,
          x: Int) -> Int {
    let y = m * x + b
    return y
}

func numberOfCharacters(_ string: String) -> Int {
    string.count
}

yFor(slope: 3,
     intercept: 2,
     x: 4)

numberOfCharacters("Hello")

let characterCount
    = {(string: String) -> Int in
        string.count
}

characterCount("Hello")

typealias StringCalculation = (String) -> Int

//let stringLength: (String) -> Int

let stringLength: StringCalculation

//stringLength = {string in
//    string.count
//}

stringLength = {$0.count}


stringLength("Hello")

var count = 0

func incrementCount() {
    count += 1
    print(count)
}

incrementCount()

let countPlusOne = {
    count += 1
    print(count)
}

countPlusOne()

struct SimpleButton {
    let title: String
    let action: () -> Void
}

let button1
    = SimpleButton(title: "Just Testing",
                   action: countPlusOne)

let button2
    = SimpleButton(title: "Just Testing",
                   action: {
                    count += 1
                    print(count)
    })

let button3
    = SimpleButton(title: "Just Testing"){
        count += 1
        print(count)
}

let yValueFor
    = {(m: Int,
        b: Int,
        x: Int) -> Int in
    let y = m * x + b
    return y
}

yValueFor(3, 2, 4)

//func changeAlternateCards(to newCard: Card)
//                                      -> (Deck) -> Deck {
//    func alternateCards(in deck: Deck) -> Deck  {
//        var newDeck = Deck()
//        for (index, card) in deck.enumerated() {
//            newDeck
//                .append(index.isMultiple(of: 2) ?
//                    newCard : card)
//        }
//        return newDeck
//    }
//    return alternateCards
//}

func changeAlternateCards(to newCard: Card)
                                      -> (Deck) -> Deck {
    {deck in
        var newDeck = Deck()
        for (index, card) in deck.enumerated() {
            newDeck
                .append(index.isMultiple(of: 2) ?
                    newCard : card)
        }
        return newDeck
    }
}

//: [Next](@next)
