//: [Previous](@previous)

import SwiftUI

struct SimpleCounter {
    @State private var count: Int = 0
}

extension SimpleCounter: View     {
    var body: some View {
        VStack {
            SimpleLabel(text: count.description)
            HStack {
                SimpleButton(title: "Decrease",
                             action: decrement)
                SimpleButton(title: "Increase",
                             action: increment)
            }
        }
    }
}

extension SimpleCounter {
    private func decrement() {
        count -= 1
    }
    private func increment() {
        count += 1
    }
}

import PlaygroundSupport
PlaygroundPage.current.setLiveView(SimpleCounter())

//: [Next](@next)
