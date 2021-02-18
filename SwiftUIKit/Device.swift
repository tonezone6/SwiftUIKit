//
//  Device.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

struct Device: Identifiable, Hashable {
    let id: Int
    let icon: String
    let name: String
}

extension Device {
    
    static var devices: [Device] {
        [
            Device(id: 1, icon: "appletv.fill", name: "Apple TV"),
            Device(id: 2, icon: "homepod.fill", name: "HomePod"),
            Device(id: 3, icon: "desktopcomputer", name: "iMac")
        ]
    }
}
