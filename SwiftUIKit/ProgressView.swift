//
//  ProgressView.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 19.02.2021.
//

import SwiftUI

// Using UIKit activity indicator.

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct ProgressView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.secondarySystemBackground
                    .edgesIgnoringSafeArea(.all)
                ActivityIndicator(style: .large)
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
