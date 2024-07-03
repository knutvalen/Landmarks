//
//  ContentView.swift
//  Landmarks
//
//  Created by Knut Valen on 27/06/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: Internal

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }

    // MARK: Private

    @State private var selection: Tab = .featured
}

#Preview {
    ContentView()
        .environment(ModelData())
}
