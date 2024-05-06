//
//  Alert.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/26/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Network Alert
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support.") ,
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request. Please check your internet connection"),
                                            dismissButton: .default(Text("OK")))
    
    //MARK: - Account Alert
    static let InvalidForm      = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all the fields in teh form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    static let InvalidEmail     = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("OK")))
    //MARK: - Saving user to UserDefaults
    static let userSaveSuccess      = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("OK")))
    static let InvalidUserData      = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dismissButton: .default(Text("OK")))
}
