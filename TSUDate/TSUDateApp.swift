//
//  TSUDateApp.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import SwiftUI

@main
struct TSUDateApp: App {
    
    @ObservedObject var UserMng: UserManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
