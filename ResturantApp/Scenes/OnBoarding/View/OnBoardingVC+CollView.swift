//
//  OnBoardingVC+CollView.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

//extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.collViewImageSlide {
//            return imageSlides.count
//        }
//        return titleSlides.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.collViewImageSlide{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBaordingImageCell.identifer , for: indexPath) as! OnBaordingImageCell
//            cell.setup(imageSlides[indexPath.row])
//            return cell
//        }
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingTitleCell.identifer , for: indexPath) as! OnBoardingTitleCell
//        cell.setup(titleSlides[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let width = scrollView.frame.width
//        currentPage = Int(scrollView.contentOffset.x / width)
//    }
//}
