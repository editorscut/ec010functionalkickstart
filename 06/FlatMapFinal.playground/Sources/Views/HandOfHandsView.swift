import SwiftUI

public struct HandOfHandsView {
    let hands: [Hand]
    
    public init(of hands: [Hand]) {
        self.hands = hands
    }
}

extension HandOfHandsView: View {
    public var body: some View {
        ZStack {
            ForEach(hands){hand in
                HandView(of: hand)
                    .offset(x: self.xOffset(for: hand) ,
                            y: self.yOffset(for: hand))
                    .rotationEffect(self.degrees(for: hand), anchor: .bottom)
            }
        }
        .rotationEffect(self.totalDegrees)
        .offset(x: self.xHandOffset,
                y: 0)
    }
}


extension HandOfHandsView {
    private func index(of hand: Hand) -> CGFloat {
        CGFloat(hands.firstIndex(of: hand)!)
    }
    
    private func degrees(for hand: Hand) -> Angle {
        Angle(degrees: handsRotationAngle *  Double(index(of: hand)))
    }
    
    private var totalDegrees: Angle {
        Angle(degrees: -handsRotationAngle/2  * Double(hands.count - 1))
    }
    
    private func xOffset(for hand: Hand) -> CGFloat {
        handsxCardOffset * index(of: hand)
    }
    
    private func yOffset(for hand: Hand) -> CGFloat {
        handsyCardOffset * index(of: hand)
    }
    
    private var xHandOffset: CGFloat {
        let tilt = Double.pi/2 - totalDegrees.radians
        return CGFloat(cos(tilt) ) * cardHeight  + cardWidth/2
    }
    
    private var yHandOffset: CGFloat {
        -yCardOffset * CGFloat(hands.count - 1) * 5
    }
}



