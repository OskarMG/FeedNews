//
//  NetworkManager.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation
import UIKit


class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func getNews(url: URL, completion: @escaping (Result<[Article], WebserviceError>)->Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(self.decodeNews(data: data)))
        }.resume()
    }
    
    private func decodeNews(data: Data) -> [Article] {
        do {
            let articles = try JSONDecoder().decode(News.self, from: data).articles
            return articles
        } catch {
            print(error.localizedDescription)
            return [Article]()
        }
    }
    
    func downLoadImageWith(url: URL, completion: @escaping(UIImage?)->Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil,
                  let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}
