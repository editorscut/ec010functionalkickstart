import SwiftUI

struct ContentView {
    @ObservedObject var connector = Connector()
}

extension ContentView: View {
    var body: some View {
        VStack {
            SimpleLabel(text: connector.description)
            HStack {
                SimpleButton(text: "decrease  ",
                             action: connector.decrease,
                             actionIsNotValid: connector.valueIsTooSmall())
                SimpleButton(text: "  increase",
                             action: connector.increase,
                             actionIsNotValid: connector.valueIsTooBig())
            }
        }
    }
}




