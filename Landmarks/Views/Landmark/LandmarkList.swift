//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Knut Valen on 02/07/2024.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: Internal

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        // MARK: Internal

        var id: FilterCategory { self }
    }

    @Environment(ModelData.self) var modelData

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }

    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Toggle(isOn: $showFavoritesOnly, label: {
                            Text("Favorites only")
                        })

                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }

    // MARK: Private

    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
