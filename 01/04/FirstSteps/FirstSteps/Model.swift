struct Model {
    let value: Int
    
    init() {
        self.init(value: 0)
    }
}

extension Model {
    private init(value: Int) {
        self.value = value
    }
    
    func increase() -> Model {
        Model(value: value + 1)
    }
    
    func decrease() -> Model {
        Model(value: value - 1)
    }
}
