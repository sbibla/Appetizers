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
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
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
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ){
        
        //First check if the image is in the cach
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
            guard let data = data, let image = UIImage(data: data) else { //We don't care about the error, since we'll show a placeholder image
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