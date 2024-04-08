//
//  LocationsView.swift
//  MapGuide
//
//  Created by Armağan Erdem Taş on 9.04.2024.
//

import SwiftUI



struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
