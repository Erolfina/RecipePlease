//
//  TableViewController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-11.
//

import UIKit

class TableViewController: UITableViewController {
    
    var recipeArray = [Recipes]()
    var researchIngredient = [String]()
    var recipeFiltered = [Recipes]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = readJSONFromFile(forName: "recipes") else { return }
        parse(jsonData: data)
        filterRecipes()
        print(recipeFiltered)
        
       
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
                let recipe = Recipes(title: hit.recipe.label,
                                     imageName: hit.recipe.image,
                                     ingredient: hit.recipe.ingredients,
                                     type: hit.recipe.cuisineType,
                                     time: hit.recipe.totalTime)
                recipeArray.append(recipe)
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    // MARK: - Methods
    
    func filterRecipes() {
 
        researchIngredient.enumerated().forEach { (index, ingredient) in
            
            let recipe = Recipes(title: recipeArray[index].title,
                                 imageName: recipeArray[index].imageName,
                                 ingredient: recipeArray[index].ingredient,
                                 type: recipeArray[index].type,
                                 time: recipeArray[index].time)
        
                recipeArray.forEach { recipe in
                    if recipe.title.contains(ingredient) {
                        recipeFiltered.append(recipe)
                    }
                }
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
                           title: recipeFiltered[indexPath.row].title,
                           time: recipeFiltered[indexPath.row].time,
                           cuisine: recipeFiltered[indexPath.row].type,
                           photos: recipeFiltered[indexPath.row].imageName)
        
        return cell
    }
    
}
