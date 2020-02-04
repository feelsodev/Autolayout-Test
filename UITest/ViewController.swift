//
//  ViewController.swift
//  UITest
//
//  Created by once on 07/01/2020.
//  Copyright © 2020 once. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/2525, alpha: 1)
}

class ViewController: UIViewController {
    
    // Add ImageView
    let gomImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gom_first.png"))
        //this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Add TextView
    let descriptionTextview :UITextView = {
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
    
    // Add Button
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PRV", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return button
    }()
    
    // Add Button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/2525, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return button
    }()
    
    // Add PageButton
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
//        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/2525, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextview)
            
        setupButtonControls()
        setupLayout()
    }
    
    fileprivate func setupButtonControls(){
//        view.addSubview(previousButton)
//        previousButton.backgroundColor = .red
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
//
        let greenView = UIView()
        greenView.backgroundColor = .green
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
//        bottomControlsStackView.axis = .vertical

        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
//            previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50 )
        ])
    }
    
    
    //set layout
    private func setupLayout(){
        
        let containerView = UIView()
//        containerView.backgroundColor = .blue
        view.addSubview(containerView)
        
        // enable auto layout
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(gomImage)
        
        // 곰발바닥 이미지뷰 auto layout
        gomImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        gomImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        gomImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        gomImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        
        // 설명문 텍스트뷰
        // containerView 기준으로 top을 맞춤
        descriptionTextview.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        descriptionTextview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}


