import SwiftUI

struct MoveButton {
    let arrow: Arrow
    let action: () -> Void
}
    
extension MoveButton: View {
    var body: some View {
        Button(action: action){arrow.image}
    }
}
