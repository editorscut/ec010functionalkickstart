import SwiftUI

class Connector: ObservableObject {
    @Published private var model = Model()
}

extension Connector {
    func increase() {
        model = model.increase()
    }
    func decrease() {
        model = model.decrease()
    }
}

extension Connector: CustomStringConvertible {
    var description: String {
        model.value.description
    }
}


