import SwiftUI

public class Brains: ObservableObject {

    @Published var direction: Arrow = initialDirection
    @Published var position = initialPosition

    public init(){}
}

extension Brains { // for moving
}

extension Brains { // for cant moves
}
