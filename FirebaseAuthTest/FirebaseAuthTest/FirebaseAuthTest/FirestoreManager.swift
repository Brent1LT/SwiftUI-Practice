//
//  FirestoreManager.swift
//  FirebaseAuthTest
//
//  Created by Brent Bumann on 5/20/24.
//

import Foundation
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    @Published var restaurant: String = ""
    
    init() {
        fetchRestaurant()
        fetchAllRestaurants()
    }
    
    
    func fetchRestaurant() {
        let db = Firestore.firestore()
        
        let docRef = db.collection("Restaurants").document("PizzaMania")
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.restaurant = data["name"] as? String ?? ""
                }
            }
                
        }
    }
    
    func fetchAllRestaurants() {
        let db = Firestore.firestore()
        
        db.collection("Restaurants").getDocuments() { (QuerySnapshot, error) in
            if let error = error {
                print("Error getting doucments: \(error)")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
            
        }
    }
}
