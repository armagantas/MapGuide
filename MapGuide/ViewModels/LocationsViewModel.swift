//
//  LocationsViewModel.swift
//  MapGuide
//
//  Created by Armağan Erdem Taş on 9.04.2024.
//

import Foundation

class LocationsViewModel : ObservableObject {
    @Published var locations: [Location]
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
