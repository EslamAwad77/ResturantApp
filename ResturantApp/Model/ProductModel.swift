//
//  ProductModel.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import Foundation

class ProductModel{
    var id: Int = 0
    var title: String = ""
    var brand: String = ""
    var thumbnail: String = ""
    var rating: Double = 0.0
    var price: Int = 0
    var description: String = ""
    
    init(){}
    
    init(apiModel: [String: Any]?) {
        self.id = (apiModel?["id"] as? Int) ?? 0
        self.title = (apiModel?["title"] as? String) ?? ""
        self.brand = (apiModel?["brand"] as? String) ?? ""
        self.thumbnail = (apiModel?["thumbnail"] as? String) ?? ""
        self.rating = (apiModel?["rating"] as? Double) ?? 0.0
        self.price = (apiModel?["price"] as? Int) ?? 0
        self.description = (apiModel?["description"] as? String) ?? ""

    }
}
