//
//  ArticleCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/6/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    // Init is called when cells are dequed
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleView: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "This is a placeholder article title. Hopefully I can figure out how to make this all look good 🤔"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.numberOfLines = 3
        return titleLabel
    }()
    
    override var isHighlighted: Bool {
        didSet {
            // Send to article link
            print("Sent to link")
        }
    }
    
    func setupViews() {
        addSubview(articleImageView)
        addSubview(articleTitleView)
        
        // "On the horizontal part, v0 will be 16 pixels from the left and the right"
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: articleImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: articleTitleView)
        
        // "On the vertical part, v0 will be 16 pixels from the left and the right"
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(60)]-16-|", views: articleImageView, articleTitleView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
