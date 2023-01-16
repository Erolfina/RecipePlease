//
//  RecipeViewController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-16.
//

import UIKit

class RecipeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var recipeIngredientsList: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageRecipe: UIImageView!
    var ingredientsList: [String] = []
    var imageName: String = ""
    var URLRecipe: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeIngredientsList.text = ""
        updateImageRecipe()
        updateIngredients()
        
    }
    // MARK: - Methods
    
    private func updateIngredients() {
        
        
        ingredientsList.enumerated().forEach { (index, ingredient) in
            recipeIngredientsList.text! += ingredientsList[index]+"\n"
        }
    }
    
    private func updateImageRecipe() {
        imageRecipe.image = UIImage(named: imageName)
    }
    
  @IBAction func buttonClicked(_ sender: Any) {
        guard let url = URL(string: URLRecipe) else { return }
            UIApplication.shared.open(url)
      print(url)
        }

}
