//
//  UIImageView+RoundImage.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 29/10/2022.
//

import UIKit
import Kingfisher
extension UIImageView{
    func roundedImage() {
        //Image must have the same hieght and width
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.layer.cornerRadius = (self.frame.size.height) / 2;
        self.clipsToBounds = true
    }
    func loadImage(_ urlss : String) {
        let url = URL(string: urlss)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}

