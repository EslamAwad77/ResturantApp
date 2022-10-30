//
//  OnBoardingTitleCell.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

class OnBoardingTitleCell: UICollectionViewCell {
    
    //Variables :-
    static let identifer = String(describing: OnBoardingTitleCell.self)
    
    //Outlets :-
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    
    func setup(_ slide: OnBoardingTitleModel){
        lblTitle.text = slide.title
        lblDesc.text = slide.description
    }
    
}
