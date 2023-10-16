//
//  TapView.swift
//  MZM
//
//  Created by 예찬 on 10/16/23.
//

import SwiftUI

struct TapView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("맛집 리스트")
                }
            MatZipMapView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("맛집 지도")
                }
        }
        .font(.headline)
    }
}

#Preview {
    TapView()
}
