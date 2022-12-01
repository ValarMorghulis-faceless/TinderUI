//
//  Person.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!])
}
