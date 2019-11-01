import SwiftUI

typealias Action = () -> Void

struct SimpleButton {
    let text: String
    let action: Action
}

extension SimpleButton: View {
    var body: some View {
        Button(action: action){
            Text(text)
        }
    }
}

    let doesntDoAnything = {
        // I told you it doesn't do anything
    }
