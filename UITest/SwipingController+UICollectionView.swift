//
//  SwipingController+UICollectionView.swift
//  UITest
//
//  Created by once on 07/02/2020.
//  Copyright © 2020 once. All rights reserved.
//

import UIKit

extension SwipingController{
    
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
