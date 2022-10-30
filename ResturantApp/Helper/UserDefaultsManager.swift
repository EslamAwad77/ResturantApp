//
//  UserDefaultsManager.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 30/10/2022.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    var email: String{
        set{
            UserDefaults.standard.setValue(newValue, forKey: "email")
        }get{
            return UserDefaults.standard.string(forKey: "email")!
            
        }
    }
}
