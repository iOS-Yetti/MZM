//
//  ContentView.swift
//  MZM
//
//  Created by 예찬 on 10/11/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let seoul = CLLocationCoordinate2D(latitude: 37.537473,
                                              longitude: 126.999799)
}

struct MatZipMapView: View {
    @State private var position: MapCameraPosition = .automatic
    @State private var searchResults: [MKMapItem] = []
    //서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791,
                                                                                  longitude: 126.9782914),
                                                   span: MKCoordinateSpan(latitudeDelta: 1,
                                                                          longitudeDelta: 1))
//    let map = MKMapView()
    var body: some View {
        VStack {
            Map(position: $position) {
                Marker("MZ",systemImage: "fork.knife", coordinate: .seoul)
                    .tint(.blue)
            }
            .mapStyle(.standard (elevation: .realistic))
        }
    }
}

#Preview {
    MatZipMapView()
}

