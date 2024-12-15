//
//  DetailView.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import SwiftUI

struct DetailView: View {
    let user: UserEntity
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(height: Constants.frameHeight)
            }
            Spacer()
        }
        .navigationTitle(user.login)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private struct Constants {
        static let frameHeight: Double = 400
    }
}

#Preview {
    NavigationStack {
        ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
            DetailView(user: UserEntity.user)
        }
    }
}
