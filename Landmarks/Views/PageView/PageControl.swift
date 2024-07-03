//
//  PageControl.swift
//  Landmarks
//
//  Created by Knut Valen on 03/07/2024.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    class Coordinator: NSObject {
        // MARK: Lifecycle

        init(_ control: PageControl) {
            self.control = control
        }

        // MARK: Internal

        var control: PageControl

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }

    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context _: Context) {
        uiView.currentPage = currentPage
    }
}
