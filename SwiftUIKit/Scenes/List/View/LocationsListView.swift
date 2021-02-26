//
//  ListView.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import SwiftUI

struct LocationsListView: View {
    @ObservedObject var viewModel: LocationsViewModel
        
    var body: some View {
        if viewModel.loading {
            ProgressView()
        } else {
            List(viewModel.allLocations, rowContent: LocationRow.init)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationsViewModel(location: .empty)
        return LocationsListView(viewModel: viewModel)
    }
}
