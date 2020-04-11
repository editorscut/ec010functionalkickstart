import SwiftUI

struct MoveButton: View {
    let arrow: Arrow
    let action: () -> Void
    let disabled: Bool
    
    var body: some View {
        Button(action: action){arrow.image}
            .disabled(disabled)
    }
}
