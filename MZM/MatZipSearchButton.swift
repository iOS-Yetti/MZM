//
//  MatZipSearchButton.swift
//  MZM
//
//  Created by 예찬 on 10/11/23.
//

import SwiftUI
import MapKit

struct MatZipSearchButton: View {
    @Binding var searchResults: [MKMapItem]
    
    var body: some View {
        HStack {
            Group {
                Button {
                    search(for: "coffee")
                } label: {
                    Label("Coffee", systemImage: "cup.and.saucer")
                }
                
                Button {
                    search(for: "음식점")
                } label: {
                    Label("restaurant", systemImage: "fork.knife")
                }
            }
            .padding()
            .frame(width: 100, height: 50)
            .background(Capsule().fill(.blue))
            .buttonStyle(.borderedProminent)
        }
        .labelStyle(.iconOnly)
    }
    
    
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        
        search.start { response, error in
            guard error == nil else {
                print("에러 발생")
                return
            }
            
            if let response = response {
                for item in response.mapItems {
                    let placemark = item.placemark
                    let name = placemark.name
                    let address = placemark.title
                    let coordinate = placemark.coordinate
                    
                    print("장소 이름: \(name ?? "알 수 없음")")
                    print("주소: \(address ?? "알 수 없음")")
                    print("좌표: \(coordinate.latitude), \(coordinate.longitude)")
                }
            }
        }
        //        request.resultTypes = .pointOfInterest
        //        request.region = MKCoordinateRegion(center: .seoul, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        //
        //        Task {
        //            let search = MKLocalSearch(request: request)
        //            let response = try? await search.start()
        //            searchResults = response?.mapItems ?? []
        //        }
    }
    
}
