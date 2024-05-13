//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    var userVM = UserViewModel(user: User(firstName: "", lastName: "", email: "" , extraNapkins: false, frequentRefill: false, adminUser: false))
    var account = AccountViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
                .environmentObject(userVM)
                .environmentObject(account)
        }
    }
}
