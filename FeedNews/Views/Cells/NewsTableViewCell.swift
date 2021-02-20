//
//  NewsTableViewCell.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let reuseID = "NewsTableViewCell"
    
    let thumbnailView: UIImageView = {
        let imageView = UIImageView(image: Image.newsDefaultImg)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
        setupUIElementsConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(thumbnailView)
        contentView.addSubview(container)
        container.addSubview(stackView)
    }
    
    private func setupUIElementsConstraints() {
        NSLayoutConstraint.activate([
            thumbnailView.topAnchor.constraint(equalTo:             contentView.safeAreaLayoutGuide.topAnchor),
            thumbnailView.leadingAnchor.constraint(equalTo:         contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            thumbnailView.widthAnchor.constraint(equalToConstant:   80),
            thumbnailView.heightAnchor.constraint(equalToConstant:  80),
            
            container.topAnchor.constraint(equalTo:      contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo:  thumbnailView.trailingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            container.bottomAnchor.constraint(equalTo:   contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
        stackView.pin(to: container)
    }
    
    func setupCellWith(article: ArticleViewModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        downLoadImageWith(urlString: article.urlToImage)
    }
    
    
    private func downLoadImageWith(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        NetworkManager.shared.downLoadImageWith(url: url) {[weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async { self.thumbnailView.image = image }
        }
    }
    
}
