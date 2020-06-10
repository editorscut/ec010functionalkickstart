//: [Previous](@previous)

var trunkAudienceSeesForMap
    = ShinyTrunk(just: origin)

trunkAudienceSeesForMap
    = trunkAudienceSeesForMap.map(moveRight)

var trunkAudienceSeesForFlatMap
    = ShinyTrunk(just: origin)

trunkAudienceSeesForFlatMap
    = trunkAudienceSeesForFlatMap
        .flatMap(movingRightInTrunk)

trunkAudienceSeesForFlatMap
    = trunkAudienceSeesForFlatMap
        .flatMap(movingRightInTrunk)
        .flatMap(movingRightInTrunk)
        .flatMap(movingRightInTrunk)


let originInShinyTrunk
    = ShinyTrunk(just: origin)

let functionInShinyTrunk
    = ShinyTrunk(just: moveRight)

let noPointInShinyTrunk
    = ShinyTrunk<Point>()

let noFunctionInShinyTrunk
    = ShinyTrunk<(Point) -> Point>()

originInShinyTrunk
    .apply(functionInShinyTrunk)

noPointInShinyTrunk
    .apply(functionInShinyTrunk)

noPointInShinyTrunk
    .apply(noFunctionInShinyTrunk)

originInShinyTrunk
    .apply(noFunctionInShinyTrunk)

functionInShinyTrunk <*> originInShinyTrunk

functionInShinyTrunk <*> noPointInShinyTrunk

noFunctionInShinyTrunk <*> originInShinyTrunk

noFunctionInShinyTrunk <*> noPointInShinyTrunk

//: [Next](@next)
