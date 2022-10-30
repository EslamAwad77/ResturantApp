//
//  UIView+CornerRaduis.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRaduis: CGFloat {
        get{
            return self.cornerRaduis
        } set{
            self.layer.cornerRadius = newValue
        }
    }
    
    func addborder(_ withValue: CGFloat,_ borWidth: CGFloat? = nil, color: UIColor? = nil){
        self.layer.cornerRadius = withValue
        self.layer.borderWidth = borWidth ?? 1
        self.layer.borderColor = color?.cgColor ?? UIColor.systemGray5.cgColor
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
