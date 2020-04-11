//: [Previous](@previous)

import SwiftUI

struct World: View {
    let brains = Brains()
    
    var body: some View {
        VStack {
            Drawing(with: brains)
                .frame(width: size,
                       height: size,
                       alignment: .center)
                .border(borderColor)
            Buttons(using: brains)
        }
    }
}

import PlaygroundSupport
PlaygroundPage.current.setLiveView(World())

//: [Next](@next)
