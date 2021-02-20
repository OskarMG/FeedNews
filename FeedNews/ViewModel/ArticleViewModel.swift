//
//  ArticleViewModel.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation


struct ArticleViewModel {
    
    private let article: Article
    
    var url: String {
        return self.article.url
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
    
    var urlToImage: String? {
        return self.article.urlToImage
    }
    
    init(_ article: Article) {
        self.article = article
    }
    
}
