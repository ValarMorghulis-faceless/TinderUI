//
//  MessageRowView.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 03.12.22.
//

import SwiftUI
import Kingfisher
struct MessageRowView: View {
    var preview: MessagePreview
    var body: some View {
        
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    
            }
            Spacer()
        }
      
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
