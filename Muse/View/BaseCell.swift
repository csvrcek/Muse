//
//  BaseCell.swift
//  Muse
//
//  Created by Connor Svrcek on 3/15/18.
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
