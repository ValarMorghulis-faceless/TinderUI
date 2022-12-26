//
//  StorageManager.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 21.12.22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage
import UIKit


class StorageManager: ObservableObject {
    let storage = Storage.storage()
    
    
    func upload(image: UIImage) {
        let storageRef = storage.reference().child("images/\(Auth.auth().currentUser?.uid)")
        let data = image.jpegData(compressionQuality: 0.2)
        let metadata = StorageMetadata()
        metadata.contentType = "image.jpg"
        if let data = data {
            storageRef.putData(data, metadata: metadata) { metadata, error in
                if let error = error {
                    print("Error while uploading file:", error)
                }
                if let metadata = metadata {
                    print("Metadata: ", metadata)
                }
            }
        }
    }
}
