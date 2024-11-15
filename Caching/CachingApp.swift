//
//  CachingApp.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import SwiftUI

@main
struct CachingApp: App {
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(for: UserEntity.self)
    }
}
