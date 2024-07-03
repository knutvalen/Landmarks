//
//  Landmark.swift
//  Landmarks
//
//  Created by Knut Valen on 01/07/2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    // MARK: Internal

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category

    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    var image: Image {
        Image(imageName)
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    // MARK: Private

    private var imageName: String
    private var coordinates: Coordinates
}
