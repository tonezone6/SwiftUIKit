//
//  ViewController.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import SwiftUI
import UIKit

class HomeViewController: UIViewController {

    var button: AppleButton? // SwiftUI view.
    var cancellable: AnyCancellable?
    
    override func loadView() {
        button = AppleButton()
        view = containerWith(swiftUI: button)
        view.backgroundColor = .systemGroupedBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = button?.tap
            .sink(receiveValue: pushDevices)
    }
    
    func pushDevices() {
        let viewModel = DevicesViewModel()
        let view = DevicesView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)

        navigationController?
            .pushViewController(controller, animated: true)
    }
}
