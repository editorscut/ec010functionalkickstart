//: [Previous](@previous)

let yourCard = Card(.ace,
                    of: .hearts)

ripped(yourCard)

burned(yourCard)

burned(ripped(yourCard))


covered(yourCard)

covered(ripped(yourCard))

revealed(covered(yourCard))

revealed(covered(ripped(yourCard)))

yourCard

let rippedCard = ripped(yourCard)

let burnedCard = burned(rippedCard)

let coveredCard = covered(burnedCard)

let revealedCard = revealed(coveredCard)

revealedCard == yourCard


covered("Hello") == covered("Hello")

covered("Hello") == covered("World")


coveredCard == coveredCard


yourCard == revealed(covered(burned(ripped(yourCard))))

yourCard ==
    yourCard |> ripped |> burned |> covered |> revealed

youCard == yourCard
                |> ripped
                |> burned
                |> covered
                |> revealed

//: [Next](@next)
