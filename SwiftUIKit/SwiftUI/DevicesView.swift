//
//  ListView.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import SwiftUI

struct DevicesView: View {
    @ObservedObject var viewModel = DevicesViewModel()
        
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .finished(let devices):
            List(devices, rowContent: DeviceRow.init)
        case .failed(let error):
            Text(error.localizedDescription)
        }
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView(viewModel: DevicesViewModel())
    }
}
