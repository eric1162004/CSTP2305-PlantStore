//
//  AppUser.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-07.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// App User store user information such as name, email and profile image
struct AppUser: Identifiable, Codable, Reposable {
    
    @DocumentID var id: String?
    
    var name: String
    var email: String
    var imageUUID: String = ""
    var imageUrl: String = ""
    
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}
