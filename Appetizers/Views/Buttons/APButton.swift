//
//  APButton.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/30/24.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 260, height: 50)
                .foregroundColor(.white)
                .background(.brandPrimary)
                .cornerRadius(10)

    }
}

#Preview {
    APButton(title: "Test Title")
}
