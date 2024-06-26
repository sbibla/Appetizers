//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    @EnvironmentObject var order: Order

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
//                        .swipeActions(allowsFullSwipe: false) {
//                            Button(role: .destructive) {
//                                print("Delete")
//                            } label: {
//                                Label("Delete", systemImage: "trash.circle")
//                            }
//                        }
                    
                        .swipeActions(allowsFullSwipe: false) {
                            Button() {
                                print("Favorite")
                            } label: {
                                Label("Favorite", systemImage: "star.circle")
                            }.tint(.blue)
                        }
                    
                        .swipeActions(edge: .leading) {
                            Button() {
                                print("Add to order")
                                order.add(appetizer)
                            } label: {
                                Label("Add to Order", systemImage: "fork.knife.circle")
                            }.tint(.green)
                        }
                }
                .navigationTitle("🍦 Appetizers")
                .disabled(viewModel.isShowingDetail)
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .onDisappear{
                viewModel.isShowingDetail = false
            }
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizersListView()
}
