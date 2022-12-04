//
//  UserManager.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 04.12.22.
//

import Foundation


class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    private func loadUser() {
        self.currentUser = User.example
    }
    private func loadMatches() {
        self.matches = Person.examples
        
    }
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
}
