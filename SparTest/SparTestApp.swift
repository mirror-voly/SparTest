//
//  SparTestApp.swift
//  SparTest
//
//  Created by mix on 06.08.2024.
//

import SwiftUI

@main
struct SparTestApp: App {
    
    @State private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
            .environment(dataManager)
        }
    }
}
