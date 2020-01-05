struct Greeting {
    private let salutation = "Hello"
    
    func greet(_ name: String) -> String {
        salutation + ", " + name + "!"
    }
}

let greeting = Greeting()
greeting.greet("Swift")

struct GreetingFF {
    let salutation = "Hello"
}

func greetFF(_ name: String,
             using greeting: GreetingFF) -> String {
    greeting.salutation + ", " + name + "!"
}

let greetingFF = GreetingFF()
greetFF("Swift", using: greetingFF)


struct Model {
    let value: Int
    
    init() {
        value = 0
    }
    
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

var model = Model()
model.value
model = model.increase()
model.value
model = model.decrease()
model.value
