//
//  FavoriteCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/15/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FavoriteCell: BaseCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var favorite: Favorite? {
        didSet {
            nameLabel.text = favorite?.name
            
            if let photoImageName = favorite?.imageName {
                photoImageView.image = UIImage(named: photoImageName)
            }
        }
    }
    
    let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 1
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = UIColor.black
        return name
    }()
    
    let separatorView: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor.black
        sep.translatesAutoresizingMaskIntoConstraints = false
        return sep
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            // Send to Discography page
            print("Sent to Disc page")
//            self.contentView.backgroundColor = UIColor(displayP3Red: 211, green: 211, blue: 211, alpha: 1)
        }
    }
    
    override func setupViews() {
        addSubview(nameLabel)
        addSubview(photoImageView)
        addSubview(separatorView)
        
        
        // Horizontal constraints
        addConstraintsWithFormat(format: "H:|-10-[v0(70)]-10-[v1]|", views: photoImageView, nameLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-[v1(1)]|", views: photoImageView, separatorView)
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: nameLabel)
    }
}
