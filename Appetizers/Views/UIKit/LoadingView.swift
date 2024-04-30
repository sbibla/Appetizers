//
//  LoadingView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/26/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activitiyIndicatorView = UIActivityIndicatorView(style: .large)
        activitiyIndicatorView.color = UIColor.BrandPrimary
        activitiyIndicatorView.startAnimating()
        return activitiyIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
        
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)            
            ActivityIndicator()
        }
    }
}
