import SwiftUI

struct ContentView {
    @ObservedObject private var connector = Connector()
}

extension ContentView: View {
    var body: some View {
        VStack {
            SimpleLabel(text: connector.description)
            HStack {
                SimpleButton(text: "Decrease",
                             action: connector.decrease)
                SimpleButton(text: "Increase",
                             action: connector.increase)
            }
        }
    }
}
