//
//  TableViewController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-11.
//

import UIKit

class RecipeTableViewController: UITableViewController {
    
    var recipeArray = [Recipes]()
    var researchIngredient = [String]()
    var recipeFiltered = [Recipes]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = readJSONFromFile(forName: "recipes") else { return }
        parse(jsonData: data)
        filterRecipes()
    }
    
    // MARK: - JSON
    func readJSONFromFile(forName fileName: String) -> Data? {  // lire le fichier json
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                let jsonData = try String(contentsOfFile: path).data(using: .utf8)
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Questions.self, from: jsonData)
            
            //boucle sur le tqblequ de hit
            for hit in decodedData.hits {
                
                //on let recipe =  Recipes
                let recipe = Recipes(titleRecipe: hit.recipe.label,
                                     imageName: hit.recipe.image,
                                     ingredient: hit.recipe.ingredients,
                                     ingredientLines: hit.recipe.ingredientLines,
                                     typeCuisine: hit.recipe.cuisineType,
                                     timeCooking: hit.recipe.totalTime,
                                     urlRecipe: hit.recipe.url)
                recipeArray.append(recipe)
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    // MARK: - Methods
    
    func filterRecipes() {
        
        if researchIngredient != [""] {
            
            researchIngredient.enumerated().forEach { (index, ingredient) in
                
                let recipe = Recipes(titleRecipe: recipeArray[index].titleRecipe,
                                     imageName: recipeArray[index].imageName,
                                     ingredient: recipeArray[index].ingredient,
                                     ingredientLines: recipeArray[index].ingredientLines,
                                     typeCuisine: recipeArray[index].typeCuisine,
                                     timeCooking: recipeArray[index].timeCooking,
                                     urlRecipe:recipeArray[index].urlRecipe)
                
                recipeArray.forEach { recipe in
                    if recipe.titleRecipe.contains(ingredient) {
                        recipeFiltered.append(recipe)
                        
                    }
                }
            }
        } else {
            recipeFiltered = recipeArray
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return recipeFiltered.count
      
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
     
        cell.configureCell(ingredients: recipeFiltered[indexPath.row].ingredient,
                           title: recipeFiltered[indexPath.row].titleRecipe,
                           time: recipeFiltered[indexPath.row].timeCooking,
                               cuisine: recipeFiltered[indexPath.row].typeCuisine,
                               photos: recipeFiltered[indexPath.row].imageName)
            
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //creer un UIcontroller
        guard let recipeVC = storyboard?.instantiateViewController(withIdentifier: "recipeVC") as? RecipeViewController else { return }
        let ingredients = recipeFiltered[indexPath.row].ingredientLines
        recipeVC.ingredientsList.append(contentsOf: ingredients)
        recipeVC.imageName = recipeFiltered[indexPath.row].imageName
        recipeVC.URLRecipe = recipeFiltered[indexPath.row].urlRecipe
        present(recipeVC, animated: true)
    }
}
