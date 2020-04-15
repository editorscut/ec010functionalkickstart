import SwiftUI

public struct SimpleLabel {
    public let text: String
    public let color: Color
    
    public init(text: String,
                color: Color = .purple) {
        self.text = text
        self.color = color
    }
}

extension SimpleLabel: View {
    public var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(color)
    }
}
