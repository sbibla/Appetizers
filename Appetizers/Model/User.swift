//
//  User.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/2/24.
//

import SwiftUI

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentRefill  = false
    var adminUser       = false
}

final class UserViewModel: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user
    }    
}
