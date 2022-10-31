//
//  CollSlide.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 29/10/2022.
//

import UIKit


class CollSlide: UIView{
    var didClickButton: (()->())?

    @IBOutlet weak var imgViewProduct: UIImageView!
    @IBOutlet weak var btnGoNext: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBAction func btnGoNextPressed(_ sender: UIButton) {
        didClickButton?()
    }
}
