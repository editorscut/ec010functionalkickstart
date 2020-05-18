public struct State<S, A> {
    public let run: (S) -> (A, S)
    
    public func callAsFunction(_ s: S) -> (A, S) {
        run(s)
    }
    
    public init(run: @escaping (S) -> (A, S)) {
        self.run = run
    }
}

extension State {
    public static func just(_ a: A) -> Self {
        State<S, A>{s in (a, s)}
    }
    
    public func map<Output>(_ transform: @escaping (A) -> Output)
                                            -> State<S, Output> {
        State<S, Output> {state in
            let (nextA, nextS) = self.run(state)
            return (transform(nextA), nextS)
        }
    }
    
    public func flatMap<Output>(_ transform: @escaping (A) -> State<S, Output>)
                                            -> State<S, Output> {
        State<S, Output> {state in
            let (nextA, nextS) = self.run(state)
            return transform(nextA).run(nextS)
        }
    }
}


