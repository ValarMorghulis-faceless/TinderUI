//
//  AuthViewModel.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 20.12.22.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

 // public let userDefaults = UserDefaults.standard


class AuthViewModel: ObservableObject{

    

    
   // static let shared = AuthViewModel(objectId: "", email: "", username: "", dateOfBirth: Date(), interestedIn: "", bio: "")
    
    
//                   var userTest: [String: Any] = [
//                        "User ID": "Shemoixede genacvale",
//                        "address" : "goris bolo",
//                        "dateAdded" : Timestamp(date: Date()),
//                        "UserID" : (Any).self
//
//                    ]
    
    

    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var dataSaved: Bool?
    @Published var isLogin: Bool?
   // @Published var user: User?
    

    init() {
       self.userSession = Auth.auth().currentUser
        self.isLogin = false
    }
//    init(error: Error? = nil, dataSaved: Bool, isLogin: Bool) {
//        self.userSession = Auth.auth().currentUser
//        self.dataSaved = dataSaved
//        self.isLogin = isLogin
//    }
    
 

    
  
    
    func login(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if error == nil {
                
                if authDataResult!.user.isEmailVerified {
                   // FirebaseListener.shared.downloadCurrentUserFromFirebase(userId: authDataResult!.user.uid, email: email)
                  self.userSession = authDataResult?.user
                //  self.isLogin = true
                    let db = Firestore.firestore()
                    let docRef = db.collection("User").document((authDataResult?.user.uid)!)
                    docRef.getDocument { document, error in
                        if document!.exists {
                            self.isLogin = false
                        } else {
                            self.isLogin = true
                        }
                    }
                   
                    completion(error, true)
                } else {
                    
                    print("Email not verified")
                    completion(error,false)
                }
            } else {
                completion(error, false)
            }
            
        }
        
    }
    
     func register(email: String, password: String, completion: @escaping(_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authdata, error in
            completion(error)
            if error == nil {
                authdata?.user.sendEmailVerification { (error) in
                    print("auth email verification sent", error?.localizedDescription)
                }
                
                if authdata?.user != nil {
//                    let user = AuthViewModel(objectId: authdata!.user.uid, email: email , username: "MTYVNELA", dateOfBirth: Date(), interestedIn: "Qalebi mevaseba magra", bio: "i do not do drugs i am drugs")
//                    user.saveUserToFireStore(user.UserDictionary as! [String : Any])                   // self.saveUserToFireStore(self.UserDictionary as! [String : Any])

                }
            }
            
        }
    }
    

    func signOut() {
        userSession = nil
        isLogin = false
        try? Auth.auth().signOut()
    }
    
    
//    func saveUserToFireStore(_ docData: [ String : Any]) {
//
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("User").document(Auth.auth().currentUser!.uid)
//
//        docRef.setData(docData) { error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("Doocument successfully written!")
//            }
//        }
//
//    }
    
//    func saveUserToFireStore() {
//        FirebaseReference(.User).document(self.objectId).setData(self.UserDictionary as! [String: Any]) { error in
//            if error != nil {
//                print(error?.localizedDescription)
//            }
//
//        }
//
//    }
    
    
//    func saveUserLOcally() {
//        userDefaults.setValue(self.UserDictionary as! [String: Any], forKey: "Current User")
//        userDefaults.synchronize()
//    }

    
}

