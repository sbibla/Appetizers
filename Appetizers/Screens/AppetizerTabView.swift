//
//  ContentView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Order")
                }
        }
        .accentColor(.BrandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
