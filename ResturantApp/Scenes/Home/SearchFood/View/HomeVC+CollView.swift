//
//  HomeVC+CollView.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import Kingfisher

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.products.count > 0 {
            return self.products.count + 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTotalCollViewCell.identifier, for: indexPath) as! HomeTotalCollViewCell
            cell.lblTotalProducts.text = "Found \(self.products.count) results"
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.imgViewProduct.loadImage(products[indexPath.row].thumbnail)
        cell.lblTitle.text = products[indexPath.row].title
        cell.lblBrand.text = products[indexPath.row].brand
        cell.lblPrice.text = "\(products[indexPath.row - 1].price)"
        cell.lblRate.text = "\(products[indexPath.row - 1].rating)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = products[indexPath.row]
        let storyBoard = UIStoryboard(name: Config.StoryBoards.home, bundle: nil)
        let foodDetailsVC = storyBoard.instantiateViewController(withIdentifier: Config.ViewControllers.foodDetails) as! FoodDetailsVC
        foodDetailsVC.modalPresentationStyle = .fullScreen
        foodDetailsVC.productID = item.id
        self.present(foodDetailsVC, animated: true)
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
            return CGSize(width: itemSize, height: itemSize)
          }
}
