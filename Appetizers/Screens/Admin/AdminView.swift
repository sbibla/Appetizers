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
        
        HStack {
            Text("Welcome \(userVM.user.firstName),")
            if userVM.user.adminUser == true {
                Text("You are an Admin")
            } else {
                Text("You are a regular user")
            }
        }
    }
}

#Preview {
    AdminView()
}
