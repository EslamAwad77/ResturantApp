//
//  Config.swift
//  ResturantApp
//
//  Created by eslam awad elsayed awad on 27/10/2022.
//

import Foundation

struct Config{
    struct ViewControllers{
        static let register = "RegisterVC"
        static let home = "HomeVC"
        static let onBoard = "OnBoardingVC"
        static let foodDetails = "FoodDetailsVC"
        static let login = "LoginVC"
        static let filter = "HomeFilterVC"
    }
    
    struct StoryBoards{
        
        static let auth = "Auth"
        static let home = "Home"
        static let onBoard = "Main"
        
    }
    
    struct CollectionViews{

    }
    
    struct Nibs{
        static let onBoardingSlide = "OnBoardSlide"
    }
    
    struct URLs{
        static let products = "https://dummyjson.com/products"
        static let main = "https://inst.roqay.solutions/api/"
        static let register = main + "register"
        static let login = main + "login"
    }
}
