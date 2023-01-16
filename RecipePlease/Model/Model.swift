//
//  Model.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-15.
//

import Foundation

struct Recipes: Codable {
    
    let titleRecipe: String
    let imageName: String
    let ingredient: [Ingredient]
    let ingredientLines: [String]
    let typeCuisine: [CuisineType]
    let timeCooking : Int
    let urlRecipe: String
}

 
