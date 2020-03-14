import SwiftUI

public class Brains: ObservableObject {
    public let size: CGFloat = 200
    lazy var worldSize = CGSize(width: size, height: size)
    lazy var moveSize = size/5
    
    @Published var direction: Arrow = Arrow.right
    lazy var position = CGPoint(x: size/2, y: size/2)

    public init(){}
}

extension Brains {
    func moveUp() {
        direction = .up
        position.y -= moveSize
    }
    func moveDown() {
        direction = .down
        position.y += moveSize
    }
    func moveLeft() {
        direction = .left
        position.x -= moveSize
    }
    func moveRight() {
        direction = .right
        position.x += moveSize
    }
}

extension Brains {
    var cantMoveUp: Bool {
        position.y < moveSize
    }
    var cantMoveDown: Bool {
        worldSize.height - position.y <  moveSize
    }
    
    var cantMoveLeft: Bool {
        position.x < moveSize
    }
    var cantMoveRight: Bool {
        worldSize.width - position.x <  moveSize
    }
}
