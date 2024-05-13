//
//  ContentView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var account: AccountViewModel
    
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                    //                    Image(systemName: "house.fill")
                    //                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            
            OrderView()
                .tabItem {Label("Order", systemImage: "bag")}
                .badge(order.items.count)
            if  userVM.user.adminUser {
                AdminView()
                    .tabItem {
                        Label("Admin", systemImage: "shield.fill")
                    }
            }
        }
        .accentColor(.BrandPrimary)
        .onAppear {
            account.retrieveUser()
            userVM.user = account.user
            print("Found user \(account.user.firstName), Admin Status: \(account.user.adminUser)")
        }
    }
}

#Preview {
    AppetizerTabView()
}
