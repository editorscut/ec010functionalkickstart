//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct World: View {
    let brains = Brains()
    
    var body: some View {
        VStack {
            Drawing(with: brains)
                .frame(width: brains.size,
                       height: brains.size,
                       alignment: .center)
                .border(Color.red)
            
            Buttons(using: brains)
        }
    }
}

PlaygroundPage.current.setLiveView(World())
//: tap the second button from the right at the top and choose LiveView

//: [Next](@next)
