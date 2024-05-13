//
//  OrderView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import SwiftUI

struct OrderView: View {
    
//    @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    
                    Button {
                        print("Order Placed")
                    }label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                    Spacer()
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "The order is empty, add items to complete the order")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
}


//Video stopped at 9:12:58
