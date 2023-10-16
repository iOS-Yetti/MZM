//
//  SearchView.swift
//  MZM
//
//  Created by 예찬 on 10/16/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchQueryString = ""
    var datas = (0...100).map(String.init).map(SomeData.init)
    var filteredDatas: [SomeData] {
        if searchQueryString.isEmpty {
            return datas
        } else {
            return datas.filter { $0.name.localizedStandardContains(searchQueryString) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredDatas) { data in
                NavigationLink {
                    SomeView(name: data.name)
                } label: {
                    Text(data.name)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("나만의 맛집")
        }
        .searchable(
            text: $searchQueryString,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "맛집 검색"
        )
        .onSubmit(of: .search) {
            print("검색 완료: \(searchQueryString)")
        }
    
//        .onChange(of: searchQueryString, initial: true) { newValue, arg  in
//            // viewModel 사용 시 이곳에서 새로운 값 입력
//            print("검색 입력: \(newValue)")
//            print(arg)
//        }
    }
        
}

struct SomeView: View {
    var name: String
    
    var body: some View {
        Text(name)
    }
}

struct SomeData: Identifiable {
    var name: String
    var id: String { self.name }
}

#Preview {
    SearchView()
}
