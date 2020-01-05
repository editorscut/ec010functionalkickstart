import SwiftUI

typealias Action = () -> Void

struct SimpleButton {
    let text: String
    let action: Action
}

extension SimpleButton: View {
    var body: some View {
        Button(text,
               action: action)
    }
}
