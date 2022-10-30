//
//  OnBaordingCell.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

class OnBaordingImageCell: UICollectionViewCell {
    
    static let identifer = String(describing: OnBaordingImageCell.self)
    
    @IBOutlet weak var imgViewSlide: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    func setup(_ slide: OnBoardingImageModel){
        imgViewSlide.image = slide.image
    }
}
