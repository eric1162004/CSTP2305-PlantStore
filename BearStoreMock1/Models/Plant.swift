//
//  Plant.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Plant: Identifiable, Codable, Reposable {
    
    // document id is populated by firestoreswift at runtime
    @DocumentID var id: String?
    
    var name: String
    var description: String
    
    var imageUUID: String = ""
    var imageUrl: String = ""
    
    // created time is set by firebase when the document initially create
    @ServerTimestamp var createdTime: Timestamp?
    
    // userId is populated by FirestoreRepository when the document initially create
    var userId: String?
}
