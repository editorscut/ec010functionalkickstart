import SwiftUI

struct ContentView {
}

extension ContentView {
    private func decrease() {
        print("decreased")
    }
    private func increase() {
        print("increased")
    }
}

extension ContentView: View {
    var body: some View {
        VStack {
            SimpleLabel(text: "0")
            HStack {
                SimpleButton(text: "Decrease",
                             action: decrease)
                SimpleButton(text: "Increase",
                             action: increase)
            }
        }
    }
}




