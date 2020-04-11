import SwiftUI

public struct Buttons {
    @ObservedObject var brains: Brains
    
    public init(using brains: Brains) {
        self.brains = brains
    }
}

extension Buttons: View {
    public var body: some View {
        VStack {
            MoveButton(arrow: .up,
                       action: brains.moveUp,
                       disabled: brains.cantMoveUp)
            HStack {
                MoveButton(arrow: .left,
                           action: brains.moveLeft,
                           disabled: brains.cantMoveLeft)
                MoveButton(arrow: .right,
                           action: brains.moveRight,
                           disabled: brains.cantMoveRight)
            }
            MoveButton(arrow: .down,
                       action: brains.moveDown,
                       disabled: brains.cantMoveDown)
        }
    }
}
