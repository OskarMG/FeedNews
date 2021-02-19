//
//  NewsTableViewController.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupTableView()
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
    
}
