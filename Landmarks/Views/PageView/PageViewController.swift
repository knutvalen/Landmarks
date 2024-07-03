//
//  PageViewController.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]

    func updateUIViewController(_ uiViewController: UIPageViewController, context _: Context) {
        uiViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true
        )
    }

    func makeUIViewController(context _: Context) -> UIPageViewController {
        return UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
    }
}
