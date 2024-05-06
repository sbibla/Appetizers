//
//  User.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/2/24.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentRefill  = false
    
}
