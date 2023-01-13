//
//  RecipeTableViewCell.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-12.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var ingredientsRecipeLabel: UILabel!
    @IBOutlet weak var cuisineType: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(ingredients: [Ingredient], title: String, time: Int, cuisine: [CuisineType], photos: String) {
        let minute = " m"
        titleRecipeLabel.text = title
        photo.image = UIImage(named: photos)
        ingredients.forEach { ingredientsRecipeLabel.text = $0.food }
        cuisine.forEach { cuisineType.text = $0.rawValue }
        timeLabel.text = String(time) + minute
    
    }

}
