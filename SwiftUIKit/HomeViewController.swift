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

    var button: RoundedButton?
    var subscriptions: [AnyCancellable] = []
    
    override func loadView() {
        button = RoundedButton(title: "Show devices")
        
        /// Get the view container
        /// for the SwiftUI button.
        let container = containerWith(swiftUI: button)
        
        view = container
        view.backgroundColor = .systemGroupedBackground
        view.setNeedsLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button?.tap
            .sink(receiveValue: pushDevices)
            .store(in: &subscriptions)
    }
    
    func pushDevices() {
        let vm = DevicesViewModel()
        
        vm.$selected
            .compactMap { $0 }
            .map(\.name)
            .sink(receiveValue: { print($0) })
            .store(in: &subscriptions)
        
        let view = DevicesView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        
        navigationController?
            .pushViewController(vc, animated: true)
    }
}
