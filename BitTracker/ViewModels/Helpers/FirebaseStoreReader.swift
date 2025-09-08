//
//  FirebaseViewModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import Foundation
import Firebase

class FirebaseStoreReader {
 
    func fetchAPIKey(completion: @escaping (String?) -> Void) {
        
        let db = Firestore.firestore()
        let docRef = db.collection("btApiKey").document("GqEfMf475aeBZfNFvSX8")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let apiKey = document.data()?["APIKey"] as? String {
                    completion(apiKey)
                } else {
                    print("API key not found")
                    completion(nil)
                }
            } else {
                print("Document does not exist")
                completion(nil)
            }
        }
    }

    
}
