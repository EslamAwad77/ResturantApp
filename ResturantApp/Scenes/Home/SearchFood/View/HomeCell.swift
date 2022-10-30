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
    
    static let identifier = String(describing: HomeCell.self)
    
    //MARK: - Outlets:-
    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRate: UILabel!
}
