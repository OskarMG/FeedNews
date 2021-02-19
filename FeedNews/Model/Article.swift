//
//  Article.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation


struct Article: Decodable {
    let title: String
    let description: String?
    let urlToImage: String?
}
