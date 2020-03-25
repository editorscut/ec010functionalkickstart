//: [Previous](@previous)
let threeOfClubs = Card(.three,
                        of: .clubs)

let rippedThreeOfClubs = ripped(threeOfClubs)

let yourCard = Card(.ace,
                    of: .hearts)

let rippedCard = ripped(yourCard)

let burnedCard = burned(rippedCard)

let coveredCard = covered(burnedCard)

let revealedCard = revealed(coveredCard)

revealedCard == yourCard

yourCard == revealed(covered(burned(ripped(yourCard))))

yourCard
    == revealed(
            covered(
                burned(
                    ripped(
                        yourCard
                    )
                )
            )
        )

let revealedCardAlt = yourCard |> ripped |> burned |> covered |> revealed

yourCard == revealedCardAlt

//let revealedCardAlt
//    = yourCard
//        |> ripped
//        |> burned
//        |> covered
//        |> revealed
//
//yourCard == revealedCardAlt


yourCard == yourCard |> ripped |> burned |> covered |> revealed



//: [Next](@next)
