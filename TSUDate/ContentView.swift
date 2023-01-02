//
//  ContentView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var mng: AppStateManager = AppStateManager()
    @ObservedObject var userMng: UserManager = UserManager()
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        
        Group {
            
            
//            if viewModel.userSession != nil {
//                CreateAccountView()
//            } else {
//                LoginView()
//            }
//
            
            
            if viewModel.userSession != nil && viewModel.isLogin == false{


              //  CreateAccountView()
                    MainView()
                            .environmentObject(mng)
                            .environmentObject(userMng)
                            .environmentObject(viewModel)


            } else if viewModel.userSession != nil && viewModel.isLogin == true {
                CreateAccountView()
            } else {
                LoginView()
            }
        }
        
          
        
        
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


