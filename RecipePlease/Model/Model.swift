//
//  Model.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-15.
//

import Foundation

struct Recipes: Codable {
    
    let title: String
    let imageName: String
    let ingredient: [Ingredient]
    let type: [CuisineType]
    let time : Int
    
    
}

 
