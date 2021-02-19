//
//  NetworkManager.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation


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
}
