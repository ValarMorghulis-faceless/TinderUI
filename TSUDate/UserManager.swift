//
//  UserManager.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 04.12.22.
//

import Foundation
import FirebaseFirestore


class UserManager: ObservableObject {
    
    @Published var users = [Person]()
    
    @Published var currentUser: User = User(name: "", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
   
    
    
    
    
    
   func DownloadUsersFromFirestore() {
        let db = Firestore.firestore()
        let usersRef = db.collection("User")
        
        usersRef.getDocuments { querySnapshot , error in
            if error != nil {
                print("Error getting documents: \(error?.localizedDescription)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["USERNAME"] as? String
                    let bio = data["BIO"] as? String
                    let age = data["DATEOFBIRTH"] as? Date
                    let calendar = Calendar.current
                    let ageComponents = calendar.dateComponents([.year], from: age ?? Date(), to: Date())
                    let user = Person(name: name!, imageURLS: [URL(string: "https://picsum.photos/400/302")!,URL(string: "https://picsum.photos/400/303")!,URL(string: "https://picsum.photos/400/304")!,URL(string: "https://picsum.photos/400/305")!], bio: bio!, bioLong: "shulalala", age: ageComponents.year!)
                    self.users.append(user)
                }
            }
        }
    }
   // @Published var cardPeople = users
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    private func loadCardPeople() {
        self.users
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
    private func loadMatches() {
        self.matches = users
        
    }
    private func loadTopPicks() {
        self.topPicks = users.shuffled()
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        users.removeLast()
        // Netwroking to backend
    }
    public func superLike(_ person: Person) {
        users.removeLast()
        // Netwroking to backend
    }
}

enum SwipeDirection {
    case like
    case nope
}
