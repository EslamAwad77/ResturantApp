

import UIKit

class LoginVC: UIViewController {
    
    //MARK: Variables
    var controller:LoginController? = LoginController()
    var passwordVisible: Bool = true
    
    //MARK: - Outlets: -
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPass: UITextField!
    @IBOutlet weak var btnShowPass: UIButton!
    @IBOutlet weak var lblErrEmail: UILabel!
    @IBOutlet weak var lblErrPass: UILabel!
    
    //MARK: - Actions: -
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        loginTapped()
    }
    
    @IBAction func btnGoToSignUpPressed(_ sender: Any) {
        goToRegister()
    }
    
    @IBAction func btnShowPassPressed(_ sender: UIButton) {
        if passwordVisible{
            txtFieldPass.isSecureTextEntry = false
            let largeConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
            let eye = UIImage(systemName: "eye", withConfiguration: largeConfig)
            btnShowPass.setImage(eye, for: .normal)
            passwordVisible = false
        }else{
            txtFieldPass.isSecureTextEntry = true
            let largeConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
            let eyeShow = UIImage(systemName: "eye.fill", withConfiguration: largeConfig)
            btnShowPass.setImage(eyeShow, for: .normal)
            passwordVisible = true
        }

    }
}

//MARK: lifeCycle of screen

extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

extension LoginVC {
    func setupUI(){
        lblErrEmail.isHidden = true
        lblErrPass.isHidden = true
    }
}

extension LoginVC {
    private func goToFoodList(){
        let storyBoard = UIStoryboard(name: Config.StoryBoards.home, bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: Config.ViewControllers.home) as! HomeVC
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
}

extension LoginVC {
    func getData(){
        let fcmToken = "d9TymjYaQeK_FHEZv2DqBQ:APA91bEtsehkNaOftDgapnNZB-n8VwCHc_0t4EjYbywbUmwZVU-Gy3xNnmj6N5GkO31QylyfGImz0W1A_X0O0Dgh9YWjTQZwZ_3lG44h4X8QG3mnSLHhsX4NrfCntc9wqGlEK1_xFJy1"
        controller?.loadLogin(email: txtFieldEmail.text!, password: txtFieldPass.text!, deviceToken: fcmToken, deviceType: "ios", success: { model in
            if (model.status) != 200 {
                self.showAlert(message: (model.message))
            } else if model.status == 200 {
                print("user Token = \((model.user?.token)!)")
                //DispatchQueue
                self.goToFoodList()
            }
        }, error: { err in
            print(err)
            self.showAlert(message: err)
        })
    }
}

extension LoginVC {
    func isValidData() -> Bool {
        var isValid: Bool = true
        
        if (txtFieldEmail.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblErrEmail.isHidden = false
            self.lblErrEmail.text = "Enter Your Email"
        } else if ValidationManager.validate.invalidEmail(txtFieldEmail.text!)! == false {
            isValid = false
            self.lblErrEmail.isHidden = false
            self.lblErrEmail.text = "Enter Valid Email Like ali@gmail.com"
        } else {
            self.lblErrEmail.isHidden = true
            self.lblErrEmail.text = ""
        }
        
        if (txtFieldPass.text?.isEmpty ?? true) == true {
            isValid = false
            self.lblErrPass.isHidden = false
            self.lblErrPass.text = "Enter Your Password"
        } else if ValidationManager.validate.invalidPassword(txtFieldPass.text!)! == false{
            isValid = false
            self.lblErrPass.isHidden = false
            self.lblErrPass.text = "Enter Valid Password must have at least One Upper and Lower Case and numbers"
        } else {
            self.lblErrPass.isHidden = true
            self.lblErrPass.text = ""
        }
        return isValid
    }
}

extension LoginVC {
    func loginTapped(){
        if isValidData(){
            getData()
        }else {
            print("please enter data")
        }
    }
}


extension LoginVC{
    func goToRegister(){
        let storyBoard = UIStoryboard(name: Config.StoryBoards.auth, bundle: nil)
        let registerVC = storyBoard.instantiateViewController(withIdentifier: Config.ViewControllers.register) as! RegisterVC
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
}
