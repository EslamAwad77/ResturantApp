//
//  RegisterVC.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: - Variables :
    var passwordVisible: Bool = true
    var controller: RegisterController? = RegisterController()
    
    //MARK: -Outlets:-
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtFieldPass: UITextField!
    @IBOutlet weak var btnShowPass: UIButton!
    @IBOutlet weak var lblPass: UILabel!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewConfirmPass: UIView!
    @IBOutlet weak var txtFieldConfirmPass: UITextField!
    
    
    //MARK: -Actions:-
    @IBAction func btnSignUpPressed(_ sender: UIButton) {
        registerTapped()
    }
    
    @IBAction func btnShowPassPressed(_ sender: UIButton) {
        if passwordVisible{
            txtFieldPass.isSecureTextEntry = false
            txtFieldConfirmPass.isSecureTextEntry = false
            let largeConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
            let eye = UIImage(systemName: "eye.fill", withConfiguration: largeConfig)
            btnShowPass.setImage(eye, for: .normal)
            passwordVisible = false
        }else{
            txtFieldPass.isSecureTextEntry = true
            txtFieldConfirmPass.isSecureTextEntry = true
            let largeConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
            let eyeShow = UIImage(systemName: "eye", withConfiguration: largeConfig)
            btnShowPass.setImage(eyeShow, for: .normal)
            passwordVisible = true
        }
    }
}

//MARK: -LifeCycle of screen
extension RegisterVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension RegisterVC{
    private func setupUI(){
        viewPassword.addborder(10)
        viewName.addborder(10)
        viewEmail.addborder(10)
        viewConfirmPass.addborder(10)
        lblName.isHidden = true
        lblEmail.isHidden = true
        lblPass.isHidden = true
    }
}

extension RegisterVC{
    private func goToLogin() {
        let loginVC = UIStoryboard.init(name: Config.StoryBoards.auth, bundle: nil).instantiateViewController(withIdentifier: Config.ViewControllers.login) as! LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}

extension RegisterVC{
    func getData(){
        controller?.loadRegister(name: txtFieldName.text!, email: txtFieldEmail.text!, pass: txtFieldPass.text!, success: { model in
            DispatchQueue.main.async {
                self.showAlert(message: "Sign Up Successfully")
            }
            self.goToLogin()
        }, error: { err in
            print(err)
            self.showAlert(message: err)
        })
    }
}

extension RegisterVC {
    func registerTapped(){
        if isValidData(){
            getData()
        } else {
            print("please enter data")
        }
    }
}
