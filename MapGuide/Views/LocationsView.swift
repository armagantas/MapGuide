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
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                locationsPreviewStack
            }
        }
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}


extension LocationsView {
    private var header : some View {
        VStack {
            Button(action: viewModel.toggleLocationsList) {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.black)
                    .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: viewModel.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                        .padding()
                        .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                }
            }
            if viewModel.showLocationsList {
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius:20, x:0, y:15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        viewModel.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(viewModel.locations){ location in
                if viewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
