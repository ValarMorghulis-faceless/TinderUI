//
//  MainView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = Text("Fire")
           return AnyView(view)
        case .star:
            let view = Text("Star")
           return AnyView(view)
        case .message:
            let view = ChatView(person: Person.example )
           return AnyView(view)
        case .profile:
            let view = ProfileView()
           return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack (){
                
                HStack(spacing:80) {
                    TabBarButtonView(type: .fire)
                    
                    TabBarButtonView(type: .star)
                    
                    TabBarButtonView(type: .message)
                    
                    TabBarButtonView(type: .profile)
                 
                    
                }
                .frame(height: 100)
                .padding(.top, 30)
                correctViewForState()
                Spacer()
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
