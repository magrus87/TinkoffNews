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

fileprivate enum Sizes {
    enum Preview {
        static let leading: CGFloat = 25.0
        static let trailing: CGFloat = -25.0
        static let top: CGFloat = 5.0
        
    }
    
    enum Date {
        static let top: CGFloat = 7.0
        static let bottom: CGFloat = -5.0
    }
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
        
        previewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.Preview.top).isActive = true
        previewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.Preview.leading).isActive = true
        previewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Sizes.Preview.trailing).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: previewLabel.bottomAnchor, constant: Sizes.Date.top).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: previewLabel.trailingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Sizes.Date.bottom).isActive = true
    }
    
    func set(text: String?) {
        previewLabel.text = text
    }
    
    func set(date: String?) {
        dateLabel.text = date
    }
}
