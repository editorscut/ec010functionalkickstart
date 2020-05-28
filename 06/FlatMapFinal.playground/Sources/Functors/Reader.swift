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
    public init(just a: A){
        f = {env in a}
    }
}

extension Reader {
    public func map<Output>(_ transform: @escaping (A) -> Output)
                                    -> Reader<E, Output> {
        Reader<E, Output>{env in transform(self.f(env))}
    }
}

extension Reader {
    public func flatMap<Output>(_ transform: @escaping (A) -> Reader<E, Output>)
                                    -> Reader<E, Output> {
                                        Reader<E, Output>{env in transform(self.f(env)).f(env)}
    }
}
