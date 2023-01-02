//
//  HomeView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 06.12.22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var firestoreManager = FirestoreManager()
    
    var body: some View {
        VStack {
            CardStack(people: userMng.cardPeople)
            
            Spacer()
            HStack {
                Spacer()
                CircleButtonView(type: .no) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, .nope)
                    }
                    firestoreManager.loadUsersFromFirestore { error in
                        if error != nil {
                            print(error?.localizedDescription)
                        }
                    }
                }
                Spacer()

                CircleButtonView(type: .star) {
//                    if let person = userMng.cardPeople.last {
//                        if userMng.currentUser.goldSubscriber {
//                            userMng.superLike(person)
//                        } else {
//                            appState.showPurchaseScreen()
//                        }
//                    }
                    viewModel.signOut()
                        
                }
                .animation(.easeOut(duration: 0.25))
                Spacer()

                CircleButtonView(type: .heart) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, .like)
                    }
                }
                Spacer()


            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical,25)
            
            Spacer()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
