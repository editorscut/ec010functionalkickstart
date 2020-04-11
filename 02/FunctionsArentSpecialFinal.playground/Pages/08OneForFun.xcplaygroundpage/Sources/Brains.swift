import SwiftUI

public class Brains: ObservableObject {

    @Published var direction: Arrow = initialDirection
    @Published var position = initialPosition

    public init(){}
}

extension Brains { // for moving
    func moveUp() {
        direction = .up
        position.y -= move
    }
    func moveDown() {
        direction = .down
        position.y += move
    }
    func moveLeft() {
        direction = .left
        position.x -= move
    }
    func moveRight() {
        direction = .right
        position.x += move
    }
}

extension Brains { // for cant moves
    var cantMoveUp: Bool {
        position.y < move
    }
    var cantMoveDown: Bool {
        size - position.y <  move
    }
    
    var cantMoveLeft: Bool {
        position.x < move
    }
    var cantMoveRight: Bool {
        size - position.x <  move
    }
}
