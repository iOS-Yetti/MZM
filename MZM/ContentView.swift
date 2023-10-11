//
//  ContentView.swift
//  MZM
//
//  Created by 예찬 on 10/11/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        
        Map(position: $position) {
            Annotation("Parking", coordinate: .parking) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: "car")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
            
            ForEach(searchResults, id: \.self) { result in
                Marker(item: result)
                
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
            }
            
        }
        .onChange(of: searchResults) {
            position = .automatic
        }
    }
    
}



#Preview {
    ContentView()
}

