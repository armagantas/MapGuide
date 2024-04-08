//
//  MapGuideApp.swift
//  MapGuide
//
//  Created by Armağan Erdem Taş on 8.04.2024.
//

import SwiftUI

@main
struct MapGuideApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
