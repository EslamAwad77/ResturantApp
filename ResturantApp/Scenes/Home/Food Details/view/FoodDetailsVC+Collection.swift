//
//  FoodDetailsVC+Collection.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 31/10/2022.
//

import UIKit

extension FoodDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifer, for: indexPath) as! CollectionViewCell
        cell.imgViewProduct.loadImage(images[indexPath.row])
        return cell
    }
    
    
}
