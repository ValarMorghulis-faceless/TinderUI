//
//  MainView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppStateManager
    @ObservedObject private var firManager: FirestoreManager = FirestoreManager()
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = HomeView()
           return AnyView(view)
        case .star:
            let view = MatchesView()
           return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            let view = ProfileView()
           return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
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
                
//                if appState.showPurchasePopup {
//                    PurchasePopup(isVisible: $appState.showPurchasePopup)
//                        .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5))
//                        .transition(.offset(y: 800))
//                }
            }
            .modifier(HideNavigationView())
            
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
