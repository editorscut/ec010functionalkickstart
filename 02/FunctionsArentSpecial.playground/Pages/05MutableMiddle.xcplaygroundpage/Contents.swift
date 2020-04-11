//: [Previous](@previous)
import SwiftUI

struct SimpleCounter {
    let deck = freshDeck
    @State private var index: Int = 0
}

extension SimpleCounter: View {
    var body: some View {
        VStack {
            SimpleLabel(text: deck[index].description,
                        color: deck[index].color)
            HStack {
                SimpleButton(title: "Decrease",
                             action: decrement,
                             isDisabled: isFirstCard)
                SimpleButton(title: "Increase",
                             action: increment,
                             isDisabled: isLastCard)
            }
        }
    }
}

extension SimpleCounter {
    private func decrement() {
        index -= 1
    }
    private func increment() {
        index += 1
    }
}

extension SimpleCounter {
    private var isFirstCard: Bool {
        index == 0
    }
    private var isLastCard: Bool {
        index == deck.count - 1
    }
}

import PlaygroundSupport
PlaygroundPage.current.setLiveView(SimpleCounter())

//: [Next](@next)
