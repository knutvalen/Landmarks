//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Knut Valen on 04/07/2024.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: Internal

    @Environment(ModelData.self) var modelData

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")

        } detail: {
            Text("Select a Landmark")
        }
    }

    // MARK: Private

    @State private var showFavoritesOnly = false
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
