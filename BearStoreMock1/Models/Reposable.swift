//
//  Reposable.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import FirebaseFirestore

protocol Reposable {
    var id: String? {get set}
    var createdTime: Timestamp? {get set}
    var userId: String? {get set}
}
