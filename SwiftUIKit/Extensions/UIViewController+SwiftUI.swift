//
//  UIViewController+SwiftUI.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import SwiftUI
import UIKit

extension UIViewController {
    
    /// Add a SwiftUI view as a child view controller
    /// contained by a UIView.
    func containerWith<Content: View>(swiftUI content: Content) -> UIView {
        let hosting = UIHostingController(rootView: content)

        /// Add as a child of the current view controller.
        addChild(hosting)

        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        hosting.view.backgroundColor = .clear
        
        let container = UIView()
        container.addSubview(hosting.view)
        
        let constraints = [
            hosting.view.topAnchor.constraint(equalTo: container.topAnchor),
            hosting.view.leftAnchor.constraint(equalTo: container.leftAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            hosting.view.rightAnchor.constraint(equalTo: container.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)

        /// Notify the hosting controller that it has
        /// been moved to the current view controller.
        hosting.didMove(toParent: self)
        
        return container
    }
}
