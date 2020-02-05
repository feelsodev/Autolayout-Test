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
        Page(imageName: "gom_first.png", headerText: "\n hello world!!", bodyText: "\nbody Text"),
        Page(imageName: "IMG_8531.jpg", headerText: "\nI love you", bodyText: "\nNIKE AIR JORDAN1"),
        Page(imageName: "dog_image.jpg", headerText: "\nYoon Sangwon", bodyText: "\nNIKE DUNK")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "celled")
        
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celled", for: indexPath) as! PageCell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.gomImage.image = UIImage(named: page.imageName)
//        cell.descriptionTextview.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//        cell.gomImage.image = UIImage(named: imageName)
        
        
        // dont try this, it is a very bad idea
//        let imageView = UIImageView()
//        cell.addSubview(imageView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
}
