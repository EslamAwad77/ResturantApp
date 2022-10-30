//
//  DefaultResponse.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 30/10/2022.
//

import Foundation

class DefaultResponse{
    var message: String = ""
    var status: Int = 0

    
    init(){}
    init(apiData: [String: Any]?){
        self.message = apiData?["message"] as? String ?? ""
        self.status = apiData?["status"] as? Int ?? 0
    }
}
