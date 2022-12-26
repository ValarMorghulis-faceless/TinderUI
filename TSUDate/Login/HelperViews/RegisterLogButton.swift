//
//  RegisterLogButton.swift
//  CustomLogin
//
//  Created by Giorgi Samkharadze on 07.12.22.
//

import SwiftUI

struct RegisterLogButton: View {
    
    let text: String
    
    let action: () -> Void
    var body: some View {
                Button(action: {
                    action()
                }, label: {
                    Text(text)
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(text == "LOG IN" ? Color.white : Color.pink)
                      //  .frame(height: 45)
                        .padding(.horizontal)
                        .frame(width: 250, height: 60)
                        .background(text == "LOG IN" ? Color.pink : Color.white)
                        .cornerRadius(25)
                        
                        .overlay  {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 2)
                        }
                        
                        .padding(.horizontal)
                    .padding(.bottom)
                    
                        
                })
                
                
            
            
    
    }
}

struct RegisterLogButton_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLogButton(text: "LOG IN") {
            
        }
            
        
            
        
    }
}
