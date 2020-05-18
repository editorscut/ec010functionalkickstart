import SwiftUI

public struct CardView {
    let card: Card
    
    public init(of card: Card) {
        self.card = card
    }
}

extension CardView: View {
    public var body: some View {
        GeometryReader {proxy in
                   ZStack {
                    RoundedRectangle(cornerRadius: cardCorner)
                        .stroke(Color.gray,
                                lineWidth: cardBorder)

                    Text(self.card.description)
                        .foregroundColor(self.card.color)
                        .position(x: xInset, y: yInset)
                    
                    Text(self.card.description)
                        .foregroundColor(self.card.color).rotationEffect(Angle(degrees: 180))
                        .position(x: cardWidth - xInset, y: cardHeight - yInset)
    }
        }.frame(width: cardWidth, height: cardHeight, alignment: .center).background(Color.white)
    }
}


