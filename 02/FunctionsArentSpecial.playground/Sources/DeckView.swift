import SwiftUI

public struct DeckView {
    let deck: Deck
    
    public init(of deck: Deck) {
        self.deck = deck
    }
}

extension DeckView: View {
    public var body: some View {
        return VStack{
            List(deck){card in
                HStack {
                    Spacer()
                    Text(card.description).foregroundColor(card.color)
                    Spacer()
                }
            }.padding()
        }
    }
}
