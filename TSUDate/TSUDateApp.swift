//
//  TSUDateApp.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import SwiftUI
import Firebase
@main
struct TSUDateApp: App {
    
    @ObservedObject var UserMng: UserManager = UserManager()
    
    
    init() {
        FirebaseApp.configure()
    }

        
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
    
            
    
}

