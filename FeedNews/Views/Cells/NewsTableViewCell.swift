//
//  NewsTableViewCell.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let reuseID = "NewsTableViewCell"
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.setContentHuggingPriority(.init(251), for: .vertical)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.setContentHuggingPriority(.init(252), for: .vertical)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = ContentStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        return stackView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(container)
        container.addSubview(stackView)
        container.pin(to: contentView, constantLR: 10, constantTB: 5)
        stackView.pin(to: container, constantLR: 0, constantTB: 0)
    }
    
    func setupCellWith(article: ArticleViewModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
    
    
}
