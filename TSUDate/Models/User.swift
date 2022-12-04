//
//  User.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 04.12.22.
//

import Foundation


struct User {
    var name: String
    var age: Int
    var jobTitle: String
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
    var imageURLS: [URL] = []
}

extension User {
    static let example = User(name: "Samkharag",age: 22, jobTitle: "Malware Engineer", goldSubscriber: false, profileTip: "Tinder Tip: Just be Rich", imageURLS: [URL(string: "https://picsum.photos/400/310")!])
}
