//
//  AccountView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }.submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .submitLabel(.continue)
                    DatePicker("Birthday", selection: $viewModel.user.birthDate,
                               in: Date().oneHundreedTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                        userVM.user = viewModel.user
                    }label: {
                        Text("Save Changes")
                    }
                    
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequest Refills", isOn: $viewModel.user.frequentRefill)
                }
                
                Section(header: Text("Admin")) {
                    Toggle("Login as Admin", isOn: $viewModel.user.adminUser)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🙇🏻 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil //Dismiss the keyboard
                    }
                }
            }
        }
        .onAppear{
            viewModel.retrieveUser()
            userVM.user = viewModel.user
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
        .environmentObject(UserViewModel(user: User(firstName: "Saar", lastName: "Bibla", adminUser: true)))
}

