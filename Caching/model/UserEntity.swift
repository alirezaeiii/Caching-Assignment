//
//  UserEntity.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import Foundation
import SwiftData

@Model
class UserEntity {
    @Attribute(.unique) var id: Int
    var login: String
    var avatarUrl: String
    
    init(id: Int, login: String, avatarUrl: String) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}

// Ensure that the model's conformance to Identifiable is public.
extension UserEntity: Identifiable {}
