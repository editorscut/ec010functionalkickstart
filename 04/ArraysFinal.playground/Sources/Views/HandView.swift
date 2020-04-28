import SwiftUI


public struct HandView {
    let hand: Hand
    
    public init(of hand: Hand) {
        self.hand = hand
    }
}

extension HandView: View {
    public var body: some View {
        ZStack {
            ForEach(hand){card in
                CardView(of: card)
                    .offset(x: self.xOffset(for: card) ,
                            y: self.yOffset(for: card))
                    .rotationEffect(self.degrees(for: card), anchor: .bottom)
            }
        }
        .rotationEffect(self.totalDegrees)
        .offset(x: self.xHandOffset,
                y: 0)
    }
}


extension HandView {
    private func index(of card: Card) -> CGFloat {
        CGFloat(hand.firstIndex(of: card)!)
    }
    
    private func degrees(for card: Card) -> Angle {
        Angle(degrees: rotationAngle * Double(index(of: card)))
    }
    
    private var totalDegrees: Angle {
        Angle(degrees: -rotationAngle/2 * Double(hand.count - 1))
    }
    
    private func xOffset(for card: Card) -> CGFloat {
        xCardOffset * index(of: card)
    }
    
    private func yOffset(for card: Card) -> CGFloat {
        yCardOffset * index(of: card)
    }
    
    private var xHandOffset: CGFloat {
        let tilt = Double.pi/2 - totalDegrees.radians
        return CGFloat(cos(tilt) ) * cardHeight  + cardWidth/2
    }
    
    private var yHandOffset: CGFloat {
        -yCardOffset * CGFloat(hand.count - 1) * 5
    }
}



