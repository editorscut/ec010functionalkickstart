//: [Previous](@previous)

import SwiftUI

struct SimpleButton {
    let title: String
    let action: () -> Void
}

extension SimpleButton: View {
    var body: some View {
        Button(title,
               action: action)
    }
}

let doesntDoAnything = {}

var count = 0

func incrementCount() {
    count += 1
    print(count)
}

incrementCount()


let button = SimpleButton(title: "Tap Here",
                          action: incrementCount)
import PlaygroundSupport

PlaygroundPage.current.setLiveView(button)
//: tap the second button from the right at the top and choose LiveView


//: [Next](@next)
