//
//  Appetizer.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/17/24.
//

import Foundation

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String //Needs to match exactly what's in the JSON
    let calories: Int
    let protein: Int
    let carbs: Int
}

/* Read from S3 Format*/
//struct Appetizer: Codable, Identifiable {
//    let imageURL: String //Needs to match exactly what's in the JSON
//    let id: Int
//    let protein: Int
//    let name: String
//    let calories: Int
//    let description: String
//    let carbs: Int
//    let price: Double
//}



struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer1 = Appetizer(id: 001, name: "Mock Appetizer1", description: "Yummie burnt bannana with some long text", price: 6.51, imageURL: "", calories: 10, protein: 20, carbs: 30)
    static let sampleAppetizer2 = Appetizer(id: 002, name: "Mock Appetizer2", description: "Yummie burnt bannana", price: 9.99, imageURL: "", calories: 10, protein: 20, carbs: 30)
    static let sampleAppetizer3 = Appetizer(id: 003, name: "Mock Appetizer3", description: "Yummie burnt bannana", price: 996.79, imageURL: "", calories: 10, protein: 20, carbs: 30)

    
/*   Read from  S3 format */
//    static let sampleAppetizer1 = Appetizer(imageURL: "", id: 1, protein: 23, name: "Jelly Beans 1", calories: 1001, description: "Yummie beans that are bery long", carbs: 23, price: 33.44)
//    static let sampleAppetizer2 = Appetizer(imageURL: "", id: 2, protein: 23, name: "Jelly Beans 2", calories: 1001, description: "Yummie beans that are bery long", carbs: 23, price: 33.44)
//    static let sampleAppetizer3 = Appetizer(imageURL: "", id: 3, protein: 23, name: "Jelly Beans 3", calories: 1001, description: "Yummie beans that are bery long", carbs: 23, price: 33.44)

    
    static let appetizers = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
    static let orderItems = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
