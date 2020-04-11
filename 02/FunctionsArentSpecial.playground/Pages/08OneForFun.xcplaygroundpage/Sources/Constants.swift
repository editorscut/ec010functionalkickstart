import UIKit
import SwiftUI

public let size: CGFloat = 200
public let borderColor = Color.red

let worldSize = CGSize(width: size, height: size)
let move = size/5
let initialPosition = CGPoint(x: size/2, y: size/2)
let initialDirection = Arrow.right
