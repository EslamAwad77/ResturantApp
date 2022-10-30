//
//  RegisterVC+SetupUI.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 29/10/2022.
//

import UIKit

extension RegisterVC {
    func isValidData() -> Bool {
        var isValid = true
        if (txtFieldName.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblName.isHidden = false
            self.lblName.text = "Enter Your Name"
        } else{
            self.lblName.isHidden = true
            self.lblName.text = ""
        }
        if (txtFieldEmail.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblEmail.isHidden = false
            self.lblEmail.text = "Enter Your Email"
        }else if ValidationManager.validate.invalidEmail(txtFieldEmail.text!)! == false {
            isValid = false
            self.lblEmail.isHidden = false
            self.lblEmail.text = "Enter Valid Email Like : ali@example.com"
        } else{
            self.lblEmail.isHidden = true
            self.lblEmail.text = ""
        }
        
        if (txtFieldPass.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblPass.isHidden = false
            self.lblPass.text = "Enter Your Password"
        } else if ValidationManager.validate.invalidPassword(txtFieldPass.text!)! == false {
            isValid = false
            self.lblPass.isHidden = false
            self.lblPass.text = "Enter Valid Password must have at least One Upper and Lower Case and numbers"
        } else {
            self.lblPass.isHidden = true
            self.lblPass.text = ""
        }
        
        if (txtFieldPass.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblPass.isHidden = false
            self.lblPass.text = "Repeat Your Password"
        } else if ValidationManager.validate.invalidPassword(txtFieldPass.text!)! == false {
            isValid = false
            self.lblPass.isHidden = false
            self.lblPass.text = "Enter Valid Password must have at least One Upper and Lower Case and numbers"
        }else if txtFieldConfirmPass != txtFieldPass{
            self.lblPass.isHidden = false
            self.lblPass.text = "Password must be the same"

        } else {
            self.lblPass.isHidden = true
            self.lblPass.text = ""
        }
        return isValid
    }
}
