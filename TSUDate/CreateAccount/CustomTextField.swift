//
//  CustomTextField.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 20.12.22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var fillin: String
    
    let placeholder: String
    
    var body: some View {
       
            ZStack(alignment: .trailing) {
                Color.white.opacity(0.9)
                
                TextField(placeholder, text: $fillin)
                  //  .foregroundColor(Color.textPrimary)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: 45)
                .padding(.horizontal)
                
              
                
            }
            
            .frame(height: 50)
            .cornerRadius(20)
            .overlay  {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
            }
              .padding(.horizontal)
//            .padding(.bottom)
           
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(fillin: .constant("HEHEHE"), placeholder: "HEHEHE")
    }
}
