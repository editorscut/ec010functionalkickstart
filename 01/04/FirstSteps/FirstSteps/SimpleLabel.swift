import SwiftUI

struct SimpleLabel {
    let text: String
}

extension SimpleLabel: View {
    var body: some View {
        Text(text)
    }
}
