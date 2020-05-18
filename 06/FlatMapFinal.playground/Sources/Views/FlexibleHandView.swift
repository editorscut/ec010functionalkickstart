import SwiftUI


public struct FlexibleHandView {
    var hand: Hand?
    var hands: [Hand]?
    
    public init(of hand: Hand) {
        self.hand = hand
    }
    
    public init(of hands: [Hand]) {
        self.hands = hands
    }

}

extension FlexibleHandView: View {
    public var body: some View {
        VStack {
            hand.map{HandView(of: $0)}
            hands.map{HandOfHandsView(of: $0)}
        }
    }
}
