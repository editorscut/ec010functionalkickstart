var value = 0

func increase(_ initialValue: Int) -> Int {
    initialValue + 1
}

print(increase(value))

value = increase(value)
increase(value)

func numberOfCharacters(in string: String) -> Int {
    string.count
}

numberOfCharacters(in: "Hello")
increase(numberOfCharacters(in: "Hello"))
