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

    var coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(position: .constant(.region(region)))
    }

    // MARK: Private

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
