//
//  Extensions.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to parent: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0)
        ])
    }
    
}
