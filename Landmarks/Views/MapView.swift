//
//  MapView.swift
//  Landmarks
//
//  Created by Knut Valen on 01/07/2024.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: Internal

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        // MARK: Internal

        var id: Zoom {
            return self
        }
    }

    var coordinate: CLLocationCoordinate2D

    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }

    var body: some View {
        Map(position: .constant(.region(region)))
    }

    // MARK: Private

    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
