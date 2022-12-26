//
//  ImageUploadView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 20.12.22.
//

import SwiftUI

struct ImageUploadView: View {
    
    let action: () -> Void
    

    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }, label: {
                ZStack {
                    Color.gray.opacity(0.5)
                    
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 15)
                        .foregroundColor(Color.pink)
                    
                    
                }
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                )
                .frame(width: 100, height: 150)
                .cornerRadius(10)
            })
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView(){
            
        }
    }
}
