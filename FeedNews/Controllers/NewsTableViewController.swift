//
//  NewsTableViewController.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsViewModel: NewsViewModel! {
        didSet { DispatchQueue.main.async { self.tableView.reloadData() } }
    }
    
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
        tableView.rowHeight = 80
        tableView.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func getNews() {
        NetworkManager.shared.getNews(url: API.getApiUrl()) {[weak self] (result) in
            guard let self = self else { return }
            switch result {
                case .success(let articles):
                    self.newsViewModel = NewsViewModel(articles: articles)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}


extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsViewModel == nil ? 0 : self.newsViewModel.articles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsViewModel.numberOfRowsInSection(section)
    }
    
    //MARK: - TODO Cell For Rows
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
