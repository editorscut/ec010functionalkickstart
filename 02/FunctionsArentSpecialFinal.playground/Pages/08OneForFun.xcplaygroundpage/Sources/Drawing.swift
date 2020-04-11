import SwiftUI

public struct Drawing {
    @ObservedObject var brains: Brains
    
    public init(with brains: Brains){
        self.brains = brains
    }
}

extension Drawing: View {
    public var body: some View {
        brains.direction.image
            .position(brains.position)
            .animation(.easeInOut)
    }
}
