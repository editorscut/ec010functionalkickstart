import SwiftUI

public struct Buttons {
    @ObservedObject var brains: Brains
    
    public init(using brains: Brains) {
        self.brains = brains
    }
}

extension Buttons: View {
    public var body: some View {
        MoveButton(arrow: .right,
                   action: {})
    }
}
