//
//  FormViewController.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 25.02.2021.
//

import Combine
import UIKit

class FormViewController: UIViewController {
    let viewModel: FormViewModel
    let formView: LocationFormView
    var subscription: Cancellable?
    
    init(viewModel: FormViewModel) {
        self.viewModel = viewModel
        self.formView = LocationFormView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        title = "Add new location"
        view = containerWith(swiftUI: formView)
        view.backgroundColor = .systemGroupedBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscription = formView.action
            .sink(receiveValue: saveAndPushLocations)
    }
    
    func saveAndPushLocations() {
        let vm = LocationsViewModel(location: viewModel.location)
        let vc = LocationsViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
}

