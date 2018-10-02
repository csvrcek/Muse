//
//  FavoriteCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/15/18.
//  Copyright © 2018 Connor Svrcek. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    override var isHighlighted: Bool {
        didSet {
            // Send to Discography page
            print("Sent to Disc page")
        }
    }
    
    func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(photoImageView)
        
        
        // Horizontal constraints
        photoImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10)
        photoImageView.rightAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 10)
        photoImageView.widthAnchor.constraint(equalToConstant: 15)
        photoImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        
        nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 10)
        
        //addConstraintsWithFormat(format: "H:|-10-[v0(5)]-10-[v1]|", views: photoImageView, nameLabel)
        
        // Vertical constraints
        //addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: photoImageView)
        //addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: nameLabel)
    }
}
