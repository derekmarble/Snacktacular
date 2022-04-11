//
//  Reviews.swift
//  Snacktacular
//
//  Created by Derek Marble on 4/11/22.
//

import Foundation
import Firebase

class Reviews {
    var reviewArray: [Review] = []
    
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
}
