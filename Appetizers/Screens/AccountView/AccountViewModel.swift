//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Saar Bibla on 5/1/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data? //Any change will save locally
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else {return}
        
        //encode the user to data and save to userdefaults version of SwiftUI
        do {
            let data = try JSONEncoder().encode(user)
            userData = data //This will ensure it's saved to local since the var is @AppStorage
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.InvalidUserData
        }
    }
    
    
    func retrieveUser() {
        guard let userData = userData else {return} //First launch, there's no user data
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.InvalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.InvalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.InvalidEmail
            return false
        }
        
        return true
    }

}
