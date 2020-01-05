struct Model {
    let value: Int
    
    init() {
        value = 0
    }
}

extension Model {
    private init(value: Int) {
        self.value = value
    }
    
    func decrease() -> Model {
        Model(value: value - 1)
    }
    
    func increase() -> Model {
        Model(value: value + 1)
    }
}
