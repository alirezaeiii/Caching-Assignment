//
//  ViewModel.swift
//  Caching
//
//  Created by Ali on 11/15/24.
//

import Foundation
import SwiftData

@Observable
class ViewModel {
    
    var totalQuakes: Int = 0
    
    func update(modelContext: ModelContext) {
        totalQuakes = UserEntity.totalQuakes(modelContext: modelContext)
    }
}
