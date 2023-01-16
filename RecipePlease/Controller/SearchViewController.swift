//
//  ViewController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-09.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelIngredients: UILabel!
    var ingredientsInFridge: [String] = [""]
    var listIngrendient = ""
    var recipeArray = [Recipe]()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelIngredients.text = ""
    }
    
    //MARK: Methods
    @IBAction func addIngredients(_ sender: Any) {
        textField.clearButtonMode = .always
        guard let ingredient = textField.text else { return }
        textField.text = ""
        ingredientsInFridge.append(ingredient)
        labelIngredients.text! +=  ingredient+"\n"
    }
    
    @IBAction func clearList(_ sender: Any) {
        ingredientsInFridge = [""]
        labelIngredients.text = ""
    }
   
    @IBAction func searchButtonDidClick(_ sender: Any) {
        guard let recipeTableVC = storyboard?.instantiateViewController(withIdentifier: "recipeTableVC") as? RecipeTableViewController else { return }
        //variable du new VC = variable du VC actuel
        recipeTableVC.researchIngredient = ingredientsInFridge
        show(recipeTableVC, sender: sender)
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    //MARK: Methods Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dismiss(_ sender: UITapGestureRecognizer) {
         textField.resignFirstResponder()
    }
}
