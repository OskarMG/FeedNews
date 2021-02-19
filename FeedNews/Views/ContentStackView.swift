//
//  ContentStackView.swift
//  FeedNews
//
//  Created by Oscar Martinez on 19/2/21.
//

import UIKit

class ContentStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        axis            = .vertical
        spacing         = 8
        alignment       = .fill
        distribution    = .fill
        contentMode     = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
