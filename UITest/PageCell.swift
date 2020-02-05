//
//  PageCell.swift
//  UITest
//
//  Created by once on 30/01/2020.
//  Copyright © 2020 once. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
//            print(page?.imageName)
            guard let unwrappedPage = page else {return}
            gomImage.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: unwrappedPage.bodyText, attributes: [NSMutableAttributedString.Key.foregroundColor:UIColor.gray, NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 13)] ))
            
            
            descriptionTextview.attributedText = attributedText
            descriptionTextview.textAlignment = .center
        }
    }
    
    // MARK: Add ImageView
    private let gomImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gom_first.png"))
        //this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK:Add TextView
    private let descriptionTextview :UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Hello, world!!", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n 𝔹𝕦𝕥 𝕥𝕙𝕖𝕣𝕖 𝕞𝕒𝕪 𝕤𝕠𝕞𝕖𝕕𝕒𝕪 𝕓𝕖 𝕒 𝕡𝕖𝕣𝕤𝕠𝕟 𝕨𝕙𝕠 𝕞𝕒𝕜𝕖𝕤 𝕥𝕙𝕖 𝕚𝕤𝕤𝕦𝕖 𝕠𝕗 𝕥𝕚𝕞𝕚𝕟𝕘 𝕚𝕣𝕣𝕖𝕝𝕖𝕧𝕒𝕟𝕥. 𝔸𝕟𝕕 𝕥𝕙𝕒𝕥 𝕜𝕚𝕟𝕕 𝕠𝕗 𝕥𝕚𝕞𝕚𝕟𝕘 𝕚𝕤 𝕒𝕝𝕨𝕒𝕪𝕤 𝕣𝕚𝕘𝕙𝕥", attributes: [NSMutableAttributedString.Key.foregroundColor:UIColor.gray, NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 13)] ))
        
        textView.attributedText = attributedText
        //        textView.text = "Hello, World!"
        //        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    // MARK:set layout
    private func setupLayout(){
        
        let containerView = UIView()
        addSubview(containerView)
        
        // enable auto layout
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(gomImage)
        
        // 곰발바닥 이미지뷰 auto layout
        gomImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        gomImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        gomImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        gomImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        
        // 설명문 텍스트뷰
        // containerView 기준으로 top을 맞춤
        addSubview(descriptionTextview)
        descriptionTextview.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        descriptionTextview.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        descriptionTextview.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        descriptionTextview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
