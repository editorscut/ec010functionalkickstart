import SwiftUI

public struct SimpleLabel {
    public let text: String
    
    public init(text: String) {
        self.text = text
    }
}

extension SimpleLabel: View {
    public var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.purple)
    }
}
