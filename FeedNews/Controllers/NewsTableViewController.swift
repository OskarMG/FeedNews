//
//  NewsTableViewController.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsViewModel: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupTableView()
        getNews()
    }
    
    
    private func setupVC() {
        title = Labels.newsTableViewTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
    }
    
    private func getNews() {
        NetworkManager.shared.getNews(url: API.getApiUrl()) {[weak self] (result) in
            guard let self = self else { return }
            switch result {
                case .success(let articles): self.newsViewModel = NewsViewModel(articles: articles)
                case .failure(let error): print(error.localizedDescription)
            }
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
}


extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsViewModel == nil ? 0 : self.newsViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as! NewsTableViewCell
        
        let article = self.newsViewModel.articleAtIndex(indexPath.row)
        cell.setupCellWith(article: article)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = self.newsViewModel.articleAtIndex(indexPath.row)
        if let url = URL(string: article.url) { self.presentSafariVC(width: url) }
    }
}
