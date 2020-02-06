//
//  SwipingController.swift
//  UITest
//
//  Created by once on 29/01/2020.
//  Copyright © 2020 once. All rights reserved.
//

import UIKit

class SwipingController : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    //    let imageNames = ["gom_first.png","IMG_8531.jpg","dog_image.jpg"]
    
    let pages = [
        Page(imageName: "gom_first.png", headerText: " hello world!!", bodyText: "\n 𝔹𝕦𝕥 𝕥𝕙𝕖𝕣𝕖 𝕞𝕒𝕪 𝕤𝕠𝕞𝕖𝕕𝕒𝕪 𝕓𝕖 𝕒 𝕡𝕖𝕣𝕤𝕠𝕟 𝕨𝕙𝕠 𝕞𝕒𝕜𝕖𝕤 𝕥𝕙𝕖 𝕚𝕤𝕤𝕦𝕖 𝕠𝕗 𝕥𝕚𝕞𝕚𝕟𝕘 𝕚𝕣𝕣𝕖𝕝𝕖𝕧𝕒𝕟𝕥. 𝔸𝕟𝕕 𝕥𝕙𝕒𝕥 𝕜𝕚𝕟𝕕 𝕠𝕗 𝕥𝕚𝕞𝕚𝕟𝕘 𝕚𝕤 𝕒𝕝𝕨𝕒𝕪𝕤 𝕣𝕚𝕘𝕙𝕥"),
        Page(imageName: "IMG_8531.jpg", headerText: "I love you", bodyText: "\nNIKE AIR JORDAN1"),
        Page(imageName: "dog_image.jpg", headerText: "Yoon Sangwon", bodyText: "\nNIKE DUNK")
    ]
    
    // Add Button
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PRV", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        let nextIndex = max(pageControl.currentPage - 1,0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // Add Button
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/2525, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // Add PageButton
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        
        // ERROR:Instance member 'pages' cannot be used on type 'SwipingController'
        // private let pageControl: -> private lazy var pageControl:
        pc.numberOfPages = pages.count
        //        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/2525, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "celled")
        
        collectionView?.isPagingEnabled = true
    }
}
