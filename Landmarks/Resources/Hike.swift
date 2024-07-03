//
//  Hike.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }

    static var formatter = LengthFormatter()

    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
}
