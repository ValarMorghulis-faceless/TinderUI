//
//  LoginView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 17.12.22.
//

import SwiftUI
import ProgressHUD
import Firebase
struct LoginView: View {
    @State private var email: String = ""
    
    @State private var showingSheet = false
    
    @State private var password: String = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showView = false
    
    
    var body: some View {
       NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.05222354829, green: 0.3226804733, blue: 0.7275559306, alpha: 1)).opacity(0.5)
                    .ignoresSafeArea()
                VStack {
                    Text("TSU DATE")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.trailing, 150)
                        .padding(.top, 150)
                        .padding(.bottom, 50)
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        TextField("Email", text: $email)
                            .modifier(EmailTextfieldView())
                        TextField("Password", text: $password)
                            .modifier(EmailTextfieldView())
                        
                        RegisterLogButton(text: "LOG IN") {
                            ProgressHUD.show()
                            
                          

                            if email != "" && password != "" {
                                viewModel.login(email: email.lowercased(), password: password) { error, isEmailverified in
                                    if error != nil {
                                        ProgressHUD.showError(error!.localizedDescription)
                                    } else if isEmailverified {
                                     //   showView = true
                                        ProgressHUD.showSuccess("ALLES GOOOOOOD")
                                     
                                     
                                        
                                    } else {
                                        ProgressHUD.showError("Verify your email")

                                    }
                                }
                            }else {
                                    ProgressHUD.showError("All fields are required!")
                                }
                                //                                    if error != nil {
                                //                                        ProgressHUD.showError(error!.localizedDescription)
                                //                                    }
                                //
                                //                                }
                                //                            }
                                //                                else {
                                //                                    ProgressHUD.showError("All fields are required!")
                                //                                }
                            
                        }
                            .padding(.top, 10)
                       
                        Button(action: {
                            if email == "" {
                                ProgressHUD.showError("Fill in your email address")
                            } else {
                                ProgressHUD.show()
                                Auth.auth().sendPasswordReset(withEmail: email.lowercased()) { error in
                                    
                                    if error != nil {
                                        ProgressHUD.showError(error?.localizedDescription)
                                    } else {
                                        ProgressHUD.showSuccess("Password reset link is sent to your email.")
                                    }
                                    
                                }
                                    
                                }
                        }, label: {
                            Text("Forgot password?")
                                .font(.system(size: 15))
                                .foregroundColor(Color.white)
                                .padding(.top, -10)
                        })
                            
                      
                        
                        
                        Text("Do not have an account? then Register")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                    
                        NavigationLink(destination: RegisterView(), label: {
                            Text("REGISTER")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor( Color.pink)
                              //  .frame(height: 45)
                                .padding(.horizontal)
                                .frame(width: 250, height: 60)
                                .background(Color.white)
                                .cornerRadius(25)
                                
                                .overlay  {
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.gray, lineWidth: 2)
                                }
                                
                                .padding(.horizontal)
                            .padding(.bottom)
                        }).modifier(HideNavigationView())
                        
                        
                        
                        
                        Spacer().frame(height: 70)
                        
                        Text("or log in with")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                print("12314")
                            }, label: {
                                
                                Image("FacebookLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 80)
                            })
                            
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Image("GoogleLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 55)
                            })
                            Spacer()

                        }
                            

                    }
                    Spacer().frame(height: 130)
                    
                }
            }
       }
          .modifier(HideNavigationView())
    }
    func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: CreateAccountView().environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()

    }
}
