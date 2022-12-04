//
//  MessageThread.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import Foundation


struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there. asjhkjafkjahsjdashfjkasjhflkashfklahksqkwdjqkwldjklasjkajsfklasf")
    
    static let examples: [MessagePreview] = [MessagePreview(person: Person.example, lastMessage: "Hello there. asjhkjafkjahsjdashfjkasjhflkashfklahksqkwdjqkwldjklasjkajsfklasf"), MessagePreview(person: Person.example2, lastMessage: "Hi there hickdead")]
}
