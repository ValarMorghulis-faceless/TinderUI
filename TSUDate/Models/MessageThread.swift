//
//  MessageThread.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import Foundation


struct MessagePreview {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there.")
}
