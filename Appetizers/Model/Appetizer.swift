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

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer1 = Appetizer(id: 001, name: "Mock Appetizer1", description: "Yummie burnt bannana with some long text", price: 6.51, imageURL: "", calories: 10, protein: 20, carbs: 30)
    static let sampleAppetizer2 = Appetizer(id: 002, name: "Mock Appetizer2", description: "Yummie burnt bannana", price: 9.99, imageURL: "", calories: 10, protein: 20, carbs: 30)
    static let sampleAppetizer3 = Appetizer(id: 003, name: "Mock Appetizer3", description: "Yummie burnt bannana", price: 996.79, imageURL: "", calories: 10, protein: 20, carbs: 30)
    
    static let appetizers = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3]
}
