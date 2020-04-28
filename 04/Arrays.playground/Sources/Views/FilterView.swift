import SwiftUI

public struct FilterView {
    @State var lowRank: Int = 0
    @State var highRank: Int = 12
    
    public init(){}
}

extension FilterView: View {
    public var body: some View {
        VStack {
            Group {
                Text("Between").padding(.top)
                Picker("Pick a rank", selection: $lowRank){
                    ForEach(0..<numberOfRanks){rank in
                        Text(ranks[rank].description)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text("and")
                Picker("Pick a rank", selection: $highRank){
                    ForEach(0..<numberOfRanks){rank in
                        Text(ranks[rank].description)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            DeckView(of: freshDeck
                .filter{card in
                            card.rank >= ranks[lowRank]
                            &&
                            card.rank <= ranks[highRank]
                })
        }
    }
}

