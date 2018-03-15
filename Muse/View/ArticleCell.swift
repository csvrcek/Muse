//
//  ArticleCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/6/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// TODO: figure out how to generate a tweet?
class SocialCell: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var tweetObject: Tweet? {
        didSet {
            tweet.text = tweetObject?.tweetText
            
            if let profileImageName = tweetObject?.profileImageName {
                profilePic.image = UIImage(named: profileImageName)
            }
        }
    }
    
    let twitterBird: UIImageView = {
        let bird = UIImageView()
        bird.translatesAutoresizingMaskIntoConstraints = false
        bird.image = #imageLiteral(resourceName: "Twitter_Social_Icon_Rounded_Square_Color")
        bird.contentMode = .scaleAspectFill
        bird.clipsToBounds = true
        return bird
    }()
    
    let tweet: UILabel = {
        let twit = UILabel()
        twit.translatesAutoresizingMaskIntoConstraints = false
        twit.numberOfLines = 3
        twit.text = "This is a tweet yah dig"
        twit.textColor = UIColor.black
        return twit
    }()
    
    let profilePic: UIImageView = {
        let pic = UIImageView()
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.contentMode = .scaleAspectFill
        pic.clipsToBounds = true
        return pic
    }()
    
    let profileName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 1
        name.text = "Profile Name"
        name.textColor = UIColor.black
        return name
    }()
    
    override var isHighlighted: Bool {
        didSet {
            // Send to tweet link
            print("Send to tweet")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        addSubview(twitterBird)
        addSubview(profilePic)
        addSubview(tweet)
        addSubview(profileName)
        
        // Horizontal constraints
        addConstraintsWithFormat(format: "H:|-\(frame.width - 16 - 44)-[v0]-16-|", views: twitterBird)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]-16-[v1(44)]-16-|", views: profilePic, tweet)
        addConstraintsWithFormat(format: "H:|-76-[v0]-16|", views: profileName)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-60-[v0]-16-[v1]-16|", views: profileName, tweet)
        addConstraintsWithFormat(format: "V:|-16-[v0]-\(frame.height - 16 - 44)-|", views: twitterBird)
        
    }
}


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
