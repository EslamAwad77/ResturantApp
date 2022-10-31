//
//  RegisterVC.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
//import FBSDKCoreKit
//import FBSDKLoginKit


class RegisterVC: UIViewController, UITextFieldDelegate {
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
    @IBOutlet weak var lblConfirmPass: UILabel!
    //@IBOutlet weak var btnFacbook: FBLoginButton!
    
    //MARK: -Actions:-
    @IBAction func btnSignUpPressed(_ sender: UIButton) {
        registerTapped()
    }
    
    @IBAction func btnGoToLoginPressed(_ sender: UIButton) {
        goToLogin()
    }
    
    @IBAction func btnGoogleLoginTapped(_ sender: UIButton) {
        setupGoogle()
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
    
    @IBAction func txtFieldChange(_ sender: UITextField) {
        viewName.layer.borderColor = UIColor.orange.cgColor
    }
    
}

//MARK: -LifeCycle of screen
extension RegisterVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //        if let token = AccessToken.current,
        //           !token.isExpired {
        //            //User is logged in, do work such as go to next view controller.
        //        } else {
        //            btnFacbook.permissions = ["public_profile", "email"]
        //            btnFacbook.delegate = self
        //        }
    }
}

extension RegisterVC{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFieldName {
            viewName.layer.borderColor = UIColor.orange.cgColor
            viewEmail.layer.borderColor = UIColor.white.cgColor
            viewPassword.layer.borderColor = UIColor.white.cgColor
            viewConfirmPass.layer.borderColor = UIColor.white.cgColor

        } else if textField == txtFieldEmail {
            viewEmail.layer.borderColor = UIColor.orange.cgColor
            viewName.layer.borderColor = UIColor.white.cgColor
            viewPassword.layer.borderColor = UIColor.white.cgColor
            viewConfirmPass.layer.borderColor = UIColor.white.cgColor
        } else if textField == txtFieldPass {
            viewPassword.layer.borderColor = UIColor.orange.cgColor
            viewName.layer.borderColor = UIColor.white.cgColor
            viewEmail.layer.borderColor = UIColor.white.cgColor
            viewConfirmPass.layer.borderColor = UIColor.white.cgColor
        } else if textField == txtFieldConfirmPass {
            viewConfirmPass.layer.borderColor = UIColor.orange.cgColor
            viewName.layer.borderColor = UIColor.white.cgColor
            viewEmail.layer.borderColor = UIColor.white.cgColor
            viewPassword.layer.borderColor = UIColor.white.cgColor
           
        }
    }
}


extension RegisterVC{
    private func setupUI(){
        txtFieldName.delegate = self
        txtFieldEmail.delegate = self
        txtFieldPass.delegate = self
        txtFieldConfirmPass.delegate = self
        viewPassword.addborder(15)
        viewName.addborder(15)
        viewEmail.addborder(15)
        viewConfirmPass.addborder(15)
        viewName.layer.cornerRadius = 30
        viewEmail.layer.cornerRadius = 30
        viewPassword.layer.cornerRadius = 30
        viewConfirmPass.layer.cornerRadius = 30
        lblName.isHidden = true
        lblEmail.isHidden = true
        lblPass.isHidden = true
        lblConfirmPass.isHidden = true
        viewName.layer.borderColor = UIColor.white.cgColor
        
    }
}

extension RegisterVC{
    private func goToLogin() {
        let loginVC = UIStoryboard.init(name: Config.StoryBoards.auth, bundle: nil).instantiateViewController(withIdentifier: Config.ViewControllers.login) as! LoginVC
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}

extension RegisterVC {
    private func goToFoodList(){
        let storyBoard = UIStoryboard(name: Config.StoryBoards.home, bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: Config.ViewControllers.home) as! HomeVC
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
}

extension RegisterVC{
    func getData(){
        controller?.loadRegister(name: txtFieldName.text!, email: txtFieldEmail.text!, pass: txtFieldPass.text!, success: { model in
                        if (model.status) != 200 {
                            self.showAlert(message: (model.message))
                        }
                        else if model.status == 200 {
                                self.goToLogin()

                        }
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

extension RegisterVC{
    private func setupGoogle(){
        //GIDSignIn.sharedInstance.presenting
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {return}
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            // ...
            // FireBase Auth
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = authResult?.user else {
                    return
                }
                print(user.displayName ?? "success")
                self.goToFoodList()
            }
        }
    }
}

//extension RegisterVC: LoginButtonDelegate{
//    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
//        let token = result?.token?.tokenString
//        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"], tokenString: token, version: nil, httpMethod: .get)
//
//        request.start{ (connection, result, error) in
//            print("\(result)")
//        }
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
//        print("Logout")
//    }
//}

//
//extension RegisterVC{
//
//    func googleAuth(){
//        Auth.auth().signIn(with: credential) { authResult, error in
//            if let error = error {
//              let authError = error as NSError
//              if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
//                // The user is a multi-factor user. Second factor challenge is required.
//                let resolver = authError
//                  .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
//                var displayNameString = ""
//                for tmpFactorInfo in resolver.hints {
//                  displayNameString += tmpFactorInfo.displayName ?? ""
//                  displayNameString += " "
//                }
//                self.showTextInputPrompt(
//                  withMessage: "Select factor to sign in\n\(displayNameString)",
//                  completionBlock: { userPressedOK, displayName in
//                    var selectedHint: PhoneMultiFactorInfo?
//                    for tmpFactorInfo in resolver.hints {
//                      if displayName == tmpFactorInfo.displayName {
//                        selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
//                      }
//                    }
//                    PhoneAuthProvider.provider()
//                      .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
//                                         multiFactorSession: resolver
//                                           .session) { verificationID, error in
//                        if error != nil {
//                          print(
//                            "Multi factor start sign in failed. Error: \(error.debugDescription)"
//                          )
//                        } else {
//                          self.showTextInputPrompt(
//                            withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
//                            completionBlock: { userPressedOK, verificationCode in
//                              let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
//                                .credential(withVerificationID: verificationID!,
//                                            verificationCode: verificationCode!)
//                              let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
//                                .assertion(with: credential!)
//                              resolver.resolveSignIn(with: assertion!) { authResult, error in
//                                if error != nil {
//                                  print(
//                                    "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
//                                  )
//                                } else {
//                                  self.navigationController?.popViewController(animated: true)
//                                }
//                              }
//                            }
//                          )
//                        }
//                      }
//                  }
//                )
//              } else {
//                self.showMessagePrompt(error.localizedDescription)
//                return
//              }
//              // ...
//              return
//            }
//            // User is signed in
//            // ...
//        }
//    }
//
//}

