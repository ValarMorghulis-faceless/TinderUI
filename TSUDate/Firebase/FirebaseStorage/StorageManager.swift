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
    
    func uploadPhoto(image: UIImage) {
        let storageRef = storage.reference()
        
        let imageData = image.jpegData(compressionQuality: 0.2)
        
        guard imageData != nil else {
            return
        }
        
        let fileRef = storageRef.child("\(Auth.auth().currentUser?.uid)/\(UUID().uuidString).jpg")
        let uploadTask = fileRef.putData(imageData!) { metaData, error in
            if error != nil && metaData == nil{
                print(error?.localizedDescription)
            }
        }
        
    }
    
    
    
    
    
    
    //    let storage = Storage.storage()
    //
    //
    //    func upload(image: UIImage) {
    //        let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid)/images")
    //        let data = image.jpegData(compressionQuality: 0.2)
    //        let metadata = StorageMetadata()
    //        metadata.contentType = "image.jpg"
    //        if let data = data {
    //            storageRef.putData(data, metadata: metadata) { metadata, error in
    //                if let error = error {
    //                    print("Error while uploading file:", error)
    //                }
    //                if let metadata = metadata {
    //                    print("Metadata: ", metadata)
    //                }
    //            }
    //        }
    //    }
    
    
}
