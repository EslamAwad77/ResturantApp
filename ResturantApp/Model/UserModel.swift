//
//  UserModel.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 30/10/2022.
//

import Foundation
//must not contain ui
//must not import uikit

class UserModel {
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var whatsapp: String = ""
    var phone: String = ""
    var facebook: String = ""
    var type: String = ""
    var description: String = ""
    var image: String = ""
    var views: [String] = []
    var is_favourite: Bool = false
    var location: Bool = false
    var token: String = ""
    var services: [String] = []
    var cources: [String] = []
    
    init(){}
    
    init(apiData: [String: Any]?) {
        self.id = apiData?["id"] as? Int ?? 0
        self.name = apiData?["name"] as? String ?? ""
        self.email = apiData?["email"] as? String ?? ""
        self.whatsapp = apiData?["whatsapp"] as? String ?? ""
        self.phone = apiData?["phone"] as? String ?? ""
        self.facebook = apiData?["facebook"] as? String ?? ""
        self.type = apiData?["type"] as? String ?? ""
        self.description = apiData?["description"] as? String ?? ""
        self.image = apiData?["image"] as? String ?? ""
        self.views = apiData?["views"] as? [String] ?? []
        self.is_favourite = apiData?["is_favourite"] as? Bool ?? false
        self.location = apiData?["location"] as? Bool ?? false
        self.token = apiData?["token"] as? String ?? ""
    }
}

class LoginResponse {
    var status: Int = 0
    var message: String = ""
    var user: UserModel?
    init(){}
}
