//: [Previous](@previous)

import SwiftUI

struct SimpleLabel {
    let text: String
}

extension SimpleLabel: View {
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.purple)
    }
}

var label = SimpleLabel(text: "Hello")

label = SimpleLabel(text: "How are you?")




import PlaygroundSupport

PlaygroundPage.current.setLiveView(label)
//: tap the second button from the right at the top and choose LiveView


//: [Next](@next)
