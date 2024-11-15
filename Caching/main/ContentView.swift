//
//  ContentView.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.scenePhase) private var scenePhase
    
    @Query private var users: [UserEntity]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user)  {
                        UserRow(user: user)
                    }
                }
            }.navigationDestination(for: UserEntity.self) { user in
                DetailView(user: user)
            }
            .navigationTitle("Followers")
            .refreshable {
                await UserDTO.refresh(modelContext: modelContext)
            }
            .overlay {
                if users.count == 0 {
                    ContentUnavailableView("Refresh to load earthquakes", systemImage: "globe")
                }
            }
            .onChange(of: scenePhase) { _, scenePhase in
                if scenePhase == .active {
                    viewModel.update(modelContext: modelContext)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
        .modelContainer(for: UserEntity.self, inMemory: true)
}
