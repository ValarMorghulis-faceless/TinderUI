//
//  CardStack.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 06.12.22.
//

import SwiftUI
import ProgressHUD

struct CardStack: View {
    
    @EnvironmentObject var userMng: UserManager
    
    //var people: [Person]
    
    @State private var fullscreenMode: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            ForEach(userMng.users) { person in
                CardView(person: person, fullscreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
        
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack()
            .environmentObject(UserManager())
    }
}
