//
//  AdminView.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/12/24.
//

import SwiftUI

struct AdminView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        TabView {
            AnalyticsView()
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar.xaxis")
                }
            MenuUpdatesView()
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")

                }
        }
        .accentColor(.BrandPrimary)
    }
}

#Preview {
    AdminView()
        .environmentObject(UserViewModel(user: User(firstName: "Saar", lastName: "Bibla", adminUser: true)))
}
