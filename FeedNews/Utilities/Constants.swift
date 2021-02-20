//
//  Constants.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation
import UIKit


enum Labels {
    static let newsTableViewTitle = "News"
}

enum WebserviceError: String, Error {
    case invalidData = "Data received from the server was invalid. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
}

enum API {
    static let key = "c038889bd352451c96c6f9df1b419021"
    static let baseUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
    
    static func getApiUrl() -> URL {
        return URL(string: "\(API.baseUrl)\(API.key)")!
    }
}

enum Image {
    static let newsDefaultImg = UIImage(named: "news_default_thumbnail")!
}
