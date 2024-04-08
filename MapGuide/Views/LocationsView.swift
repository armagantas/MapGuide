//
//  LocationsView.swift
//  MapGuide
//
//  Created by Armağan Erdem Taş on 9.04.2024.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
