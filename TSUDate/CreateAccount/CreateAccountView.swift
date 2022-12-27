//
//  CreateAccountView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 20.12.22.
//

import SwiftUI
import UIKit
import FirebaseFirestore
import Firebase
import ProgressHUD

struct Gender{
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}


struct CreateAccountView: View {
    
   
    @ObservedObject var storageMng = StorageManager()
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var firestoreMng = FirestoreManager()
    @State var username: String = ""
    
    @State var bio: String = ""
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var birthDate = Date.now
    
    @State private var selectedGender = "Male"
    let genders = ["Male", "Female", "Other"]
    
   

    @State private var images: [UIImage] = [UIImage(named: "plus")!, UIImage(named: "plus")!,UIImage(named: "plus")!,UIImage(named: "plus")!]
    @State private var showSheet1 = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
    @State private var showSheet4 = false
    
//    func updateFirestore() {
//        let db = Firestore.firestore()
//
//        let ref = db.collection("Test").document("PoutineFiesta")
//        ref.updateData(["USERNAME" : "Fukome var"]) {
//            err in
//            if let err = err {
//                print("Error updating document:", err.localizedDescription)
//            } else {
//                print("Document successfully updated")
//            }
//        }
//    }
    @State var ingredients: [Gender] = [Gender(name: "Man"),
                                            Gender(name: "Woman"),
                                            Gender(name: "Other"),]
   @State private var selectedInGender: [String] = []



    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.05222354829, green: 0.3226804733, blue: 0.7275559306, alpha: 1)).opacity(0.3)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                        
                    ScrollView(.vertical, showsIndicators: false) {
                        
                       
                        
                        
                        VStack(alignment: .leading, spacing: 60) {
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text("Create Username")
                                    .font(.system(size: 18, weight: .thin))                            .padding(.leading)
                                
                                CustomTextField(fillin: $username, placeholder: "Create Username")
                                    .frame(width: 300)
                                
                            }
                            .padding([.top,.trailing], 100)
                            Button(action: {
                                viewModel.signOut()
                            }, label: {
                                Text("LOG OUT")
                                    .font(.system(size: 40))
                                    .frame(width: 250, height: 50)
                                    .background(Color.black)
                                    .cornerRadius(20)
                            })
                            .padding()
                        
                            VStack(spacing: 18) {
                                
                                Text("Choose Birth Date")
                                    .font(.system(size: 18, weight: .thin))
                                    .padding(.trailing,25)
                                
                                DatePicker("", selection: $birthDate, in: ...Date.now, displayedComponents: .date)
                                    .labelsHidden()
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .scaleEffect(x: 1.5, y: 1.5)
                                                            
                                //                               Text("Date is \(birthDate, formatter: dateFormatter)")
                            }
                            .padding(.leading, 20)
                            
                           
                                
                            VStack {
                                Text("Choose Your Gender")
                                    .font(.system(size: 18, weight: .thin))

                                Picker("", selection: $selectedGender) {
                                    ForEach(genders, id: \.self) {
                                        Text($0)
                                    }
                                    
                                    }
                                    .scaleEffect(x: 1.5, y: 1.5)
                                    .frame(width: 250)
                                    .pickerStyle(SegmentedPickerStyle())
                                    
                            }
                            .padding(.leading, 80)
                            
                        
                            VStack(spacing: 20) {
                                
                                Text("Intersted In")
                                    .font(.system(size: 18, weight: .thin))
                                
                                ZStack {
                                    VStack(alignment: .leading, spacing: 20) {
                                
                                            ForEach(0..<ingredients.count){ index in
                                                HStack {
                                                    Button(action: {
                                                        ingredients[index].isSelected = ingredients[index].isSelected ? false : true
                                                        selectedInGender.append(ingredients[index].name)
                                                        print(selectedInGender)
                                                    }) {
                                                        HStack{
                                                            if ingredients[index].isSelected {
                                                                Image(systemName: "checkmark.circle.fill")
                                                                    .foregroundColor(.pink)
                                                                    .animation(.easeIn)
                                                            } else {
                                                                Image(systemName: "circle")
                                                                    .foregroundColor(.primary)
                                                                    .animation(.easeOut)
                                                            }
                                                            Text(ingredients[index].name)
                                                                .foregroundColor(.black)
                                                        }
                                                    }.buttonStyle(BorderlessButtonStyle())
                                                }
                                            }
                                        
                                    }
                                }
                            }
                            .padding(.leading)
                           
                            
                
                            VStack {
                                Text("Upload Images")
                                    .font(.system(size: 18, weight: .thin))
                                VStack {
                                    HStack {
                                        Button(action: {
                                       
                                       }, label: {
                                           
                                           HStack {
                                               Image(uiImage: self.images[0])
                                                   .resizable()
                                                   .padding(.all, 4)
                                                   .frame(width: 125, height: 200)
                                                   .background(Color.black.opacity(0.2))
                                                   .aspectRatio(contentMode: .fill)
                                                   .cornerRadius(10)
                                                   .overlay(
                                                   RoundedRectangle(cornerRadius: 10)
                                                       .stroke(Color.black, lineWidth: 1)
                                                   )
                                                   .padding(8)
                                               Image(systemName: self.images[0] == UIImage(named: "plus")! ? "plus" : "x.circle")
                                                   .font(.system(size: 25))
                                                   .frame(width: 40, height: 40)
                                                   .background(Color.white)
                                                   .clipShape(Circle())
                                                   .padding(.leading, -35)
                                                   .padding(.top, -110 )
                                                   .onTapGesture {
                                                      
                                                       if self.images[0] != UIImage(named: "plus")! {
                                                           self.images[0] = UIImage(named: "plus")!
                                                           showSheet1 = false
                                                       } else {
                                                           showSheet1 = true
                                                       }
                                                       
                                                       
                                                               }
                                                
                                                   
                                           }
                                           .sheet(isPresented: $showSheet1) {
                                                           // Pick an image from the photo library:
                                               
                                                       ImagePicker(sourceType: .photoLibrary, selectedImage: self.$images[0])
                                               
                                               
                                                           //  If you wish to take a photo from camera instead:
                                                           // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                                   }
                                           
                                       })
                                        Button(action: {
                                       
                                       }, label: {
                                           
                                           HStack {
                                               Image(uiImage: self.images[1])
                                                   .resizable()
                                                   .padding(.all, 4)
                                                   .frame(width: 125, height: 200)
                                                   .background(Color.black.opacity(0.2))
                                                   .aspectRatio(contentMode: .fill)
                                                   .cornerRadius(10)
                                                   .overlay(
                                                   RoundedRectangle(cornerRadius: 10)
                                                       .stroke(Color.black, lineWidth: 1)
                                                   )
                                                   .padding(8)
                                               Image(systemName: self.images[1] == UIImage(named: "plus")! ? "plus" : "x.circle")
                                                   .font(.system(size: 25))
                                                   .frame(width: 40, height: 40)
                                                   .background(Color.white)
                                                   .clipShape(Circle())
                                                   .padding(.leading, -35)
                                                   .padding(.top, -110 )
                                                   .onTapGesture {
                                                       if self.images[1] != UIImage(named: "plus")! {
                                                           self.images[1] = UIImage(named: "plus")!
                                                           showSheet2 = false
                                                       } else {
                                                           showSheet2 = true
                                                       }
                                                               }
                                                
                                                   
                                           }
                                           .sheet(isPresented: $showSheet2) {
                                                           // Pick an image from the photo library:
                                                       ImagePicker(sourceType: .photoLibrary, selectedImage: self.$images[1])
                                              
                                                           //  If you wish to take a photo from camera instead:
                                                           // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                                   }
                                           
                                       })
                                    }
                                    HStack {
                                        Button(action: {
                                       
                                       }, label: {
                                           
                                           HStack {
                                               Image(uiImage: self.images[2])
                                                   .resizable()
                                                   .padding(.all, 4)
                                                   .frame(width: 125, height: 200)
                                                   .background(Color.black.opacity(0.2))
                                                   .aspectRatio(contentMode: .fill)
                                                   .cornerRadius(10)
                                                   .overlay(
                                                   RoundedRectangle(cornerRadius: 10)
                                                       .stroke(Color.black, lineWidth: 1)
                                                   )
                                                   .padding(8)
                                               Image(systemName: self.images[2] == UIImage(named: "plus")! ? "plus" : "x.circle")
                                                   .font(.system(size: 25))
                                                   .frame(width: 40, height: 40)
                                                   .background(Color.white)
                                                   .clipShape(Circle())
                                                   .padding(.leading, -35)
                                                   .padding(.top, -110 )
                                                   .onTapGesture {
                                                       if self.images[2] != UIImage(named: "plus")! {
                                                           self.images[2] = UIImage(named: "plus")!
                                                           showSheet3 = false
                                                       } else {
                                                           showSheet3 = true
                                                       }
                                                       
                                                               }
                                           }
                                           .sheet(isPresented: $showSheet3) {
                                                           // Pick an image from the photo library:
                                                       ImagePicker(sourceType: .photoLibrary, selectedImage: self.$images[2])

                                                           //  If you wish to take a photo from camera instead:
                                                           // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                                   }
                                           
                                       })
                                        Button(action: {
                                       
                                       }, label: {
                                           
                                           HStack {
                                               Image(uiImage: self.images[3])
                                                   .resizable()
                                                   .padding(.all, 4)
                                                   .frame(width: 125, height: 200)
                                                   .background(Color.black.opacity(0.2))
                                                   .aspectRatio(contentMode: .fill)
                                                   .cornerRadius(10)
                                                   .overlay(
                                                   RoundedRectangle(cornerRadius: 10)
                                                       .stroke(Color.black, lineWidth: 1)
                                                   )
                                                   .padding(8)
                                               Image(systemName: self.images[3] == UIImage(named: "plus")! ? "plus" : "x.circle")
                                                   .font(.system(size: 25))
                                                   .frame(width: 40, height: 40)
                                                   .background(Color.white)
                                                   .clipShape(Circle())
                                                   .padding(.leading, -35)
                                                   .padding(.top, -110 )
                                                   .onTapGesture {
                                                       if self.images[3] != UIImage(named: "plus")! {
                                                           self.images[3] = UIImage(named: "plus")!
                                                           showSheet4 = false
                                                       } else {
                                                           showSheet4 = true
                                                       }
                                                               }
                                                
                                                   
                                           }
                                           .sheet(isPresented: $showSheet4) {
                                                           // Pick an image from the photo library:
                                                       ImagePicker(sourceType: .photoLibrary, selectedImage: self.$images[3])

                                                           //  If you wish to take a photo from camera instead:
                                                           // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                                   }
                                           
                                       })
                                    }
                                }
                                
                    
                            }
                            .padding(.leading, 55)
                            
                            
                            VStack(alignment: .center) {
                                Text("Your Bio here")
                                    .font(.system(size: 18, weight: .thin))                            .padding(.leading)
                                
                                CustomTextField(fillin: $bio, placeholder: "Example: I do not do drugs, I am the drugs.")
                                   // .frame(width: 300)
                                
                            }
                            
                            Button(action: {
                                
//                                if username == "" && birthDate == nil && selectedGender == "" && selectedInGender == [] && bio == "" {
//                                    ProgressHUD.showError("ALL FIELDS ARE RECUIRED")
//                                } else {
//                                    userDataInit()
//                                    ProgressHUD.show()
//                                    firestoreMng.saveUserToFireStore { error in
//                                        if error != nil {
//                                            ProgressHUD.showError(error?.localizedDescription)
//                                        } else {
//                                         //   viewModel.userSession = Auth.auth().currentUser
//                                            viewModel.isLogin = false
//
//                                            ProgressHUD.dismiss()
//                                        }
//                                    }
//                                }
                                
                              pushimages(images)

                                
                                
                                print(Auth.auth().currentUser)
                            }, label: {
                                Text("Create Account")
                                    .font(.system(size: 25, weight: .heavy))
                                    .foregroundColor(Color.pink)
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
                            })
                            
                            
                          
//                            NavigationLink(destination: ChooseInterest(), label: {
//                                Text("Next step")
//                                    .font(.system(size: 25, weight: .heavy))
//                                    .foregroundColor( Color.pink)
//                                  //  .frame(height: 45)
//                                    .padding(.horizontal)
//                                    .frame(width: 250, height: 60)
//                                    .background(Color.white)
//                                    .cornerRadius(25)
//
//                                    .overlay  {
//                                        RoundedRectangle(cornerRadius: 25)
//                                            .stroke(Color.gray, lineWidth: 2)
//                                    }
//
//                                    .padding(.horizontal)
//                                .padding(.bottom)
//                            })
//
//                                .padding(.leading, 75)

                                
                       
                            
                          
                            
                            

                         
                        }
                        
                        
                                            
                    }.padding(.top,-80)
                    
                }.navigationTitle("CREATE ACCOUNT")
               
                
                
                
            }
            
            
            
            
        }
        
    }
    
    func userDataInit() {
        firestoreMng.username = username
        firestoreMng.dateOfBirth = birthDate
        firestoreMng.userGender = selectedGender
        firestoreMng.interestedIn = selectedInGender
        firestoreMng.bio = bio
    }
    
    func pushimages(_ imagearr: [UIImage]) {
        for i in imagearr {
            if i == UIImage(named: "plus")! {
            } else {
                storageMng.uploadPhoto(image: i)
            }
            
        }
    }
       
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

extension UIImageView {
    var isEmpty: Bool { image == nil }
}
