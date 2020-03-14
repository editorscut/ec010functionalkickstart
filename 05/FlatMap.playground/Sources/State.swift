public struct State<S, A> {
    public let run: (S) -> (A, S)
    
    public func callAsFunction(_ s: S) -> (A, S) {
        run(s)
    }
}
extension State {
    public func map<Output>(_ transform: @escaping (A) -> Output) -> State<S, Output> {
        return State<S, Output> {state in
            let (nextA, nextS) = self.run(state)
            return (transform(nextA), nextS)
        }
    }
}
