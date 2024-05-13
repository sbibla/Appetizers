//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/30/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
                
            }
            
            Spacer()
            
            Button{
              print("button - Add to order")
//                order.items.append(appetizer)
                order.add(appetizer)
                isShowingDetail = false //dismiss the detail view after adding order
            }label: {
//                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
            
        }
        .frame(maxWidth: 300, maxHeight: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
            } label: {
                    XDismissButton()
            }
        , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer1, isShowingDetail: .constant(true) )
}

struct NutritionInfo: View {
    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text(value)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
