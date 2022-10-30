//
//  RegisterController.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import Alamofire

class RegisterController{
    //Brain
    func loadRegister(name: String, email: String, pass: String, success: ((DefaultResponse)->())?, error: ((String)->())?){
        let url = Config.URLs.register
        let params: [String: Any] = [
            "name": name,
            "email": email,
            "password": pass,
            "password_confirmation": pass
        ]
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).response { response in
            switch response.result {
            case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                        let msg = json?["message"] as? String
                        let result = DefaultResponse()
                        result.message = msg ?? "Error"
                        print(result.message)
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
