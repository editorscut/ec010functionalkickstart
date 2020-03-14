import SwiftUI

public struct Drawing: View {
    @ObservedObject var brains: Brains
    
    public var body: some View {
        brains.direction()
            .position(brains.position)
            .animation(.easeInOut)
    }
    
    public init(with brains: Brains){
        self.brains = brains
    }
}
