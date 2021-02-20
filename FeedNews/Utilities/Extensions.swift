//
//  Extensions.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation
import UIKit
import SafariServices

extension UIView {
    func pin(to parent: UIView, constantLR: CGFloat? = 0, constantTB: CGFloat? = 0) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo:       parent.safeAreaLayoutGuide.topAnchor,       constant: constantTB!),
            leadingAnchor.constraint(equalTo:   parent.safeAreaLayoutGuide.leadingAnchor,   constant: constantLR!),
            trailingAnchor.constraint(equalTo:  parent.safeAreaLayoutGuide.trailingAnchor,  constant: -constantLR!),
            bottomAnchor.constraint(equalTo:    parent.safeAreaLayoutGuide.bottomAnchor,    constant: -constantTB!)
        ])
    }
}

extension UIViewController {
    func presentSafariVC(width url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .darkGray
        DispatchQueue.main.async { self.present(safariVC, animated: true) }
    }
}
