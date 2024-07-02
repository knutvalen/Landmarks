//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Knut Valen on 02/07/2024.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: Internal

    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }

    // MARK: Private

    @State private var showFavoritesOnly = true
}

#Preview {
    LandmarkList()
}
