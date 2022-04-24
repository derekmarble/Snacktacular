//
//  SnackUsers.swift
//  Snacktacular
//
//  Created by Derek Marble on 4/23/22.
//

import Foundation
import Firebase

class SnackUsers {
    var userArray: [SnackUser] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ()) {
        db.collection("spots").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("Error: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.userArray = [] // clean out existing user array since new data will load
            //there are querySnapshot!.documents.count documents in the snapshot
            for document in querySnapshot!.documents {
                //you'll have to make sure you have a dictionary initializer in the singular class
                let snackUser = SnackUser(dictionary: document.data())
                snackUser.documentID = document.documentID
                self.userArray.append(snackUser)
            }
            completed()
        }
        
    }
}

