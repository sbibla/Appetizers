//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Saar Bibla on 4/26/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
//https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers
//    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/" //remote SeanAllen
//    private let appetizerURL = baseURL + "appetizers" //remote SeanAllen
//    static let baseURL = "http://192.168.1.21:1337/" //Local
//    private let appetizerURL = baseURL + "menu"
    static let baseURL = "https://14do7bo03e.execute-api.us-west-1.amazonaws.com/dev/" //AWS
        private let appetizerURL = baseURL + "appetizers" //AWS (Lambda)
//    private let appetizerURL = baseURL + "menu" //AWS (APIGatewayMock)
//    private let appetizerURL = baseURL + "menu/menuS3" //AWS(S3 file read)

    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        //1. Check that the URL we're trying to get through, works
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        //2. Create the data task to download the information
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if let _ = error { //if error has a value, then enter this scope
                completed(.failure(.unableToComplete)) //wifi not working
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoded = JSONDecoder()
                let decodedResponse = try decoded.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidJson))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ){
        
        //First check if the image is in the cache
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            //Image found in cache, call the completed and return the image
            completed(image)
            return
        }
        //not in cache
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data, let image = UIImage(data: data) else { //We don't care about the error, since we'll show a placeholder image
                completed(nil)
                return
            }
            //we've downloaded the image, let's put it in the cache, and call the completion with our image
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
