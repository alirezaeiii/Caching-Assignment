//
//  UserDTO.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import Foundation

struct UserDTO : Decodable {
    let id: Int
    let login: String
    let avatarUrl: String
}

extension UserDTO {
    static func fetchUsers() async throws -> [UserDTO] {
        let url = URL(string: Constants.followersEndPoint)!

        let session = URLSession.shared
        guard let (data, response) = try? await session.data(from: url),
              let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw DownloadError.missingData
        }

        do {
            // Decode the GeoJSON into a data model.
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode([UserDTO].self, from: data)
        } catch {
            throw DownloadError.wrongDataFormat(error: error)
        }
    }
    
    private struct Constants {
            private static let endPoint = "https://api.github.com/users/alirezaeiii/"
            static let followersEndPoint = endPoint + "followers"
        }
}

enum DownloadError: Error {
    case wrongDataFormat(error: Error)
    case missingData
}
