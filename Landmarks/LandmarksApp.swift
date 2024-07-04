//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Knut Valen on 27/06/2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // MARK: Internal

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }

        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }

    // MARK: Private

    @State private var modelData = ModelData()
}
