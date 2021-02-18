//
//  DevicesViewModel.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import Foundation

class DevicesViewModel: ObservableObject {

    @Published private(set) var devices: [Device] = []
    @Published private(set) var selected: Device?
    
    init() {
        // do some work...
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.devices = Device.devices
        }
    }
    
    func didSelect(_ device: Device) {
        selected = device
    }
}
