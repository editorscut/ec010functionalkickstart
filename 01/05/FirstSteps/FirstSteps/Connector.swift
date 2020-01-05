import Combine

class Connector: ObservableObject {
    @Published private var model = Model()
}

extension Connector {
    func decrease() {
        model = model.decrease()
    }
    
    func increase() {
        model = model.increase()
    }
}

extension Connector: CustomStringConvertible {
    var description: String {
        model.value.description
    }
}
