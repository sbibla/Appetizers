//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/30/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
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
                    VStack(spacing: 5) {
                        Text("Calories")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(appetizer.calories)")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(appetizer.carbs) g")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack(spacing: 5) {
                        Text("Protein")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(appetizer.protein) g")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                
            }
            
            Spacer()
            
            Button{
              print("button - Add to order")
            }label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(.brandPrimary)
                    .cornerRadius(10)
                    
            }.padding(.bottom, 30)
            
        }
        .frame(maxWidth: 300, maxHeight: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            print("Close Card")
            isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            }
        , alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer1, isShowingDetail: .constant(true) )
}
