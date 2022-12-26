//
//  RegisterView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 17.12.22.
//

import SwiftUI
import ProgressHUD

struct RegisterView: View {
    @State var email: String = ""
    
    @State var password: String = ""
    
    @State var repeatpassword: String = ""
    
    @State var sex: String = "MALE"
    
    @State var dateOfBirth = Date()
    
    @State var username: String = "Fukome"
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack {
                
                Color(#colorLiteral(red: 0.05222354829, green: 0.3226804733, blue: 0.7275559306, alpha: 1)).opacity(0.5)
                    .ignoresSafeArea()
                VStack {
                    Text("TSU DATE")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.trailing, 150)
                        .padding(.top, 150)
                     //   .padding(.bottom, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        TextField("Email", text: $email)
                            .modifier(EmailTextfieldView())
                        TextField("Create Password", text: $password)
                            .modifier(EmailTextfieldView())
                        TextField("Repeat password", text: $repeatpassword)
                            .modifier(EmailTextfieldView())
                        


                        
                        RegisterLogButton(text: "REGISTER") {
                            if isTextDataIMputed() {
                                if password == repeatpassword {
                                    ProgressHUD.show()
                                    viewModel.register(email: email.lowercased(), password: password) { error in
                                        if error != nil {
                                            ProgressHUD.showError(error?.localizedDescription)
                                        } else {
                                            ProgressHUD.showSuccess("Email verification is sent. Verify your email and then sign in")
                                            presentationMode.wrappedValue.dismiss()

                                        }
                                    }
                                }else {
                                    ProgressHUD.showError("Passwords don't match!")
                                }




                            } else {
                                ProgressHUD.showError("All fields are required!")

                            }
                            
                        }
                            
                        
                            .padding(.top, 10)
                        
                        Text("have an excisting account? then LOG IN")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                    
                        RegisterLogButton(text: "LOG IN") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        Spacer().frame(height: 70)
                        
                        Text("or log in with")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                
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
        }.modifier(HideNavigationView())
    }
    private func isTextDataIMputed() -> Bool {
        return email != "" && password != "" && repeatpassword != ""
    }
//    private func registerUser()  {
//        
//        ProgressHUD.show()
//        
//        
//        FUser.registerUserWith(email: email.lowercased(), password: password, userName: username, sex: sex, dateOfBirth: dateOfBirth) { error in
//            
//            
//            if error == nil {
//                ProgressHUD.showSuccess("Verification email sent!")
//                presentationMode.wrappedValue.dismiss()
//
//            } else {
//                ProgressHUD.showError(error!.localizedDescription)
//            }
//        }
//    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
