//
//  UserEntity+UserDTO.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import SwiftData
import OSLog

extension UserEntity {
    
    convenience init(from user: UserDTO) {
        self.init(id: user.id, login: user.login, avatarUrl: user.avatarUrl)
    }
}

extension UserDTO {
    /// A logger for debugging.
    fileprivate static let logger = Logger(subsystem: "com.sample.Caching", category: "parsing")
    
    @MainActor
    static func refresh(modelContext: ModelContext) async {
        do {
            logger.debug("Refreshing the data store...")
            let users = try await fetchUsers()
            for user in users {
                let userEntity = UserEntity(from: user)
                modelContext.insert(userEntity)
            }
            logger.debug("Refresh complete.")

        } catch let error {
            logger.error("\(error.localizedDescription)")
        }
    }

    
}
