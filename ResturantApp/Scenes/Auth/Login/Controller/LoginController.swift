//
//  LoginController.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 30/10/2022.
//

import Alamofire

class LoginController{
    func loadLogin(email: String, password: String, deviceToken: String, deviceType: String, success: ((LoginResponse)->())?, error: ((String)->())?) {
        let url = Config.URLs.login
        let params: [String: Any] = [
            "email": email , 
            "password": password,
            "device_type" : deviceType,
            "device_token": deviceToken
        ]
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).response { response in
            switch response.result{
            case .success(let data):
                print("response.response?.statusCode ",(response.response?.statusCode)!)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    let userData = json?["data"] as? [String: Any]
                    let msg = json?["message"] as? String
                    let statusCode = json?["status"] as? Int
                    let result = LoginResponse()
                    result.user = UserModel.init(apiData: userData)
                    result.message = msg ?? "Error"
                    result.status = statusCode ?? 0
                    print(result.message)
                    print((result.user?.token)!)
                    UserDefaults.standard.set(result.user?.token, forKey: "token")
                    UserDefaults.standard.set(result.user?.email, forKey: "email")
                    success?(result)
                } catch let err {
                    print(err.localizedDescription)
                    error?(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
                error?(err.localizedDescription)
            }
        }
        
    }
}

