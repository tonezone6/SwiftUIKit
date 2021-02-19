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
    /* SwiftUI */ let button = AppleButton()
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
        /* SwiftUI */ let view = DevicesView()
        let vc = UIHostingController(rootView: view)
        navigationController?
            .pushViewController(vc, animated: true)
    }
}
