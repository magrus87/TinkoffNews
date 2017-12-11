//
//  NewsPreviewCell.swift
//  TinkoffNews
//
//  Created by Alexander Makarov on 02/12/2017.
//  Copyright © 2017 ru.magrus87. All rights reserved.
//

import UIKit

enum NewsPreviewCellDefaults {
    static let cellID = "NewsPreviewCellReusableID"
}

class NewsPreviewCell: UITableViewCell {
    private let previewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(previewLabel)
        contentView.addSubview(dateLabel)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        previewLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        previewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        previewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: previewLabel.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
