//
//  PageView.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI

struct PageView<Page: View>: View {
    // MARK: Internal

    var pages: [Page]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, pages: pages)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }

    // MARK: Private

    @State private var currentPage = 0
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
