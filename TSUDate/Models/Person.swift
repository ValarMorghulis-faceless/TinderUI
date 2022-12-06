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
    var distance: Int
    var bioLong: String
    var age: Int
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension Person {
    static let example = Person(name: "LizaKvitka", imageURLS: [URL(string: "https://picsum.photos/400/300")!,URL(string: "https://picsum.photos/400/301")!,URL(string: "https://picsum.photos/400/302")!,URL(string: "https://picsum.photos/400/303")!,URL(string: "https://picsum.photos/400/304")!], bio: "I do not do rugs, I am the drugs", distance: 20, bioLong: "I like kanye west", age: 21)
    static let example2 = Person(name: "Side Chick", imageURLS: [URL(string: "https://picsum.photos/400/301")!], bio: "I like kanye west", distance: 30, bioLong: "I like kanye west", age: 25)
    
    static let examples: [Person] = [
        Person.example, Person.example2, Person(name: "Rick", imageURLS: [URL(string: "https://picsum.photos/400/302")!], bio: "I love milfs", distance: 40, bioLong: "I like kanye west", age: 17),Person(name: "Sophia", imageURLS: [URL(string: "https://picsum.photos/400/303")!], bio: "I am really boring", distance: 50, bioLong: "I like kanye west", age: 25),Person(name: "Mia", imageURLS: [URL(string: "https://picsum.photos/400/304")!], bio: "I Have done bad things", distance: 60, bioLong: "I like kanye west", age: 27)]
    
}
