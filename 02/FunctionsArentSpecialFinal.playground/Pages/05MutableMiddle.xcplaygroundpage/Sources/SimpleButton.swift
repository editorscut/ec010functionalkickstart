import SwiftUI

public struct SimpleButton {
    public let title: String
    public let action: () -> Void
    public let isDisabled: Bool
    
    public init(title: String,
                action: @escaping () -> Void,
                isDisabled: Bool) {
        self.title = title
        self.action = action
        self.isDisabled = isDisabled
    }
}

extension SimpleButton: View {
    public var body: some View {
        Button(title,
               action: action)
            .disabled(isDisabled)
    }
}
