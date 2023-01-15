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
    
    @IBOutlet weak var bottomLabel: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(ingredients: [Ingredient], title: String, time: Int, cuisine: [CuisineType], photos: String) {
      let minute = " min "
        titleRecipeLabel.text = title
        photo.image = UIImage(named: photos)
        ingredients.forEach { ingredientsRecipeLabel.text = $0.food }
        cuisine.forEach { cuisineType.text = $0.rawValue }
        timeLabel.text = String(time) + minute
        bottomLabel.applyGradient()
    }
    
    

}

extension UIView {
    func applyGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.type = .axial
            gradientLayer.colors = [UIColor.black.withAlphaComponent(1.0).cgColor,UIColor.black.withAlphaComponent(0.0).cgColor]
            gradientLayer.frame = self.bounds
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            self.layer.insertSublayer(gradientLayer, at: 0)
    }
}


