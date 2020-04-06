import SwiftUI

public struct SimpleButton {
    public let title: String
    public let action: () -> Void
    
    public init(title: String,
                action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}

extension SimpleButton: View {
    public var body: some View {
        Button(title,
               action: action)
    }
}
