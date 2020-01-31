//
//  PageCell.swift
//  UITest
//
//  Created by once on 30/01/2020.
//  Copyright © 2020 once. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let gomImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gom_first.png"))
        //this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
