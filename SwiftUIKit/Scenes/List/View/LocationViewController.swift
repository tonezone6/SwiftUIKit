//
//  LocationViewController.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 25.02.2021.
//

import UIKit

class LocationsViewController: UIViewController {
    let listView: LocationsView
    
    init(viewModel: LocationsViewModel) {
        self.listView = LocationsView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        title = "All locations"
        view = containerWith(swiftUI: listView)
        view.backgroundColor = .systemBackground
    }
}
