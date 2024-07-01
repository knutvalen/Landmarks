//
//  MapView.swift
//  Landmarks
//
//  Created by Knut Valen on 01/07/2024.
//

import MapKit
import SwiftUI

struct MapView: View {
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }

    var body: some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    MapView()
}
