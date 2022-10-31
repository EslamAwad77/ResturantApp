//
//  FoodDetailsController.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 29/10/2022.
//

import Alamofire

class FoodDetailsController{
    //MARK: - Brain
    func getData(productId: Int ,success: ((ProductModel)->())?, error: ((String)->())?){
        let url = Config.URLs.products + "/\(productId)"
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
                    let productModel = ProductModel()
                    let image = json?["thumbnail"] as? String
                    let title = json?["title"] as? String
                    let description = json?["description"] as? String
                    let price = json?["price"] as? Int
                    let rating = json?["rating"] as? Double
                    productModel.thumbnail = image ?? ""
                    productModel.description = description ?? ""
                    productModel.rating = rating ?? 0.0
                    productModel.price = price ?? 0
                    productModel.title = title ?? ""
//                    let imagesArr = json?["images"] as? [String]
//                    productModel.images = imagesArr ?? []

                    
                    //var imageModelArr = productModel.images
//                    for image in imagesArr ?? []{
//                        let model = productModel.images[image]
//                        imageModelArr.append(model)
//                    }
                    success?(productModel)
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
