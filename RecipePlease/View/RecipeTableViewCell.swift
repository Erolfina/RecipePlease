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
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(ingredients: [Ingredient], title: String) {
        titleRecipeLabel.text = title
        
       
        //ingredientsRecipeLabel.text = ingredients.food


        
        
        
    }

}
