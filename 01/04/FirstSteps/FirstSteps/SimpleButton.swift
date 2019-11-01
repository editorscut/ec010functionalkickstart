import SwiftUI

typealias Action = () -> Void

struct SimpleButton {
    let text: String
    let action: Action
    let actionIsNotValid: Bool
}

extension SimpleButton: View {
    var body: some View {
        Button(action: action){
            Text(text)
        }
        .disabled(actionIsNotValid)
    }
}

