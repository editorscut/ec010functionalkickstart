import SwiftUI

enum Arrow: String {
    case up = "arrow.up"
    case left = "arrow.left"
    case right = "arrow.right"
    case down = "arrow.down"
    
    var image: Image {
        Image(systemName: rawValue)
    }
}
