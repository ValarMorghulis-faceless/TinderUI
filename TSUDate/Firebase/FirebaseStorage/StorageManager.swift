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

//let storage = Storage.storage()

class StorageManager: ObservableObject {
    
    let storage = Storage.storage()

//    func uploadPhoto(_ image: UIImage, completion: @escaping(_ documentLink: String?) -> Void) {
//        let storageRef = storage.reference(forURL: "gs://tsudate-7c25e.appspot.com").child("\(Auth.auth().currentUser?.uid)/\(UUID().uuidString).jpg")
//
//        let imageData = image.jpegData(compressionQuality: 0.5)
//
//        var task: StorageUploadTask!
//
//        task = storageRef.putData(imageData!, metadata: nil, completion: { metadata , error in
//            task.removeAllObservers()
//            if error != nil {
//                print("error uploading image", error?.localizedDescription)
//                return
//            }
//            storageRef.downloadURL { url, error in
//                guard let downloadUrl = url else {
//                    completion(nil)
//                    return
//                }
//                print("we have uploaded image to ", downloadUrl.absoluteString)
//                completion(downloadUrl.absoluteString)
//            }
//        })
//
//    }
    
    //    let storage = Storage.storage()
    //
    
    func uploadPhoto(image: UIImage) {
            let storageRef = storage.reference().child("\(Auth.auth().currentUser?.uid)/\(UUID().uuidString).jpg")
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
