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


covered("Hello") == covered("Hello")

covered("Hello") == covered("World")

//covered(burned(yourCard)) == covered(burned(yourCard))

yourCard

let rippedCard = ripped(yourCard)

let burnedCard = burned(rippedCard)

let coveredCard = covered(burnedCard)

let revealedCard = revealed(coveredCard)

revealedCard == yourCard






yourCard == revealed(covered(burned(ripped(yourCard))))

yourCard ==
    yourCard |> ripped |> burned |> covered |> revealed

yourCard == yourCard
                |> ripped
                |> burned
                |> covered
                |> revealed

//: [Next](@next)
