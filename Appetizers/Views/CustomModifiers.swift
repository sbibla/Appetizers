//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/8/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.BrandPrimary)
            .controlSize(.large)
    }
}
