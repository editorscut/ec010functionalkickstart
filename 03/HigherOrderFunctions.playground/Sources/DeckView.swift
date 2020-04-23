import SwiftUI

public struct DeckView {
    let deck: Deck
    
    public init(of deck: Deck) {
        self.deck = deck
    }
}

extension DeckView: View {
    public var body: some View {
        NavigationView {
        return VStack{
            List(deck){card in
                Text(card.description).foregroundColor(card.color)
            }.navigationBarTitle("The Deck")
        }
        }
    }
}
