//
//  Person.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import Foundation
import SwiftUI

struct Person: Hashable, Identifiable {
    
    let id = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var bio : String
    var bioLong: String
    var age: Int
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}



extension Person {
    
    
    
    static let example = Person(name: "LizaKvitka", imageURLS: [URL(string: "https://picsum.photos/400/300")!,URL(string: "https://picsum.photos/400/301")!,URL(string: "https://picsum.photos/400/302")!,URL(string: "https://picsum.photos/400/303")!,URL(string: "https://picsum.photos/400/304")!], bio: "I do not do rugs, I am the drugs", bioLong: "I like kanye west", age: 21)
    static let example2 = Person(name: "Side Chick", imageURLS: [URL(string: "https://picsum.photos/400/301")!], bio: "I like kanye west",  bioLong: "I like kanye west", age: 25)
    
  //  static var examples = fireMan.users
    
    
//    [
//        Person.example, Person.example2, Person(name: "Eva", imageURLS: [URL(string: "https://picsum.photos/400/302")!,URL(string: "https://picsum.photos/400/303")!,URL(string: "https://picsum.photos/400/304")!,URL(string: "https://picsum.photos/400/305")!], bio: "slut", bioLong: "visac minda imastan vity...vi", age: 17),Person(name: "Sophia", imageURLS: [URL(string: "https://picsum.photos/400/306")!,URL(string: "https://picsum.photos/400/307")!,URL(string: "https://picsum.photos/400/308")!,URL(string: "https://picsum.photos/400/309")!], bio: "visac minda imastan vity...vi", bioLong: "visac minda imastan vity...vi", age: 25),Person(name: "Mia", imageURLS: [URL(string: "https://picsum.photos/400/310")!,URL(string: "https://picsum.photos/400/311")!,URL(string: "https://picsum.photos/400/314")!,URL(string: "https://picsum.photos/400/315")!], bio: "I Have done bad things", bioLong: "visac minda imastan vity...vi", age: 27)]
//
//
}
