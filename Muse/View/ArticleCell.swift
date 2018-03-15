//
//  ArticleCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/6/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class ArticleCell: BaseCell {
    // Init is called when cells are dequed
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var article: Article? {
        didSet {
            articleTitleLabel.text = article?.articleTitle
            
            if let articleImageName = article?.articleImageName {
                articleImageView.image = UIImage(named: articleImageName)
            }
            
            // Measure the title text
            if let articleTitle = article?.articleTitle {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: articleTitle).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    articleTitleLabelHeightConstraint?.constant = 44
                } else {
                    articleTitleLabelHeightConstraint?.constant = 20
                }
            }
            
            
        }
    }
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "This is a placeholder article title. Hopefully I can figure out how to make this all look good 🤔"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 3
        return titleLabel
    }()
    
    override var isHighlighted: Bool {
        didSet {
            // Send to article link
            print("Sent to link")
        }
    }
    
    var articleTitleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(articleImageView)
        addSubview(articleTitleLabel)
        
        // "On the horizontal part, v0 will be 16 pixels from the left and the right"
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: articleImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: articleTitleLabel)
        
        // "On the vertical part, v0 will be 16 pixels from the left and the right"
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(60)]-36-|", views: articleImageView, articleTitleLabel)
        
        articleTitleLabelHeightConstraint = NSLayoutConstraint(item: articleTitleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 22)
        addConstraint(articleTitleLabelHeightConstraint!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









