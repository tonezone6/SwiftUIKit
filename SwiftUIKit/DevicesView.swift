//
//  ListView.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import SwiftUI

struct DevicesView: View {
    
    @ObservedObject var viewModel: DevicesViewModel
        
    var body: some View {
        List(viewModel.devices) { device in
            Label(
                device.name,
                systemImage: device.icon
            )
            .onTapGesture {
                viewModel.didSelect(device)
            }
        }
        .navigationTitle("Devices")
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView(viewModel: DevicesViewModel())
    }
}
