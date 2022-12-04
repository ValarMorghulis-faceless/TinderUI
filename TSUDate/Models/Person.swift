//
//  Person.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import Foundation

struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var bio : String
    var age: Int
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "I do not do rugs, I am the drugs", age: 21)
    static let example2 = Person(name: "Samantha", imageURLS: [URL(string: "https://picsum.photos/400/301")!], bio: "I like kanye west", age: 25)
    
    static let examples: [Person] = [
        Person.example, Person.example2, Person(name: "Rick", imageURLS: [URL(string: "https://picsum.photos/400/302")!], bio: "I love milfs", age: 17),Person(name: "Sophia", imageURLS: [URL(string: "https://picsum.photos/400/303")!], bio: "I am really boring", age: 25),Person(name: "Mia", imageURLS: [URL(string: "https://picsum.photos/400/304")!], bio: "I Have done bad things", age: 27)]
    
}
