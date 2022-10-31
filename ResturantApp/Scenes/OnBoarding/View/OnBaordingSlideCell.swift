//
//  OnBaordingCell.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

class OnBaordingSlideCell: UICollectionViewCell {
    
    static let identifer = String(describing: OnBaordingSlideCell.self)
    
    @IBOutlet weak var imgViewSlide: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    
    func setup(_ slide: OnBoardingSlideModel){
        imgViewSlide.image = slide.image
        lblTitle.text = slide.title
        lblDesc.text = slide.description
    }
}
