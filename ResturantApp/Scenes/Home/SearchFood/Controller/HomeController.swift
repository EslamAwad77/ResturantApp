//
//  HomeController.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import Alamofire

class HomeController{
    //MARK: - Brian :
    func getData(success: (([ProductModel])->())?, error: ((String)->())?){
        let url = Config.URLs.products
        AF.request(url).response { response in
            guard response.error == nil else {
                print("error :\(response.error!)")
                error?(response.error!.localizedDescription)
                return
            }
            switch response.result{
            case .success(let data):
                do {
                    let json  = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                    let productsArr = json?["products"] as? [[String: Any]]
                    var productModelArr = [ProductModel]()
                    for product in productsArr ?? [] {
                        let model = ProductModel.init(apiModel: product)
                        productModelArr.append(model)
                    }
                    success?(productModelArr)
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
