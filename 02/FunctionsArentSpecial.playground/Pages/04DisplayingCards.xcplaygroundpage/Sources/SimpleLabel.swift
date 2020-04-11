import SwiftUI

public struct SimpleLabel {
    public let text: String
}

extension SimpleLabel: View {
    public var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.purple)
    }
}
