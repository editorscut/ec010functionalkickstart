//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport


struct Person: Identifiable {
    let name: String
    let height: Int
    var nickname: String?
    let id = UUID()
    
    var preferredName: String {
        guard let nickname = nickname else {return name}
        return nickname
    }
}

let everyone = [
    Person(name: "Anne", height: 190),
    Person(name: "Robert", height: 180, nickname: "Bobby"),
    Person(name: "Constance", height: 185, nickname: "Connie"),
    Person(name: "Daniel", height: 175)]

//var people = [Person]()
//
//struct TableView: View {
//    var body: some View {
//        List(people){person in
//            Text(person.preferredName +
//                " (" + person.height.description + ")")
//        }.frame(width: 100,
//                height: 100,
//                alignment: .center)
//    }
//}



//: End setup

//people = everyone

//people
//    = everyone
//        .sorted{$0.height < $1.height}
//people =
//    everyone
//        .filter{$0.height > 110}
//        .sorted{$0.preferredName.count > $1.preferredName.count}

//func cmToInches(_ cm: Int) -> Int {
//    Int(Double(cm) * 0.393701)
//}
//people
//    = everyone
//        .map{Person(name: $0.name,
//                    height: cmToInches($0.height),
//                    nickname: $0.nickname)}


var people = [String]()

struct TableView: View {
    var body: some View {
        List(people, id: \.self){person in
            Text(person)
        }.frame(width: 100,
                height: 100,
                alignment: .center)
    }
}

people
    = everyone
        .compactMap{$0.nickname}





PlaygroundPage.current.setLiveView(TableView())
