//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI

struct ProfileHost: View {
    // MARK: Internal

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }

    // MARK: Private

    @State private var draftProfile = Profile.default
}

#Preview {
    ProfileHost()
}
