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
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.cardPeople = Person.examples
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
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        cardPeople.removeLast()
        // Netwroking to backend
    }
    public func superLike(_ person: Person) {
        cardPeople.removeLast()
        // Netwroking to backend
    }
}

enum SwipeDirection {
    case like
    case nope
}
