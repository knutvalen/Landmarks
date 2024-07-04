//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Knut Valen on 04/07/2024.
//

import SwiftUI

struct LandmarkSettings: View {
    // MARK: Internal

    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }

    // MARK: Private

    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
}

#Preview {
    LandmarkSettings()
}
