//: [Previous](@previous)

let optionalCount = Optional(just: numberOfCharacters)

import SwiftUI

struct PresentedView {
    @State var message = "Press Here"
    var action: ((String) -> Int)?
    var string: String?
}

//extension PresentedView: View {
//    var body: some View {
//        Button(message){
//            guard let action = self.action,
//                let string = self.string else {
//                    self.message = "action and/or string is nil"
//                    return
//            }
//            self.message = action(string).description
//        }
//    }
//}

extension PresentedView: View {
    var body: some View {
        Button(message){
            let result = self.action <*> self.string
            self.message = result?.description ??
         "action and/or string is nil"
        }
    }
}

var modalView = PresentedView(action: numberOfCharacters,
                              string: "Hello")

modalView = PresentedView()

simpleButton <*> "Press Here" <*> {print("Tapped")}

simpleButton <*> "Press Here" <*> nil

simpleButton <*> nil <*> {print("Tapped")}

simpleButton <*> nil <*> nil

let aTitle: String? = "Press Here"
let noTitle: String? = nil

let anAction: (() -> Void)? = {print("Tapped")}
let noAction: (() -> Void)? = nil



Optional(just: simpleButton) <*> aTitle <*> anAction

Optional(just: simpleButton) <*> aTitle <*> noAction

Optional(just: simpleButton) <*> noTitle <*> anAction

Optional(just: simpleButton) <*> noTitle <*> noAction



import PlaygroundSupport

PlaygroundPage.current.setLiveView(modalView)



//: [Next](@next)
