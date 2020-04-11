//: [Previous](@previous)
import SwiftUI

class CurrentCard: ObservableObject {
    private let deck = freshDeck
    @Published private var index = 0
}

extension CurrentCard {
    public var name: String {
        deck[index].description
    }
    public var color: Color {
        deck[index].color
    }
}

extension CurrentCard {
    public func decrement() {
        index -= 1
    }
    public func increment() {
        index += 1
    }
}

extension CurrentCard {
    public var isFirstCard: Bool {
        index == 0
    }
    public var isLastCard: Bool {
        index == deck.count - 1
    }
}


struct SimpleCounter {
    @ObservedObject private var card = CurrentCard()
}

extension SimpleCounter: View {
    var body: some View {
        VStack {
            SimpleLabel(text: card.name,
                        color: card.color)
            HStack {
                SimpleButton(title: "Decrease",
                             action: card.decrement,
                             isDisabled: card.isFirstCard)
                SimpleButton(title: "Increase",
                             action: card.increment,
                             isDisabled: card.isLastCard)
            }
        }
    }
}



import PlaygroundSupport
PlaygroundPage.current.setLiveView(SimpleCounter())

//: [Next](@next)
