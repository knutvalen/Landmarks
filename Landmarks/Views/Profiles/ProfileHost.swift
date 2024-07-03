//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI

struct ProfileHost: View {
    // MARK: Internal

    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                Text("Profile Editor")
            }
        }
        .padding()
    }

    // MARK: Private

    @State private var draftProfile = Profile.default
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
