public struct Reader<E, A> {
    public let f: (E) -> A
    
    public func callAsFunction(_ base: E) -> A {
        f(base)
    }
    
    public init(f: @escaping (E) -> A) {
        self.f = f
    }
}

extension Reader {
    public func map<Output>(_ transform: @escaping (A) -> Output)
                                    -> Reader<E, Output> {
        Reader<E, Output>{env in transform(self.f(env))}
    }
}
