//
//  FormView.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 24.02.2021.
//

import Combine
import SwiftUI

struct LocationFormView: View {
    @ObservedObject var viewModel: FormViewModel
    
    let action = PassthroughSubject<Void, Never>()
    
    var body: some View {
        Form {
            Section(header: Text("Location name")) {
                CustomTextField(
                    title: "ex. Rotterdam",
                    text: $viewModel.name,
                    valid: $viewModel.nameValid)
            }
            
            Section(header: Text("Location coordinate")) {
                CustomTextField(
                    title: "Latitude", keyboard: .decimalPad,
                    text: $viewModel.lat,
                    valid: $viewModel.coordinateValid)
                
                CustomTextField(
                    title: "Longitude", keyboard: .decimalPad,
                    text: $viewModel.lon,
                    valid: $viewModel.coordinateValid)
                
                if viewModel.showButton {
                    Button(action: {
                        action.send(())
                    }, label: {
                        Text("Save location")
                            .fontWeight(.semibold)
                    })
                    .padding([.top, .bottom], 16)
                    .buttonStyle(CustomButtonStyle())
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .buttonStyle(PlainButtonStyle())
    }
}

struct FormViewV_Previews: PreviewProvider {
    static var previews: some View {
        LocationFormView(viewModel: FormViewModel())
    }
}
