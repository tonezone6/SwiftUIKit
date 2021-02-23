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
    let button = AButton(title: "Devices") // swiftUI
    var subscription: Cancellable?
    
    override func loadView() {
        view = containerWith(swiftUI: button)
        view.backgroundColor = .systemGroupedBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscription = button.tap
            .sink(receiveValue: pushDevices)
    }
    
    func pushDevices() {
        let view = DevicesView() // swiftUI
        let vc = UIHostingController(rootView: view)
        navigationController?.pushViewController(vc, animated: true)
    }
}
