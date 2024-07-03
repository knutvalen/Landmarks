//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI

struct CategoryHome: View {
    // MARK: Internal

    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    if let items = modelData.categories[key] {
                        CategoryRow(categoryName: key, items: items)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }

    // MARK: Private

    @State private var showingProfile = false
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
