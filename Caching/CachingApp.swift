//
//  CachingApp.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import SwiftUI

@main
struct CachingApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: UserEntity.self)
    }
}
