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
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
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
