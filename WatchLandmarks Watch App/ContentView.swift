//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Knut Valen on 04/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
