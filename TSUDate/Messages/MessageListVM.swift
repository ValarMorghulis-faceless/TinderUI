//
//  MessageListVM.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 03.12.22.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    func loadPreviews() {
        // Handle networking to load messagePreviews from a sercver
        self.messagePreviews = MessagePreview.examples
    }
}
