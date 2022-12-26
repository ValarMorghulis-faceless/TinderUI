//
//  FirestoreManager.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 22.12.22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore


class FirestoreManager: ObservableObject {
    
    let objectId = Auth.auth().currentUser?.uid
    var email = Auth.auth().currentUser?.email
    var username: String = ""
    var dateOfBirth = Date()
    var userGender: String = ""
    var interestedIn: [String] = []
    var bio: String = ""
    let registerDate = Date()
    
        
    var UserDictionary: NSDictionary {
        
        return NSDictionary(objects: [
            self.objectId!,
            self.email!,
            self.username,
            self.dateOfBirth,
            self.userGender,
            self.interestedIn,
            self.bio,
            self.registerDate,
        ], forKeys: [
        "USERID" as NSCopying,
        "EMAIL" as NSCopying,
        "USERNAME" as NSCopying,
        "DATEOFBIRTH" as NSCopying,
        "USERGENDER" as NSCopying,
        "INTERESTEDIN" as NSCopying,
        "BIO" as NSCopying,
        "REGISTERDATE" as NSCopying,
        ])
        
    }
    

    
    
    
    
    
//    init(objectId: String, email: String, username: String, dateOfBirth: Date, interestedIn: String, bio: String) {
//      //  self.objectId = objectId
//        self.email = email
//        self.username = username
//        self.dateOfBirth = dateOfBirth
//        self.interestedIn = interestedIn
//        self.bio = bio
//
//    }
//
//
//    init(_dictionary: NSDictionary) {
//      //  objectId = _dictionary["USERID"] as? String ?? ""
//        email = _dictionary["EMAIL"]  as? String ?? ""
//        username = _dictionary["USERNAME"]  as? String ?? ""
//        interestedIn = _dictionary["INTERESTEDIN"] as? String ?? ""
//        bio = _dictionary["BIO"]  as? String ?? ""
//        pushId = _dictionary["PUSHID"] as? String ?? ""
//
//        if let date = _dictionary["DATEOFBIRTH"] as? Timestamp {
//            dateOfBirth = date.dateValue()
//        } else {
//            dateOfBirth = _dictionary["DATEOFBIRTH"] as? Date ?? Date()
//        }
//    }
    
    func saveUserToFireStore(complition: @escaping (_ error: Error?) -> Void) {

        let db = Firestore.firestore()
        

        let docRef = db.collection("User").document(Auth.auth().currentUser!.uid)

        docRef.setData(UserDictionary as! [String : Any]) { error in
            complition(error)
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Doocument successfully written!")
            }
        }

    }
    
    
}
