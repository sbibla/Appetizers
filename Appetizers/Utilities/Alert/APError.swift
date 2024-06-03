//
//  APError.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/26/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case invalidJson
}
