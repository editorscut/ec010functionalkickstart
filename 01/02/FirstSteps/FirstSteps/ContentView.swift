import SwiftUI

struct ContentView {
}

extension ContentView {
    private func printAction() {
        print("I was pressed")
    }
}

extension ContentView: View {
    var body: some View {
        VStack {
            SimpleLabel(text: "I'm a label")
            SimpleButton(text: "I'm a button",
                         action: printAction)
        }
    }
}




