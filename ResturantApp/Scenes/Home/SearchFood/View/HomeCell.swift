//
//  HomeCell.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import Kingfisher

class HomeCell: UICollectionViewCell {
    //MARK: - Variables:-
    var isActive: Bool = true
    static let identifier = String(describing: HomeCell.self)
    
    //MARK: - Outlets:-
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var btnWishList: UIButton!
    
    //MARK: - Actions :
    @IBAction func btnWishListPressed(_ sender: UIButton) {
            if isActive {
                btnWishList.tintColor = UIColor.red
                btnWishList.setImage(UIImage(named: "Wishlist_activeMark"), for: .normal)
                isActive = false
            } else{
                btnWishList.tintColor = UIColor.black
                btnWishList.setImage(UIImage(named: "wishlist"), for: .normal)
                isActive = true
            }
    }
    
    

}
