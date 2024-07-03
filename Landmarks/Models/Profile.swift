//
//  Profile.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import Foundation

struct Profile {
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        // MARK: Internal

        var id: String { rawValue }
    }

    static let `default` = Profile(username: "g_kumar")

    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
}
